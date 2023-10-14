import 'dart:convert';

class LongPModules {
  final String projectsTitel;
  final String projectsDescription;
  final String projectsUid;
  final String fileId;
  final int month;
  final int date;
  final int year;
  LongPModules({
    required this.projectsTitel,
    required this.projectsDescription,
    required this.projectsUid,
    required this.fileId,
    required this.month,
    required this.date,
    required this.year,
  });

  LongPModules copyWith({
    String? projectsTitel,
    String? projectsDescription,
    String? projectsUid,
    String? fileId,
    int? month,
    int? date,
    int? year,
  }) {
    return LongPModules(
      projectsTitel: projectsTitel ?? this.projectsTitel,
      projectsDescription: projectsDescription ?? this.projectsDescription,
      projectsUid: projectsUid ?? this.projectsUid,
      fileId: fileId ?? this.fileId,
      month: month ?? this.month,
      date: date ?? this.date,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'projectsTitel': projectsTitel,
      'projectsDescription': projectsDescription,
      'projectsUid': projectsUid,
      'fileId': fileId,
      'month': month,
      'date': date,
      'year': year,
    };
  }

  factory LongPModules.fromMap(Map<String, dynamic> map) {
    return LongPModules(
      projectsTitel: map['projectsTitel'] ?? '',
      projectsDescription: map['projectsDescription'] ?? '',
      projectsUid: map['projectsUid'] ?? '',
      fileId: map['fileId'] ?? '',
      month: map['month']?.toInt() ?? 0,
      date: map['date']?.toInt() ?? 0,
      year: map['year']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LongPModules.fromJson(String source) => LongPModules.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LongPModules(projectsTitel: $projectsTitel, projectsDescription: $projectsDescription, projectsUid: $projectsUid, fileId: $fileId, month: $month, date: $date, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LongPModules &&
      other.projectsTitel == projectsTitel &&
      other.projectsDescription == projectsDescription &&
      other.projectsUid == projectsUid &&
      other.fileId == fileId &&
      other.month == month &&
      other.date == date &&
      other.year == year;
  }

  @override
  int get hashCode {
    return projectsTitel.hashCode ^
      projectsDescription.hashCode ^
      projectsUid.hashCode ^
      fileId.hashCode ^
      month.hashCode ^
      date.hashCode ^
      year.hashCode;
  }
}


class ShortPModules {
    final String projectsTitel;
  final String projectsUid;
  final int Hour;
  final int minutes;
  ShortPModules({
    required this.projectsTitel,
    required this.projectsUid,
    required this.Hour,
    required this.minutes,
  });

  ShortPModules copyWith({
    String? projectsTitel,
    String? projectsUid,
    int? Hour,
    int? minutes,
  }) {
    return ShortPModules(
      projectsTitel: projectsTitel ?? this.projectsTitel,
      projectsUid: projectsUid ?? this.projectsUid,
      Hour: Hour ?? this.Hour,
      minutes: minutes ?? this.minutes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'projectsTitel': projectsTitel,
      'projectsUid': projectsUid,
      'Hour': Hour,
      'minutes': minutes,
    };
  }

  factory ShortPModules.fromMap(Map<String, dynamic> map) {
    return ShortPModules(
      projectsTitel: map['projectsTitel'] ?? '',
      projectsUid: map['projectsUid'] ?? '',
      Hour: map['Hour']?.toInt() ?? 0,
      minutes: map['minutes']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortPModules.fromJson(String source) => ShortPModules.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShortPModules(projectsTitel: $projectsTitel, projectsUid: $projectsUid, Hour: $Hour, minutes: $minutes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShortPModules &&
      other.projectsTitel == projectsTitel &&
      other.projectsUid == projectsUid &&
      other.Hour == Hour &&
      other.minutes == minutes;
  }

  @override
  int get hashCode {
    return projectsTitel.hashCode ^
      projectsUid.hashCode ^
      Hour.hashCode ^
      minutes.hashCode;
  }
}

