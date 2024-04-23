import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/entity/task_entity.dart';
import 'package:todo/models/repositories/task_repositories.dart';
import 'package:todo/models/repositories/task_repositories_impl.dart';
import 'package:todo/views/task_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(TaskEntityAdapter());

  runApp(MultiProvider(
    providers: [
      Provider<TaskRepositories>(
        create: (context) => TaskRepositoriesImpl(context),
      ),
      ChangeNotifierProvider(create: (context) => TaskController(context)),

    ],
    child:  MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskScreen(title: 'Todo'),
    );
  }
}
