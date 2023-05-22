import 'package:flutter/material.dart';
import 'package:note_clone/models/tasks_model.dart';
import '../blocs/bloc_exports.dart';

// ignore: must_be_immutable
class AddTaskWidget extends StatelessWidget {
   AddTaskWidget({
    super.key,
    
  });

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleController,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancle',
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  var task = TaskModel(title: titleController.text);
                  context.read<TaskBloc>().add(AddTaskEvent(task: task));
                  titleController.clear();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}