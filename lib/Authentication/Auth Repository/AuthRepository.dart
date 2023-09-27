// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasksync/Constants/FirebaseConstants.dart';
import 'package:tasksync/Constants/FirebaseProviders.dart';
import 'package:tasksync/Error%20Handle/Failure.dart';
import 'package:tasksync/Error%20Handle/type_def.dart';
import 'package:tasksync/modules/UserModules.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: ref.read(authProvider),
    firestore: ref.read(firestoreProvider),
    googleSignIn: ref.read(googlesigninProvider)));

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;
  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  CollectionReference get _users =>
      _firestore.collection(FirebsaeConstansts.userCollection);

  Stream<UserModules> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModules.fromMap(event.data() as Map<String, dynamic>));
  }

  FutureEither<UserModules> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential usercredential =
          await _auth.signInWithCredential(credential);

      UserModules userModules;

      if (usercredential.additionalUserInfo!.isNewUser) {
        userModules = UserModules(
            name: usercredential.user!.displayName ?? "anonymous",
            email: usercredential.user!.email ?? 'anonymous@gmail.com',
            profilePic:
                usercredential.user!.photoURL ?? "public/images/logingirl.png",
            uid: usercredential.user!.uid,
            isAuthenticated: true);
        await _users.doc(usercredential.user!.uid).set(userModules.toMap());
      } else {
        userModules = await getUserData(usercredential.user!.uid).first;
      }
      return right(userModules);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
      final userProvider = StateProvider((ref) => null);
    }
  }
}
