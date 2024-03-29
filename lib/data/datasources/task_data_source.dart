import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_todo/data/models/models.dart';

/// Fuente de datos de tareas
class TaskDataSource {
  /// Obtiene el listado de tareas
  static Future<Map<String, TaskModel>> getTaskList() async {
    Map<String, TaskModel> response = {};
    final String jsonString =
        await rootBundle.loadString('assets/json/task.json');
    await Future.delayed(const Duration(seconds: 1));
    final jsonResponse = json.decode(jsonString);
    for (var item in (jsonResponse as List<dynamic>)) {
      TaskModel user = TaskModel.fromJson(item);
      response.addEntries([MapEntry(user.id, user)]);
    }
    return response;
  }
}
