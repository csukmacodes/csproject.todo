import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/entity/task_entity.dart';
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
  TextEditingController editCtrl = TextEditingController();
  int activeIndex = -1;
  bool isTaskLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isTaskLoaded) {
      initTask();
      isTaskLoaded = true;
    }
  }

  void initTask() {
    context.read<TaskController>().getTask();
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
                itemCount: context.watch<TaskController>().taskItems.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    title: context.watch<TaskController>().taskItems[index].title ?? '',
                    isDone: context.watch<TaskController>().taskItems[index].completedTask ?? false,
                    checkVal: context.watch<TaskController>().taskItems[index].completedTask ?? false,
                    editTap: activeIndex == index,
                    editController: editCtrl,
                    editOnTap: () {
                      setState(() {
                        activeIndex = index;
                        editCtrl.text = context.read<TaskController>().taskItems[index].title ?? '';
                      });
                    },
                    onSubmit: (val) async {
                      context.read<TaskController>().taskItems[index].title = val;
                      activeIndex = -1;
                      editCtrl.clear();
                      context.read<TaskController>().addTask(context.read<TaskController>().taskItems[index]);
                      context.read<TaskController>().getTaskComplete();
                      context.read<TaskController>().getTask();
                    },
                    onChange: (val) async {
                      context.read<TaskController>().taskItems[index].completedTask = val;

                      context.read<TaskController>().addTask(context.read<TaskController>().taskItems[index]);
                      context.read<TaskController>().getTaskComplete();
                      context.read<TaskController>().getTask();
                    },
                  );
                }),
            Row(
              children: [
                IconButton(
                    icon: const FaIcon(FontAwesomeIcons.plus),
                    iconSize: 20,
                    onPressed: () {
                      TaskEntity item = TaskEntity();
                      item.title = null;
                      item.completedTask = false;
                      item.timestamps = DateTime.now().millisecondsSinceEpoch ~/ 1000;
                      context.read<TaskController>().addTask(item);
                      context.read<TaskController>().getTask();
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
