import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

class ProjectsButton extends StatelessWidget {
  const ProjectsButton({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        "Add projects",
        style: GoogleFonts.lexend(
            color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w400),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(330.w, 55.h),
          backgroundColor: blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r))),
    );
  }
}
