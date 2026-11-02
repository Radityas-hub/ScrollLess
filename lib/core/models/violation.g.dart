// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViolationAdapter extends TypeAdapter<Violation> {
  @override
  final typeId = 1;

  @override
  Violation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Violation(
      id: fields[0] as String,
      packageName: fields[1] as String,
      occurredAt: fields[2] as DateTime,
      overLimitMinutes: (fields[3] as num).toInt(),
      penaltyPoints: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Violation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.packageName)
      ..writeByte(2)
      ..write(obj.occurredAt)
      ..writeByte(3)
      ..write(obj.overLimitMinutes)
      ..writeByte(4)
      ..write(obj.penaltyPoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViolationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
