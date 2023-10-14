import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/Projects_riverpod/ProjectsController.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/ShortProject.dart';

class HomeFeedScreen extends ConsumerStatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends ConsumerState<HomeFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(userLongProjectProvider).when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final longProjects = data[index];
            return ListTile(
              title: Text(longProjects.projectsTitel),
              subtitle: Text(longProjects.projectsDescription),
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
      }),
    );
  }
}
