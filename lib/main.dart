import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/entity/task_entity.dart';
import 'package:todo/views/task_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(TaskEntityAdapter());

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TaskScreen(title: 'Todo'),
    );
  }
}
