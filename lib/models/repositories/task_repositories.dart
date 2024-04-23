import 'package:todo/models/entity/task_entity.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 08:38:57
/// project : todo

abstract class TaskRepositories {
  Future<List<TaskEntity>> fetchTask();

  Future<List<TaskEntity>> fetchTaskComplete();

  Future<void> addTask(TaskEntity item);

  Future<void> removeTask(TaskEntity item);
}
