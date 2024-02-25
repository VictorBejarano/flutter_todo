import 'dart:convert';

import 'package:flutter_todo/domain/entities/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel extends User {
  const UserModel({
    required super.email,
    required super.password,
    required super.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        isActive: json["is_active"],
      );
}
