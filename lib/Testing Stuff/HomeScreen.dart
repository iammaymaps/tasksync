import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/Authentication/Auth%20Controller/AuthController.dart';
import 'package:tasksync/Error%20Handle/ErrorText.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/Projects_riverpod/ProjectsController.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/DottedBorder.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/LongProjets.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/ProjectsButton.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/ShortProject.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/refLongProjects.dart';

class HomeFeedScreen extends ConsumerStatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends ConsumerState<HomeFeedScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isEmpty = false;
    final user = ref.watch(userProvider)!;
    return Scaffold(
      body: ref.watch(userLongProjectProvider).when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final projects = data[index];
                return LongProjectBox(
                    projectsTitel: projects.projectsTitel,
                    projectsDescription: projects.projectsDescription);
              }),
          error: (error, StackTrace) => ErrorText(error: error.toString()),
          loading: () => const CircularProgressIndicator()),
    );
  }
}
