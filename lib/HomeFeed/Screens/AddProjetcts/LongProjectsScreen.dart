import 'dart:io';
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

//TODOL : Filer picker Probleam

class LongProjectsScreen extends ConsumerStatefulWidget {
  const LongProjectsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LongProjectsScreenState();
}

void navigateToAddShortProjects(BuildContext context) {
  Routemaster.of(context).push('/shortprojects');
}

class _LongProjectsScreenState extends ConsumerState<LongProjectsScreen> {
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

  void editPeojects(BuildContext context) {
    ref.read(projectsContontrollerProvider.notifier).editProjects(
        projectsTitel: projectsTitel,
        descriptionTitel: descriptionTitel,
        fileUrl: fileUrl,
        Date: Date,
        Month: Month,
        Year: Year,
        context: context);
  }

  TextEditingController titelController = TextEditingController();
  TextEditingController descriptionlController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void createLongProject(BuildContext context) {
    if (titelController.text.trim().length > 3 ||
        descriptionlController.text.trim().length > 3 ||
        selectedDate != null) {
      ref.read(projectsContontrollerProvider.notifier).createLongProjects(
          projectsTitel: titelController.text.trim(),
          descriptionTitel: descriptionlController.text.trim(),
          fileUrl: docF,
          Date: selectedDate.day,
          Month: selectedDate.month,
          Year: selectedDate.year,
          context: context);
    } else {
      showSnackbar(
          context, 'You must satisfy all prerequisites before proceeding.');
    }
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titelController.dispose();
    descriptionlController.dispose();
  }

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
    final formattedDate = DateFormat('d, MMMM y').format(selectedDate);
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
                          context.go('/shortProjects');
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
                    insideBoxText: "Enter Project Title",
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
                InkWell(
                  onTap: () async {
                    final DateTime? datetme = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(3000));

                    if (datetme != null) {
                      setState(() {
                        selectedDate = datetme;
                      });
                    }
                  },
                  child: DateBoxWidget(
                    profileName:
                        (selectedDate != null) ? formattedDate : "MM:DD:Y",
                    textcolor: borderBoxText,
                    bordercolor: borderBox,
                  ),
                ),
                GestureDetector(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                ),
                SizedBox(
                  height: 5.h,
                ),
                ProjectsButton(onPressed: () {
                  createLongProject(context);
                })
              ]),
            )));
  }
}
