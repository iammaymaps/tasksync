import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/addProjectWidget/TextBoxAddProject.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/addProjectWidget/attachmentsWidget.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/DateBox.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/ProjectsButton.dart';
import 'package:tasksync/Navigation/BackButtonWidget.dart';
import 'package:tasksync/PubAcesss/Colors.dart';

//TODOL : Datepicker , and short screen

class ShortProjectsScreen extends ConsumerStatefulWidget {
  const ShortProjectsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ShortProjectsScreenState();
}

class _ShortProjectsScreenState extends ConsumerState<ShortProjectsScreen> {
  TextEditingController titelController = TextEditingController();
  TextEditingController descriptionlController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
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
                  height: 15.h,
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
                InkWell(
                  onTap: () async {
                    final TimeOfDay? datetme = await showTimePicker(
                        context: context, initialTime: selectedTime);

                    if (datetme != null) {
                      setState(() {
                        selectedTime = datetme;
                      });
                    }
                  },
                  child: DateBoxWidget(
                    profileName:
                        "${selectedTime.hour} : ${selectedTime.minute}",
                    textcolor: borderBoxText,
                    bordercolor: borderBox,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ProjectsButton(onPressed: () {})
              ]),
            )));
  }
}
