import 'package:hive/hive.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 08:37:55
/// project : todo

part 'task_entity.g.dart';

@HiveType(typeId: 1)
class TaskEntity extends HiveObject {
  @HiveField(0)
  int? timestamps;

  @HiveField(1)
  String? title;

  @HiveField(2)
  bool? completedTask;

  TaskEntity({this.timestamps, this.title, this.completedTask});
}
