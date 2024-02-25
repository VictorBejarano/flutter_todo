part of 'task_bloc.dart';

// Clase sellada del estado de la tarea
sealed class TaskState extends Equatable {
  const TaskState(this.dictionary, this.messageError);
  final Map<String, TaskModel> dictionary;
  final String messageError;

  @override
  List<Object> get props => [messageError];
}

/// Estado tarea inicial
final class TaskInitial extends TaskState {
  const TaskInitial(super.dictionary, super.messageError);
}

/// Estado Obtener listado en progreso
final class GetTaskInProgress extends TaskState {
  const GetTaskInProgress(super.dictionary, super.messageErrorZ);
}

/// Estado Obtener listado ha sido exitoso
final class GetTaskSuccess extends TaskState {
  const GetTaskSuccess(super.dictionary, super.messageError);
}

/// Estado Obtener listado tiene error
final class GetTaskError extends TaskState {
  const GetTaskError(super.dictionary, super.messageError);
}
