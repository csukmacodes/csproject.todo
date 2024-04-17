// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskEntityAdapter extends TypeAdapter<TaskEntity> {
  @override
  final int typeId = 1;

  @override
  TaskEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskEntity(
      timestamps: fields[0] as int?,
      title: fields[1] as String?,
      completedTask: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timestamps)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.completedTask);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
