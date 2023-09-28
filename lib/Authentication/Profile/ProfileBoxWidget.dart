// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasksync/PubAcesss/Colors.dart';

class ProfileBoxDefault extends StatelessWidget {
  const ProfileBoxDefault({
    Key? key,
    required this.profileTitel,
    required this.profileName,
  }) : super(key: key);
  final String profileTitel;
  final String profileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profileTitel,
          style:
              GoogleFonts.lexend(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          width: 320.h,
          height: 45.w,
          decoration: ShapeDecoration(
              color: defaultBox,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: defaultBoxBorder),
                  borderRadius: BorderRadius.circular(10))),
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
                            color: defaultBoxText,
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
          height: 30,
        )
      ],
    );
  }
}
