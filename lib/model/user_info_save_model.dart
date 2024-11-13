import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  String username;
  String password;
  bool rememberPassword;

  UserInfo({
    required this.username,
    required this.password,
    required this.rememberPassword,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    username: json["username"],
    password: json["password"],
    rememberPassword: json["rememberPassword"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "rememberPassword": rememberPassword,
  };
}