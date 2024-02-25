import 'dart:convert';

import 'package:flutter_todo/data/models/models.dart';
import 'package:flutter_todo/domain/domain.dart';

/// Crea instancia de TaskModel a partir de json
TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

/// Modelo de la tarea
class TaskModel extends Task {
  /// Crea una instancia de TaskModel
  const TaskModel({
    required super.id,
    required super.title,
    required super.employeeName,
    required super.endDate,
    required super.observations,
    required super.state,
  });

  /// Convierte el valor texto a enum [TaskStateEnum]
  static TaskStateEnum _convertStringToEnum(String value) {
    switch (value) {
      case 'complete':
        return TaskStateEnum.complete;
      case 'in_progress':
        return TaskStateEnum.inProgress;
      case 'pending':
        return TaskStateEnum.pending;
      default:
        throw ArgumentError('Invalid enum value: $value');
    }
  }

  /// Convierte el valor enum [TaskStateEnum] a valor string
  static String _convertEnumToString(TaskStateEnum value) {
    switch (value) {
      case TaskStateEnum.complete:
        return 'complete';
      case TaskStateEnum.inProgress:
        return 'in_progress';
      case TaskStateEnum.pending:
        return 'pending';
      default:
        throw ArgumentError('Invalid enum value: $value');
    }
  }

  /// Crea [TaskModel] a partir de json
  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        employeeName: json["employee_name"],
        endDate: json["end_date"],
        observations: json["observations"],
        state: TaskModel._convertStringToEnum(json["state"]),
      );

  /// Crea json a partir de [TaskModel]
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "employee_name": employeeName,
        "end_date": endDate,
        "observations": observations,
        "state": _convertEnumToString(state),
      };

  /// Copia el [TaskModel]
  TaskModel copyWith({
    String? id,
    String? title,
    String? employeeName,
    String? endDate,
    String? observations,
    TaskStateEnum? state,
  }) =>
      TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        employeeName: employeeName ?? this.employeeName,
        endDate: endDate ?? this.endDate,
        observations: observations ?? this.observations,
        state: state ?? this.state,
      );
}
