// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasksync/PubAcesss/Colors.dart';

class DottedBorderWidget extends StatelessWidget {
  const DottedBorderWidget({
    Key? key,
    required this.BorderText,
  }) : super(key: key);

  final String BorderText;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 3.w,
      color: borderBox,
      dashPattern: [10, 3],
      radius: Radius.circular(10.r),
      child: SizedBox(
        width: 316.w,
        height: 165.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 230.w,
              child: Text(
                textAlign: TextAlign.center,
                BorderText,
                style: GoogleFonts.lexend(
                    color: borderBoxText,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
