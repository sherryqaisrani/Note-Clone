import 'package:flutter/material.dart';
import 'package:note_clone/models/tasks_model.dart';
import 'package:note_clone/widgets/task_list.dart';
import '../blocs/bloc_exports.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: Text('Note Clone'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Chip(
                    label: Text(
                  'Tasks',
                )),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          floatingActionButton: Builder(builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () {
                addTask(context);
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            );
          }),
        );
      },
    );
  }

  void addTask(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
