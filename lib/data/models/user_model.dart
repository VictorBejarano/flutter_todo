import 'dart:convert';

import 'package:flutter_todo/domain/entities/user.dart';

/// Crea instancia de UserModel a partir de json
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

/// Modelo del usuario
class UserModel extends User {
  /// Crea una instancia de UserModel
  const UserModel({
    required super.email,
    required super.password,
    required super.isActive,
  });

  /// Crea [UserModel] a partir de json
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        isActive: json["is_active"],
      );
}
