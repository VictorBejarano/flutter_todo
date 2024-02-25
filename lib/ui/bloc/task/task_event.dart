part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class GetTasksEvent extends TaskEvent {
  const GetTasksEvent();
}

class GetTasksSuccessEvent extends TaskEvent {
  const GetTasksSuccessEvent(this.dictionary);
  final Map<String, TaskModel> dictionary;
}

class GetTasksErrorEvent extends TaskEvent {
  const GetTasksErrorEvent(this.message);
  final String message;
}
