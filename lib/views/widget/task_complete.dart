import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/utils/constant.dart';
import 'package:todo/views/widget/task_item.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 14:46:37
/// project : todo

class TaskComplete extends StatefulWidget {
  const TaskComplete({super.key});

  @override
  State<TaskComplete> createState() => _TaskCompleteState();
}

class _TaskCompleteState extends State<TaskComplete> {
  late List<dynamic> jsonTodos;

  @override
  void initState() {
    super.initState();
    String sampleJsonString = jsonEncode(todoItems);
    jsonTodos = jsonDecode(sampleJsonString).where((json) => json['completedTask'] == true).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Completed',
              style: GoogleFonts.robotoFlex(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: jsonTodos.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    editController: TextEditingController(),
                    title: jsonTodos[index]['title'].toString(),
                    isDone: jsonTodos[index]['completedTask'],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
