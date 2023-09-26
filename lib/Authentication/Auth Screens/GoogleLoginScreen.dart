import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/Authentication/Auth%20Controller/AuthController.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

class GoogleLoginScreen extends ConsumerStatefulWidget {
  const GoogleLoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends ConsumerState<GoogleLoginScreen> {
  void signInWithGoogle(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signinWithGoogle(context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
                child: Image.asset(
              "public/images/logingirl.png",
              height: 414.h,
              width: 302.w,
            )),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 304.w,
              child: Text('Your Personal Task Manager Achieve Goals',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexendDeca(
                      fontSize: 25.sp, color: Colors.black)),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: 325.w,
              child: Text(
                  "Your personal task manager is here to help you stay organized and boost your productivity",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexendDeca(
                      fontSize: 12.sp, color: Colors.black.withAlpha(150))),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () => signInWithGoogle(ref, context),
              child: Container(
                height: 56.h,
                width: 330.w,
                decoration: ShapeDecoration(
                    color: blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: isLoading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 0.85.r,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Image.asset("public/images/google icon.png"),
                          SizedBox(
                            width: 35.w,
                          ),
                          Text("Continue with Google",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lexendDeca(
                                  fontSize: 17.sp, color: Colors.white)),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
            SizedBox(
              width: 329.w,
              child: Text(
                  "By continuing, you are setting up a TaskSync account and agree to our User Agreement and Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lexendDeca(
                      fontSize: 10.sp, color: Colors.black.withAlpha(150))),
            ),
          ],
        ),
      ),
    );
  }
}
