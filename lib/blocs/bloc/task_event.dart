part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskModel task;
  const AddTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel task;
  const UpdateTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final TaskModel task;
  const DeleteTaskEvent({required this.task});
  @override
  List<Object> get props => [task];
}
