import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/task_controller.dart';

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
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${context.watch<TaskController>().count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<TaskController>().increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
