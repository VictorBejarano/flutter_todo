import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_todo/data/models/user_model.dart';

/// Fuente de datos de tareas
class UserDataSource {
  /// Inicializa session
  static Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    final String jsonString =
        await rootBundle.loadString('assets/json/auth.json');
    final jsonResponse = json.decode(jsonString);
    for (var item in (jsonResponse['users'] as List<dynamic>)) {
      UserModel user = UserModel.fromJson(item);
      if (email == user.email && password == user.password) {
        return user.isActive;
      }
      if (email == user.email && password != user.password) {
        throw Exception('Contraseña erronea');
      }
    }
    throw Exception('El usuario no existe');
  }
}
