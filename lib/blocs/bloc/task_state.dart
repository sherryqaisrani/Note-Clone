part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskModel> allTask;
  TaskState({this.allTask = const []});

  @override
  List<Object> get props => [allTask];
}

class AddTaskState extends TaskState {
  final TaskModel task;
  AddTaskState({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateTaskState extends TaskState {
  final TaskModel task;
  UpdateTaskState({required this.task});
  @override
  List<Object> get props => [task];
}
