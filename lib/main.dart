import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routemaster/routemaster.dart';
import 'package:tasksync/Authentication/Auth%20Controller/AuthController.dart';
import 'package:tasksync/Error%20Handle/ErrorText.dart';
import 'package:tasksync/Navigation/routes.dart';
import 'package:tasksync/modules/UserModules.dart';
import 'Authentication/Auth Screens/GoogleLoginScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//ToDo : Navigation test
  runApp(ProviderScope(
    child: DevicePreview(
      builder: ((context) => const MyAPP()),
      enabled: !kReleaseMode,
    ),
  ));

  // await UnityAds.init(
  //   gameId: '5423109',
  //   onComplete: () => print('Initialization Complete'),
  //   onFailed: (error, message) =>
  //       print('Initialization Failed: $error $message'),
  // );
}

class MyAPP extends ConsumerStatefulWidget {
  const MyAPP({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAPPState();
}

class _MyAPPState extends ConsumerState<MyAPP> {
  UserModules? userModules;

  void getData(WidgetRef widgetRef, User data) async {
    userModules = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModules);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) {
            if (data != null) {
              getData(ref, data);
              if (userModules != null) {
                return ScreenUtilInit(
                  minTextAdapt: true,
                  splitScreenMode: true,
                  designSize: Size(360, 800),
                  child: MaterialApp.router(
                    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
                    debugShowCheckedModeBanner: false,
                    routerConfig: loggedInRoute,
                  ),
                );
              }
            }
            return ScreenUtilInit(
              minTextAdapt: true,
              splitScreenMode: true,
              designSize: Size(360, 800),
              child: MaterialApp.router(
                theme: ThemeData(scaffoldBackgroundColor: Colors.white),
                debugShowCheckedModeBanner: false,
                routerConfig: loggedOutRoute,
              ),
            );
          },
          error: (error, StackTrace) => ErrorText(error: error.toString()),
          loading: () => CircularProgressIndicator(),
        );
  }
}
