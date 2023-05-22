import 'package:note_clone/blocs/bloc/task_state.dart';

import '../bloc_exports.dart';

import 'package:equatable/equatable.dart';
import 'package:note_clone/models/tasks_model.dart';

part 'task_event.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_addTask);
    on<UpdateTaskEvent>(_updateTask);
    on<DeleteTaskEvent>(_deleteTask);
  }

  void _addTask(AddTaskEvent event, Emitter<TaskState> state) {
    final state = this.state;
    // ignore: invalid_use_of_visible_for_testing_member
    emit(TaskState(allTask: List.from(state.allTask)..add(event.task)));
  }

  void _updateTask(UpdateTaskEvent event, Emitter<TaskState> state) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTask.indexOf(task);
    List<TaskModel> allTasks = List.from(state.allTask)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));
    // ignore: invalid_use_of_visible_for_testing_member
    emit(TaskState(allTask: allTasks));
  }

  void _deleteTask(DeleteTaskEvent event, Emitter<TaskState> state) {
    final state = this.state;
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      TaskState(
        allTask: List.from(state.allTask)..remove(event.task),
      ),
    );
  }
  
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TaskState state) {
    state.toMap();
    return null;
  }
  
}
