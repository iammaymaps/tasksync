import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Authentication/Auth Screens/GoogleLoginScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize:  Size(360, 800),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: GoogleLoginScreen(),
      ),
    );
  }
}
