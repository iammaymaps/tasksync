import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/Projects_riverpod/ProjectsController.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/LongProjets.dart';

class RefLongProjects extends ConsumerStatefulWidget {
  const RefLongProjects({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RefLongProjectsState();
}

class _RefLongProjectsState extends ConsumerState<RefLongProjects> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userLongProjectProvider).when(data: (data) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final longProjects = data[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: LongProjectBox(
                projectsTitel: longProjects.projectsTitel,
                projectsDescription: longProjects.projectsDescription),
          );
        },
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text('Error: $error'),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
