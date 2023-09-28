// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.chevron_left_rounded,
            color: Colors.black,
            size: 30.r,
          ),
          Text(
            "previous",
            style: GoogleFonts.lexend(
                color: Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
