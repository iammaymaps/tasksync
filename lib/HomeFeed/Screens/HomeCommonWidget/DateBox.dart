// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasksync/PubAcesss/Colors.dart';

class DateBoxWidget extends StatelessWidget {
  const DateBoxWidget({
    Key? key,
    required this.profileName,
    required this.textcolor,
    required this.bordercolor,
  }) : super(key: key);
  final String profileName;
  final Color textcolor;
  final Color bordercolor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Project Time',
              style: GoogleFonts.lexend(
                  fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 320.h,
          height: 45.w,
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: bordercolor),
                  borderRadius: BorderRadius.circular(8.r))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ClipRRect(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        profileName,
                        style: GoogleFonts.lexend(
                            color: textcolor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        )
      ],
    );
  }
}
