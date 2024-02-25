import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todo/data/models/task_model.dart';
import 'package:flutter_todo/data/datasources/task_data_source.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskInitial({}, '')) {
    on<GetTasksEvent>(_onGetList);
    on<GetTasksSuccessEvent>(_onGetSuccess);
    on<GetTasksErrorEvent>(_onGetError);

    on<CreateTaskEvent>(_onCreate);
    on<EditTaskEvent>(_onEdit);
    on<DeleteTaskEvent>(_onDelete);
  }

  void getTasks() {
    add(const GetTasksEvent());
  }

  void createTask(TaskModel task) {
    add(CreateTaskEvent(task));
  }

  void editTask(TaskModel task) {
    add(EditTaskEvent(task));
  }

  void deleteTask(String id) {
    add(DeleteTaskEvent(id));
  }

  void _onGetList(GetTasksEvent event, Emitter<TaskState> emit) async {
    try {
      emit(GetTaskInProgress(state.dictionary, state.messageError));
      Map<String, TaskModel> dictionary = await TaskDataSource.getTaskList();
      add(GetTasksSuccessEvent(dictionary));
    } catch (e) {
      add(GetTasksErrorEvent(e.toString()));
    }
  }

  void _onGetSuccess(GetTasksSuccessEvent event, Emitter<TaskState> emit) {
    if (state is GetTaskInProgress) {
      emit(GetTaskSuccess(event.dictionary, ''));
    }
  }

  void _onGetError(GetTasksErrorEvent event, Emitter<TaskState> emit) async {
    if (state is GetTaskInProgress) {
      emit(GetTaskError(const {}, event.message));
    }
  }

  void _onCreate(CreateTaskEvent event, Emitter<TaskState> emit) async {
    emit(GetTaskInProgress(state.dictionary, state.messageError));
    Map<String, TaskModel> currDictionary = _cloneDictionary(state.dictionary);
    final currId = DateTime.now().millisecondsSinceEpoch.toString();
    currDictionary.addEntries([
      MapEntry(currId, event.task.copyWith(id: currId))
    ]);
    add(GetTasksSuccessEvent(currDictionary));
  }

  void _onEdit(EditTaskEvent event, Emitter<TaskState> emit) async {
    emit(GetTaskInProgress(state.dictionary, state.messageError));
    Map<String, TaskModel> currDictionary = _cloneDictionary(state.dictionary);
    currDictionary.update(event.task.id, (value) => event.task);
    add(GetTasksSuccessEvent(currDictionary));
  }

  void _onDelete(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(GetTaskInProgress(state.dictionary, state.messageError));
    Map<String, TaskModel> currDictionary = _cloneDictionary(state.dictionary);
    currDictionary.remove(event.id);
    add(GetTasksSuccessEvent(currDictionary));
  }

  Map<String, TaskModel> _cloneDictionary(Map<String, TaskModel> dictionary) {
    return dictionary.map((key, value) => MapEntry(key, value.copyWith()));
  }
}
