part of 'task_bloc.dart';

/// Clase sellada de la tareas
sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

// Evento obtener listado tareas
class GetTasksEvent extends TaskEvent {
  const GetTasksEvent();
}

/// Evento obtener listado tareas exitoso
class GetTasksSuccessEvent extends TaskEvent {
  const GetTasksSuccessEvent(this.dictionary);
  final Map<String, TaskModel> dictionary;
}

/// Evento obtener listado tareas erroneo
class GetTasksErrorEvent extends TaskEvent {
  const GetTasksErrorEvent(this.message);
  final String message;
}

/// Evento crear tarea
class CreateTaskEvent extends TaskEvent {
  const CreateTaskEvent(this.task);
  final TaskModel task;
}

/// Evento editar tarea
class EditTaskEvent extends TaskEvent {
  const EditTaskEvent(this.task);
  final TaskModel task;
}

/// Evento eliminar tarea
class DeleteTaskEvent extends TaskEvent {
  const DeleteTaskEvent(this.id);
  final String id;
}
