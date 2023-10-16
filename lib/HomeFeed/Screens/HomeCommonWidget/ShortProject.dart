import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:tasksync/PubAcesss/Colors.dart';

class ShortProjects extends ConsumerStatefulWidget {
  const ShortProjects({
    required this.projectitel,
  });

  final String projectitel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShortProjectsState();
}

class _ShortProjectsState extends ConsumerState<ShortProjects> {
  bool isDoneProjects = false;
  double percent = 0.1;
  void doneProjects() {
    setState(() {
      isDoneProjects = !isDoneProjects;
    });
  }

  // void startTimer() {
  //   const duration = Duration(seconds: 5);
  //   Timer.periodic(duration, (Timer timer) {
  //     setState(() {
  //       percent += 1;
  //       if (percent >= 1.0) {
  //         percent = 1.0;
  //         isDoneProjects = true;
  //         timer.cancel();
  //       }
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
    // if (percent == 1) {
    //   setState(() {
    //     isDoneProjects = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150.w,
          height: 165.h,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: isDoneProjects ? bluedark : blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 115.w,
                child: Text(
                  textAlign: TextAlign.center,
                  "I wanna surprises my mom",
                  style: GoogleFonts.lexend(
                      color: isDoneProjects
                          ? Colors.white.withAlpha(150)
                          : Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 130.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LinearPercentIndicator(
                      lineHeight: 5.h,
                      width: 90.w,
                      percent: percent,
                      animation: true,
                      curve: Curves.easeIn,
                      progressColor: isDoneProjects
                          ? Colors.white.withAlpha(150)
                          : Colors.white,
                      backgroundColor: Colors.black,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                    ),
                    GestureDetector(
                      onTap: () {
                        doneProjects();
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDoneProjects ? blue : Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
