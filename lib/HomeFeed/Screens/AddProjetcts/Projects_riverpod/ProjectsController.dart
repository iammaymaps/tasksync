import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tasksync/Constants/storageProvider.dart';
import 'package:tasksync/Error%20Handle/SnackBar/snackBar.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/Projects_riverpod/ProjectRepository.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/Projects_riverpod/ProjetsModules.dart';
import 'package:uuid/uuid.dart';

final projectsContontrollerProvider =
    StateNotifierProvider<ProjetsController, bool>((ref) {
  final projectRepository = ref.watch(projectsRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return ProjetsController(
      projectsRepository: projectRepository,
      ref: ref,
      storageRepository: storageRepository);
});

final userLongProjectProvider = StreamProvider<List<LongPModules>>((
  ref,
) {
  final projetsController = ref.watch(projectsContontrollerProvider.notifier);
  return projetsController.fetchShortProjects();
});

class ProjetsController extends StateNotifier<bool> {
  final ProjectsRepository _projectsRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;

  ProjetsController({
    required ProjectsRepository projectsRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _projectsRepository = projectsRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false) {}

  void createShortProjects(
      {required String projectsTitel,
      required int Hour,
      required int minutes,
      required BuildContext context}) async {
    if (projectsTitel.isNotEmpty) {
      state = true;

      String projectsId = const Uuid().v1();

      final ShortPModules shortModules = ShortPModules(
          projectsTitel: projectsTitel,
          projectsUid: projectsId,
          Hour: Hour,
          minutes: minutes);
      state = false;

      final res = await _projectsRepository.createShortProjects(shortModules);
      res.fold((l) {
        showSnackbar(context, l.message);
      }, (r) {
        context.go('/');

        showSnackbar(context, 'Posted successfully!');
      });
    }
  }

  void createLongProjects(
      {required String projectsTitel,
      required String descriptionTitel,
      required File? fileUrl,
      required int Date,
      required int Month,
      required int Year,
      required BuildContext context}) async {
    if (projectsTitel.isNotEmpty && descriptionTitel.isNotEmpty) {
      state = true;
      String projectsId = const Uuid().v1();

      await _storageRepository.storeFile(
          path: 'longProject/${projectsTitel}', id: projectsId, file: fileUrl);

      final LongPModules modules = LongPModules(
          projectsTitel: projectsTitel,
          projectsDescription: descriptionTitel,
          projectsUid: projectsId,
          fileId: fileUrl.toString(),
          month: Month,
          date: Date,
          year: Year);
      state = false;

      final res = await _projectsRepository.createLongProjects(modules);
      res.fold((l) {
        showSnackbar(context, l.message);
      }, (r) {
        context.go('/');

        showSnackbar(context, 'Posted successfully!');
      });
    } else {
      showSnackbar(
          context, 'You must satisfy all prerequisites before proceeding.');
    }
  }

  Stream<List<LongPModules>> fetchShortProjects() {
    return _projectsRepository.fetchShortProjects();
  }
}
