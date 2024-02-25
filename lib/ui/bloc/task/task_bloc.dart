import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo/data/models/task_model.dart';
import 'package:flutter_todo/data/datasources/task_data_source.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskInitial({}, '')) {
    on<GetTasksEvent>(_onGetList);
    on<GetTasksSuccessEvent>(_onSuccess);
    on<GetTasksErrorEvent>(_onError);
  }

  void getTasks() {
    add(const GetTasksEvent());
  }

  void _onGetList(GetTasksEvent event, Emitter<TaskState> emit) async {
    try {
      emit(GetTaskInProgress());
      Map<String, TaskModel> dictionary = await TaskDataSource.getTaskList();
      add(GetTasksSuccessEvent(dictionary));
    } catch (e) {
      add(GetTasksErrorEvent(e.toString()));
    }
  }

  void _onSuccess(GetTasksSuccessEvent event, Emitter<TaskState> emit) {
    if (state is GetTaskInProgress) {
      emit(GetTaskSuccess(event.dictionary, ''));
    }
  }

  void _onError(GetTasksErrorEvent event, Emitter<TaskState> emit) async {
    if (state is GetTaskInProgress) {
      emit(GetTaskError(const {}, event.message));
    }
  }
}
