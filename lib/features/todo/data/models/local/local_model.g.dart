// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoLocalModelAdapter extends TypeAdapter<TodoLocalModel> {
  @override
  final int typeId = 1;

  @override
  TodoLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoLocalModel(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      task: fields[2] as String,
      isCompleted: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TodoLocalModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.task)
      ..writeByte(3)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
