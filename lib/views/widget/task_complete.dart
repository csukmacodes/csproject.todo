import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/task_controller.dart';
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
  TextEditingController editCtrl = TextEditingController();
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
    context.read<TaskController>().getTaskComplete();
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
                itemCount: context.watch<TaskController>().taskItemsComplete.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    title: context.watch<TaskController>().taskItemsComplete[index].title ?? '',
                    isDone: context.watch<TaskController>().taskItemsComplete[index].completedTask ?? false,
                    checkVal: context.watch<TaskController>().taskItemsComplete[index].completedTask ?? false,
                    editController: editCtrl,
                    onRemove: () {
                      context.read<TaskController>().deleteTask(context.read<TaskController>().taskItemsComplete[index]);
                      context.read<TaskController>().getTaskComplete();
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
