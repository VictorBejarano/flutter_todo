import 'package:equatable/equatable.dart';
import 'package:flutter_todo/data/models/models.dart';

/// Endidad de tareas
///   Parámetros:
///   * [id] Id de la tarea
///   * [title] Titulo de la tarea
///   * [employeeName] Nombre del empleado
///   * [endDate] fecha de entrega
///   * [observations] Observaciones
///   * [state] Estado de la tarea
class Task extends Equatable {
  final String id;
  final String title;
  final String employeeName;
  final String endDate;
  final String observations;
  final TaskStateEnum state;

  /// Crea una instancia de Task
  const Task({
    required this.id,
    required this.title,
    required this.employeeName,
    required this.endDate,
    required this.observations,
    required this.state,
  });

  /// Props de Equatable
  @override
  List<Object> get props =>
      [id, title, employeeName, endDate, observations, state];
}
