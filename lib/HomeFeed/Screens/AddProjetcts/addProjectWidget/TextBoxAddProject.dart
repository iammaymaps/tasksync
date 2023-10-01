// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasksync/PubAcesss/Colors.dart';

class AddBoxText extends ConsumerStatefulWidget {
  const AddBoxText({
    required this.textEditingController,
    required this.profileName,
    required this.boxheadName,
  });

  final TextEditingController textEditingController;
  final String profileName;
  final String boxheadName;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddBoxTextState();
}

class _AddBoxTextState extends ConsumerState<AddBoxText> {
  bool isSelected = true;
  int _maxLength = 30;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              widget.boxheadName,
              style: GoogleFonts.lexend(
                  color: borderHederBoxText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        GestureDetector(
          onTap: _toggleSelection,
          child: Container(
            height: 45.h,
            width: 320.w,
            decoration: ShapeDecoration(
                color: isSelected ? defaultBox : Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: defaultBoxBorder),
                    borderRadius: BorderRadius.circular(8))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Expanded(
                child: TextField(
                  onChanged: (text) {
                    isSelected = false;
                    if (text.length > _maxLength) {
                      setState(() {
                        widget.textEditingController.text =
                            text.substring(0, _maxLength);
                        widget.textEditingController.selection =
                            TextSelection.collapsed(offset: _maxLength);
                      });
                    }
                  },
                  // Replace Text widget with TextField widget
                  decoration: InputDecoration(
                    hintText: widget.profileName,
                    border: InputBorder.none,
                  ),

                  controller: widget.textEditingController,
                  style: GoogleFonts.lexend(
                    color:  isSelected ?defaultBoxText: borderSelectedBoxText ,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
