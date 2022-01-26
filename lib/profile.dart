import 'dart:io';

class Profile {
  Profile({this.name, this.phoneNo, this.profilePic});

  String? name;
  String? phoneNo;
  File? profilePic;

  Profile copyWith({String? name, String? phoneNo, File? profilePic}) =>
      Profile(
          name: name ?? this.name,
          phoneNo: phoneNo ?? this.phoneNo,
          profilePic: profilePic ?? this.profilePic);
}
