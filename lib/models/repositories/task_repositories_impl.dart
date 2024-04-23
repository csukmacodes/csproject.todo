import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/entity/task_entity.dart';
import 'package:todo/models/repositories/task_repositories.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Apr 17, 2024 15:26:16
/// project : todo

class TaskRepositoriesImpl implements TaskRepositories {
  final BuildContext context;
  final String _taskBox = 'task_table';

  TaskRepositoriesImpl(this.context);

  Future<Box> checkBox(String boxName) async {
    final isOpen = Hive.isBoxOpen(boxName);
    return isOpen ? Hive.box(boxName) : await Hive.openBox(boxName);
  }

  @override
  Future<List<TaskEntity>> fetchTask() async {
    final box = await checkBox(_taskBox);
    final res = box.values
        .where(
          (c) => c.completedTask == false,
        )
        .toList();
    List<TaskEntity> taskList = res.toList().isNotEmpty ? res.cast<TaskEntity>() : [];
    taskList.sort((a, b) => a.timestamps!.compareTo(b.timestamps!));
    return taskList;
  }

  @override
  Future<List<TaskEntity>> fetchTaskComplete() async {
    final box = await checkBox(_taskBox);
    final res = box.values
        .where(
          (c) => c.completedTask == true,
        )
        .toList();
    List<TaskEntity> taskList = res.toList().isNotEmpty ? res.cast<TaskEntity>() : [];
    taskList.sort((a, b) => a.timestamps!.compareTo(b.timestamps!));
    return taskList;
  }

  @override
  Future<void> addTask(TaskEntity item) async {
    final box = await checkBox(_taskBox);
    box.put(item.timestamps, item);
  }

  @override
  Future<void> removeTask(TaskEntity item) async {
    final box = await checkBox(_taskBox);
    box.delete(item.timestamps);
  }
}
