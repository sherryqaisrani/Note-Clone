import 'package:flutter/material.dart';
import 'package:note_clone/screens/task_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc_exports.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  final storageDirectory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storageDirectory);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}
