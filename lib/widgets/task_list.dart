import 'package:flutter/material.dart';
import 'package:note_clone/models/tasks_model.dart';
import '../blocs/bloc_exports.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
                }),
            onLongPress: () => context.read<TaskBloc>().add(
                  DeleteTaskEvent(
                    task: task,
                  ),
                ),
          );
        },
      ),
    );
  }
}
