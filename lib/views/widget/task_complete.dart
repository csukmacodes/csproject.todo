import 'package:flutter/material.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 14:46:37
/// project : todo

class TaskComplete extends StatelessWidget {
  const TaskComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('Task Complete'),
        ));
  }
}
