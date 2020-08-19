// To parse this JSON data, do
//
//     final userRegister = userRegisterFromJson(jsonString);

import 'dart:convert';

UserRegister userRegisterFromJson(String str) =>
    UserRegister.fromJson(json.decode(str));

String userRegisterToJson(UserRegister data) => json.encode(data.toJson());

class UserRegister {
  UserRegister({
    this.error,
    this.errorMsg,
  });

  bool error;
  String errorMsg;

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
        error: json["error"],
        errorMsg: json["error_msg"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "error_msg": errorMsg,
      };
}
