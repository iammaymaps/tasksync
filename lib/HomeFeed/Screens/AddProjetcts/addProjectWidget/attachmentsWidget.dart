import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

class AttachmentsWidget extends StatefulWidget {
  const AttachmentsWidget({super.key});

  @override
  State<AttachmentsWidget> createState() => _AttachmentsWidgetState();
}

class _AttachmentsWidgetState extends State<AttachmentsWidget> {
  bool isAttach = false;
  @override
  Widget build(BuildContext context) {
    String text = "My sample of ssssssssssssssssssssssssdesign.pdf";
    String truncatedText =
        text.length > 20 ? text.substring(0, 20) + "..." : text;
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
              'Project Document',
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
              color: defaultBox,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: borderBox),
                  borderRadius: BorderRadius.circular(8.r))),
          child: isAttach
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25.h,
                    ),
                    Icon(
                      Icons.task,
                      color: attatchBox,
                    ),
                    SizedBox(
                      width: 40.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          truncatedText,
                          style: GoogleFonts.lexend(
                              color: attatchBox,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          "75.KB",
                          style: GoogleFonts.lexend(
                              color: attatchBox,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40.h,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        color: cancleRed,
                      ),
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 22.h,
                    ),
                    Icon(
                      Icons.note_add,
                      color: defaultBoxText,
                    ),
                    SizedBox(
                      width: 60.h,
                    ),
                    Text(
                      "Attachments",
                      style: GoogleFonts.lexend(
                          color: defaultBoxText,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
        ),
        SizedBox(
          height: 30.h,
        )
      ],
    );
  }
}
