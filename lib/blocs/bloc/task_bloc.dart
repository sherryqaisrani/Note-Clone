import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_clone/models/tasks_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTaskEvent>(_addTask);
    on<UpdateTaskEvent>(_updateTask);
    on<DeleteTaskEvent>(_deleteTask);
  }

  void _addTask(AddTaskEvent event, Emitter<TaskState> state) {
    final state = this.state;
    emit(TaskState(allTask: List.from(state.allTask)..add(event.task)));
  }

  void _updateTask(UpdateTaskEvent event, Emitter<TaskState> state) {}
  void _deleteTask(DeleteTaskEvent event, Emitter<TaskState> state) {}
}
