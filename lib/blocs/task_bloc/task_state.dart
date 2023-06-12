// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../models/tasks_model.dart';

class TaskState extends Equatable {
  final List<TaskModel> allTask;
  final List<TaskModel> removeTask;
  const TaskState({this.allTask = const [], this.removeTask = const []});

  @override
  List<Object> get props => [allTask, removeTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTask': allTask.map((x) => x.toMap()).toList(),
      'removeTask': allTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTask: List<TaskModel>.from(
        (map['allTask'] as List).map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removeTask: List<TaskModel>.from(
        (map['removeTask'] as List).map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
