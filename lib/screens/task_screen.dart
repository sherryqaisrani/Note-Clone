import 'package:flutter/material.dart';
import 'package:note_clone/models/tasks_model.dart';
import 'package:note_clone/screens/add_task_screen.dart';
import 'package:note_clone/widgets/task_drawer.dart';
import 'package:note_clone/widgets/task_list.dart';
import '../blocs/bloc_exports.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Note Clone'),
            actions: [
              IconButton(
                onPressed: () {
                  addTask(context);
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          drawer: TaskDrawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                    label: Text(
                  '${taskList.length} : Tasks',
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
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddTaskWidget(),
        ),
      ),
    );
  }
}
