import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasksync/Constants/DesignConstants.dart';
import 'package:tasksync/Constants/FirebaseConstants.dart';
import 'package:tasksync/Constants/FirebaseProviders.dart';
import 'package:tasksync/Error%20Handle/Failure.dart';
import 'package:tasksync/Error%20Handle/type_def.dart';
import 'package:tasksync/modules/UserModules.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: ref.read(authProvider),
    firebaseFirestore: ref.read(firestoreProvider),
    googleSignIn: ref.read(googlesigninProvider)));

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firebaseFirestore;
  final GoogleSignIn _googleSignIn;
  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firebaseFirestore,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firebaseFirestore = firebaseFirestore,
        _googleSignIn = googleSignIn;
  CollectionReference get _user =>
      _firebaseFirestore.collection(FirebsaeConstansts.userCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Stream<UserModules> getUserData(String uid) {
    return _user.doc(uid).snapshots().map(
        (event) => UserModules.fromMap(event.data() as Map<String, dynamic>));
  }

  FutureEither<UserModules> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();

      final googleAuth = await googleuser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      UserModules userModules;

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModules = UserModules(
            name: userCredential.user!.displayName ?? 'anonymous',
            email: userCredential.user!.email ?? 'anonymous@gmail.com',
            profilePic: userCredential.user!.photoURL ??
                DesignConstants.anonymousProfile,
            uid: userCredential.user!.uid,
            isAuthenticated: true);
        await _user.doc(userCredential.user!.uid).set(userModules.toMap());
      } else {
        userModules = await getUserData(userCredential.user!.uid).first;
      }
      return right(userModules);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
