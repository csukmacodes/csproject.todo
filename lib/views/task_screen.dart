import 'package:flutter/material.dart';
import 'package:todo/views/widget/task_complete.dart';
import 'package:todo/views/widget/task_responsive.dart';
import 'package:todo/views/widget/task_todo.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 08:39:52
/// project : todo

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, required this.title});

  final String title;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const TaskResponsive(
          startContent: TaskTodo(),
          spacing: 2,
          startFlex: 5,
          endFlex: 2,
          endContent: TaskComplete(),
        ));
  }
}
