import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';
import 'package:tasksync/Error%20Handle/SnackBar/snackBar.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/Projects_riverpod/ProjectsController.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/addProjectWidget/TextBoxAddProject.dart';

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

  TimeOfDay selectedTime = TimeOfDay.now();

  void navigateToAddlongProjects(BuildContext context) {
    Routemaster.of(context).push('/longprojects');
  }

  void createShortProject(BuildContext context) {
    if (titelController.text.trim().length > 3 || selectedTime != null) {
      ref.read(projectsContontrollerProvider.notifier).createShortProjects(
          projectsTitel: titelController.text.trim(),
          Hour: selectedTime.hour,
          minutes: selectedTime.minute,
          context: context);
    } else {
      showSnackbar(
          context, 'You must satisfy all prerequisites before proceeding.');
    }
  }

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
                  onPressed: () {
                    context.go('/');
                  },
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
                          context.go('/longProjects');
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
                        "${DateFormat('hh:mm a').format(DateTime(1, 1, 1, selectedTime.hour, selectedTime.minute))}",
                    textcolor: borderBoxText,
                    bordercolor: borderBox,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ProjectsButton(onPressed: () {
                  createShortProject(context);
                })
              ]),
            )));
  }
}
