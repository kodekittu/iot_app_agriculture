// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.error,
    this.userId,
    this.userUserName,
    this.deviceId,
  });

  bool error;
  int userId;
  String userUserName;
  int deviceId;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        error: json["error"],
        userId: json["user_id"],
        userUserName: json["user_user_name"],
        deviceId: json["device_id"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "user_id": userId,
        "user_user_name": userUserName,
        "device_id": deviceId,
      };
}
