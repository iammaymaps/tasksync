import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksync/Authentication/Auth%20Controller/AuthController.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {},
              child: const Text("as"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {},
              child: const Text('Banner Ads'),
            ),
          ),
          Text(user.email),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
