import 'package:flutter/material.dart';

class ProjectsModules {
  final String projectsTitel;
  final String? descriptionTitel;
  final String? fileUrl;
  final TimeOfDay? shortTime;
  final DateTime? longTime;
  final String uid;
  ProjectsModules({
    required this.projectsTitel,
    this.descriptionTitel,
    required this.fileUrl,
    required this.uid,
    this.shortTime,
    this.longTime,
  });

  ProjectsModules copyWith({
    String? projectsTitel,
    String? descriptionTitel,
    String? fileUrl,
    String? uid,
    TimeOfDay? shortTime,
    DateTime? longTime,
  }) {
    return ProjectsModules(
      projectsTitel: projectsTitel ?? this.projectsTitel,
      descriptionTitel: descriptionTitel ?? this.descriptionTitel,
      fileUrl: fileUrl ?? this.fileUrl,
      uid: uid ?? this.uid,
      shortTime: shortTime ?? this.shortTime,
      longTime: longTime ?? this.longTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectsTitel': projectsTitel,
      'descriptionTitel': descriptionTitel,
      'fileUrl': fileUrl,
      'uid': uid,
      'shortTime': {'hour': shortTime!.hour, 'minute': shortTime!.minute},
      'longTime': longTime?.millisecondsSinceEpoch,
    };
  }

  factory ProjectsModules.fromMap(Map<String, dynamic> map) {
    return ProjectsModules(
      projectsTitel: map['projectsTitel'] ?? "",
      uid: map['uid'] ?? '',
      descriptionTitel: map['descriptionTitel'],
      fileUrl: map['fileUrl'],
      shortTime: TimeOfDay(
        hour: map['shortTime']['hour'],
        minute: map['shortTime']['minute'],
      ),
      longTime: DateTime.fromMillisecondsSinceEpoch(map['longTime']),
    );
  }

  @override
  bool operator ==(covariant ProjectsModules other) {
    if (identical(this, other)) return true;

    return other.projectsTitel == projectsTitel &&
        other.descriptionTitel == descriptionTitel &&
        other.fileUrl == fileUrl &&
        other.uid == uid &&
        other.shortTime == shortTime &&
        other.longTime == longTime;
  }

  @override
  int get hashCode {
    return projectsTitel.hashCode ^
        descriptionTitel.hashCode ^
        fileUrl.hashCode ^
        uid.hashCode ^
        shortTime.hashCode ^
        longTime.hashCode;
  }
}
