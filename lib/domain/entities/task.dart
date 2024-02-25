import 'package:equatable/equatable.dart';
import 'package:flutter_todo/data/models/models.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String employeeName;
  final String endDate;
  final String observations;
  final TaskStateEnum state;

  const Task({
    required this.id,
    required this.title,
    required this.employeeName,
    required this.endDate,
    required this.observations,
    required this.state,
  });

  @override
  List<Object> get props =>
      [id, title, employeeName, endDate, observations, state];
}
