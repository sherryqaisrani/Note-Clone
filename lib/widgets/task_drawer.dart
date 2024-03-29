import 'package:flutter/material.dart';
import 'package:note_clone/blocs/switch_bloc/switch_state.dart';
import 'package:note_clone/screens/recycle_bin.dart';
import 'package:note_clone/screens/task_screen.dart';

import '../blocs/bloc_exports.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              color: Colors.grey,
              child: Text(
                'TaskDrawer',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(
                TaskScreen.id,
              ),
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return ListTile(
                    leading: const Icon(
                      Icons.folder_special,
                    ),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.allTask.length}'),
                  );
                },
              ),
            ),
            const Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete,
                    ),
                    title: const Text('Bin'),
                    trailing: Text('${state.removeTask.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (value) {
                    state.switchValue == false
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
