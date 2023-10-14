import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}

Future<File?> pickFile(BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt', 'jpg', 'jpeg', 'png']);
  if (result != null ) {

    
    File file = File(result.files.single.path!);
    int filesize = await file.length();

    if (filesize <= 100 * 1024) {
      return file;
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('File size cannot exceed 100KB.'),
            duration: Duration(seconds: 3),
          ),
        );
    }
  }
  return null;
}
