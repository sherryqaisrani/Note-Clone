import 'package:flutter/material.dart';
import 'package:note_clone/widgets/task_drawer.dart';
import 'package:note_clone/widgets/task_list.dart';
import '../blocs/bloc_exports.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
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
                  '${state.removeTask.length} : Tasks',
                )),
              ),
              TaskList(taskList: state.removeTask)
            ],
          ),
        );
      },
    );
  }
}
