import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/Authentication/Auth%20Controller/AuthController.dart';
import 'package:tasksync/Authentication/Profile/ProfileBoxWidget.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/DottedBorder.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/LongProjets.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/ShortProject.dart';
import 'package:tasksync/Navigation/BackButtonWidget.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  void logout(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isEmpty = true;

    final user = ref.watch(userProvider)!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              BackButtonWidget(
                onPressed: () {},
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user.profilePic,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              ProfileBoxDefault(profileTitel: "Name", profileName: user.name),
              ProfileBoxDefault(profileTitel: "Email", profileName: user.email),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () => logout(ref),
                child: Text(
                  "Logout",
                  style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(320.w, 50.h),
                    primary: blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Projects History ",
                    style: GoogleFonts.lexend(
                        fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              //Mini Project Start From Hare
              SizedBox(
                height: 15.w,
              ),
              isEmpty
                  ? DottedBorderWidget(
                      BorderText: 'The history of projects is blank.',
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LongProjects(),
                          ShortProjects(),
                          LongProjects(),
                          ShortProjects(),
                          LongProjects(),
                          ShortProjects(),
                          LongProjects(),
                          ShortProjects(),
                          LongProjects(),
                          ShortProjects(),
                          LongProjects(),
                          ShortProjects(),
                        ],
                      ),
                    ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
