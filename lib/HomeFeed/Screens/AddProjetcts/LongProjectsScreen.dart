import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/addProjectWidget/TextBoxAddProject.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/DateBox.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/ProjectsButton.dart';
import 'package:tasksync/Navigation/BackButtonWidget.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

//TODOL : Datepicker , and short screen

class LongProjectsScreen extends ConsumerStatefulWidget {
  const LongProjectsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LongProjectsScreenState();
}

class _LongProjectsScreenState extends ConsumerState<LongProjectsScreen> {
  TextEditingController titelController = TextEditingController();
  TextEditingController descriptionlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15.r),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 50.h,
                ),
                BackButtonWidget(
                  onPressed: () {},
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoSwitch(
                        activeColor: blue,
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        }),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "Long Projects",
                      style: GoogleFonts.lexend(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                AddBoxText(
                    textEditingController: titelController,
                    insideBoxText: "Enter Project Title ",
                    boxheadName: 'Title',
                    hight: 45,
                    width: 320,
                    maxLength: 30),
                AddBoxText(
                    textEditingController: descriptionlController,
                    insideBoxText: "Enter Project Title ",
                    boxheadName: 'Projects Description',
                    hight: 130,
                    width: 320,
                    maxLength: 300),
                DateBoxWidget(
                  profileName: 'Pick Project Time',
                  textcolor: borderBoxText,
                  bordercolor: borderBox,
                ),
                SizedBox(
                  height: 50.h,
                ),
                ProjectsButton(onPressed: () {})
              ]),
            )));
  }
}
