class UserModules {
  final String name;
  final String email;
  final String profilePic;
  final String uid;
  final bool isAuthenticated;
  UserModules({
    required this.name,
    required this.email,
    required this.profilePic,
    required this.uid,
    required this.isAuthenticated,
  });

  UserModules copyWith({
    String? name,
    String? email,
    String? profilePic,
    String? uid,
    bool? isAuthenticated,
  }) {
    return UserModules(
      name: name ?? this.name,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'profilePic': profilePic,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory UserModules.fromMap(Map<String, dynamic> map) {
    return UserModules(
        name: map['name'] ?? "",
        email: map['email'] ?? "",
        profilePic: map['profilePic'] ?? "",
        uid: map['uid'] ?? "",
        isAuthenticated: map['isAuthenticated'] ?? bool);
  }

  @override
  String toString() {
    return 'UserModules(name: $name, email: $email, profilePic: $profilePic, uid: $uid, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(covariant UserModules other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.profilePic == profilePic &&
        other.uid == uid &&
        other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        profilePic.hashCode ^
        uid.hashCode ^
        isAuthenticated.hashCode;
  }
}
