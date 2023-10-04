import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/Error%20Handle/SnackBar/snackBar.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

class AttachmentsWidget extends StatefulWidget {
  const AttachmentsWidget({super.key});


  @override
  State<AttachmentsWidget> createState() => _AttachmentsWidgetState();
}

class _AttachmentsWidgetState extends State<AttachmentsWidget> {
  File? docF;

  void selectFile() async {
    final res = await pickFile(context);

    if (res != null) {
      setState(() {
        docF = File(res.path!);
      });
    }
  }

  void deleteFile() {
    setState(() {
      docF = null;
    });
  }

  String formatFileSize(int bytes) {
    const int KB = 1024;
    const int MB = 1024 * 1024;
    if (bytes < KB) {
      return '$bytes B';
    } else if (bytes < MB) {
      final FileSizeInKb = bytes / KB;
      return "${FileSizeInKb.toStringAsFixed(2)}KB";
    } else {
      final FileSizeInMb = bytes / MB;
      return "${FileSizeInMb.toStringAsFixed(2)}MB";
    }
  }

  bool isAttach = false;
  @override
  Widget build(BuildContext context) {
    String? fileName;
    String? fileSize;

    if (docF != null) {
      fileName = docF!.path.split('/').last;
      final bytes = docF!.lengthSync();
      fileSize = formatFileSize(bytes);
    }

    String text = fileName ?? "";
    String truncatedText =
        text.length > 20 ? text.substring(0, 20) + "..." : text;
    return GestureDetector(
      onTap: selectFile,
      child: Column(
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
            child: docF != null
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
                            fileSize ?? "",
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
                        onPressed: deleteFile,
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
      ),
    );
  }
}
