import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/views/task_screen.dart';

void main() {
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
