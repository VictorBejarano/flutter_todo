import 'dart:convert';

import 'package:flutter_todo/data/models/models.dart';
import 'package:flutter_todo/domain/domain.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

class TaskModel extends Task {
  const TaskModel({
    required super.id,
    required super.title,
    required super.employeeName,
    required super.endDate,
    required super.observations,
    required super.state,
  });

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

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        employeeName: json["employee_name"],
        endDate: json["end_date"],
        observations: json["observations"],
        state: TaskModel._convertStringToEnum(json["state"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "employee_name": employeeName,
        "end_date": endDate,
        "observations": observations,
        "state": _convertEnumToString(state),
      };

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
