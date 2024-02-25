part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState(this.dictionary, this.messageError);
  final Map<String, TaskModel> dictionary;
  final String messageError;

  @override
  List<Object> get props => [messageError];
}

final class TaskInitial extends TaskState {
  const TaskInitial(super.dictionary, super.messageError);
}

final class GetTaskInProgress extends TaskState {
  GetTaskInProgress() : super({}, '');
}

final class GetTaskSuccess extends TaskState {
  const GetTaskSuccess(super.dictionary, super.messageError);
}

final class GetTaskError extends TaskState {
  const GetTaskError(super.dictionary, super.messageError);
}
