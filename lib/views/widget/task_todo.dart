import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/utils/constant.dart';
import 'package:todo/views/widget/task_item.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 15:09:41
/// project : todo

class TaskTodo extends StatefulWidget {
  const TaskTodo({super.key});

  @override
  State<TaskTodo> createState() => _TaskTodoState();
}

class _TaskTodoState extends State<TaskTodo> {
  late List<dynamic> jsonTodos;
  TextEditingController editCtrl = TextEditingController();
  int activeIndex = -1;

  @override
  void initState() {
    super.initState();
    String sampleJsonString = jsonEncode(todoItems);
    jsonTodos = jsonDecode(sampleJsonString).where((json) => json['completedTask'] == false).toList();
  }

  void reloadTask() {
    jsonTodos = jsonTodos.where((json) => json['completedTask'] == false).toList();
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
              'Task',
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
                    title: jsonTodos[index]['title'] ?? '',
                    isDone: jsonTodos[index]['completedTask'],
                    checkVal: jsonTodos[index]['completedTask'],
                    // editTap: jsonTodos[index]['title'] == null || (editCtrl.value.text == jsonTodos[index]['title'] && activeIndex == index),
                    editTap: activeIndex == index,
                    editController: editCtrl,
                    editOnTap: () {
                      setState(() {
                        activeIndex = index;
                        editCtrl.text = jsonTodos[index]['title']??'';
                      });
                    },
                    onSubmit: (val) {
                      setState(() {
                        jsonTodos[index]['title'] = val;
                        activeIndex = -1;
                        editCtrl.clear();
                        reloadTask();
                      });
                    },
                    onChange: (val) {
                      setState(() {
                        jsonTodos[index]['completedTask'] = val;
                        reloadTask();
                      });
                    },
                  );
                }),
            Row(
              children: [
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.plus),
                    iconSize: 20,
                    onPressed: () {
                      Map<String, dynamic> item = Map();
                      item.putIfAbsent('title', () => null);
                      item.putIfAbsent('completedTask', () => false);
                      item.putIfAbsent('timestamps', () => DateTime.now().second);
                      if (jsonTodos[jsonTodos.length - 1]['title'] != null) {
                        setState(() {
                          jsonTodos.add(item);
                        });
                      }
                    }),
                Expanded(
                    child: Text(
                  'Add Item',
                  style: GoogleFonts.robotoFlex(
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
