import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/Authentication/Auth%20Controller/AuthController.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/DottedBorder.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/LongProjets.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/ShortProject.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

class HomeFeed extends ConsumerStatefulWidget {
  const HomeFeed({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeFeedState();
}

class _HomeFeedState extends ConsumerState<HomeFeed> {
  @override
  Widget build(BuildContext context) {
    final bool isEmpty = true;
    final user = ref.watch(userProvider)!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user.profilePic,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    user.name,
                    style: GoogleFonts.lexend(
                        fontSize: 25.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 50.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mini Projects",
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
                      BorderText: "Mini Projects are currently void",
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShortProjects(),
                        ],
                      ),
                    ),
              SizedBox(
                height: 30.w,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Big projects",
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
                      BorderText: "Big projects are currently void",
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [LongProjects()],
                      ),
                    ),

              SizedBox(
                height: 50.h,
              ),

              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add projects",
                  style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(330.w, 55.h),
                    primary: blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
