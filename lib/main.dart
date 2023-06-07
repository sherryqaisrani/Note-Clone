import 'package:flutter/material.dart';
import 'package:note_clone/routes/app_routes.dart';
import 'package:note_clone/screens/task_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc_exports.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp( MyApp(appRoutes: AppRoutes(),));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({super.key, required this.appRoutes});
  AppRoutes appRoutes;
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
        onGenerateRoute: appRoutes.onGenerateRoute ,
      ),
    );
  }
}
