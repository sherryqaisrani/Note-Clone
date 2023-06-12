import 'package:flutter/material.dart';
import 'package:note_clone/blocs/switch_bloc/switch_state.dart';
import 'package:note_clone/routes/app_routes.dart';
import 'package:note_clone/screens/task_screen.dart';
import 'package:note_clone/themes/app_themes.dart';
import 'package:path_provider/path_provider.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(MyApp(
    appRoutes: AppRoutes(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRoutes});
  AppRoutes appRoutes;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TaskScreen(),
            onGenerateRoute: appRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
