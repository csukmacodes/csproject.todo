import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/entity/task_entity.dart';
import 'package:todo/models/repositories/task_repositories.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 08:37:27
/// project : todo

class TaskController with ChangeNotifier {
  final BuildContext context;
  List<TaskEntity> _taskItems = [];
  List<TaskEntity> _taskItemsComplete = [];

  List<TaskEntity> get taskItems => _taskItems;

  List<TaskEntity> get taskItemsComplete => _taskItemsComplete;

  TaskController(this.context);

  Future<void> getTask() async {
    final taskRepo = Provider.of<TaskRepositories>(context, listen: false);
    _taskItems = await taskRepo.fetchTask();
    notifyListeners();
  }

  Future<void> getTaskComplete() async {
    final taskRepo = Provider.of<TaskRepositories>(context, listen: false);
    _taskItemsComplete = await taskRepo.fetchTaskComplete();
    notifyListeners();
  }

  Future<void> addTask(TaskEntity item) async {
    final taskRepo = Provider.of<TaskRepositories>(context, listen: false);
    await taskRepo.addTask(item);
    notifyListeners();
  }

  Future<void> deleteTask(TaskEntity item) async {
    final taskRepo = Provider.of<TaskRepositories>(context, listen: false);
    await taskRepo.removeTask(item);
    notifyListeners();
  }
}
