// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tasksync/Constants/FirebaseConstants.dart';
import 'package:tasksync/Constants/FirebaseProviders.dart';
import 'package:tasksync/Error%20Handle/Failure.dart';
import 'package:tasksync/Error%20Handle/type_def.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/Projects_riverpod/ProjetsModules.dart';

final projectsRepositoryProvider = Provider((ref) {
  return ProjectsRepository(firebaseFirestore: ref.watch(firestoreProvider));
});

class ProjectsRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProjectsRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  CollectionReference get _longProjects =>
      _firebaseFirestore.collection(FirebsaeConstansts.longProjectsCollection);

  CollectionReference get _shortProjects =>
      _firebaseFirestore.collection(FirebsaeConstansts.shortProjectsCollection);

  FutureVoid createShortProjects(ShortPModules _shortmodules) async {
    try {
      return right(_shortProjects
          .doc(_shortmodules.projectsUid)
          .set(_shortmodules.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid createLongProjects(
    LongPModules _modules,
  ) async {
    try {
      return right(
          _longProjects.doc(_modules.projectsUid).set(_modules.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid editProjects(
    LongPModules _modules,
  ) async {
    try {
      return right(
          _longProjects.doc(_modules.projectsUid).update(_modules.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<LongPModules>> fetchShortProjects() {
    return _longProjects.snapshots().map((querySnapshot) => querySnapshot.docs
        .map((doc) => LongPModules.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
