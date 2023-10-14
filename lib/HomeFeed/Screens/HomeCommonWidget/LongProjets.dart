import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:readmore/readmore.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

class LongProjects extends ConsumerStatefulWidget {
  const LongProjects({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LongProjectsState();
}

class _LongProjectsState extends ConsumerState<LongProjects> {
  bool isDoneProjects = false;
  double percent = 0.1;
  void doneProjects() {
    setState(() {
      isDoneProjects = !isDoneProjects;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300.w,
          height: 200.h,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: isDoneProjects ? bluedark : blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.r),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [SvgPicture.asset("public/images/Doc Icon.svg")],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 210.w,
                    child: Text(
                      "I wanna surprises my mom",
                      style: GoogleFonts.lexend(
                          color: isDoneProjects
                              ? Colors.white.withAlpha(150)
                              : Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    width: 230.w,
                    child: ReadMoreText(
                      "Collect old photographs, letters, and any other memorabilia that hold sentimental value. These could include family vacations, special occasions, or even handwritten notes. Choose a variety of moments that will evoke emotions and create a sense of nostalgia.",
                      style: GoogleFonts.lexend(
                          color: isDoneProjects
                              ? Colors.white.withAlpha(150)
                              : Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                      trimLength: 70,
                      trimCollapsedText: 'Read more',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 272.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LinearPercentIndicator(
                          lineHeight: 5.h,
                          width: 200.w,
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
