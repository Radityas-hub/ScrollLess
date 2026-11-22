// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderRecordAdapter extends TypeAdapter<ReminderRecord> {
  @override
  final typeId = 2;

  @override
  ReminderRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderRecord(
      id: fields[0] as String,
      packageName: fields[1] as String,
      notifiedAt: fields[2] as DateTime,
      usageMinutes: (fields[3] as num).toInt(),
      limitMinutes: (fields[4] as num).toInt(),
      outcome: fields[5] == null
          ? ReminderOutcome.shown
          : fields[5] as ReminderOutcome,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderRecord obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.packageName)
      ..writeByte(2)
      ..write(obj.notifiedAt)
      ..writeByte(3)
      ..write(obj.usageMinutes)
      ..writeByte(4)
      ..write(obj.limitMinutes)
      ..writeByte(5)
      ..write(obj.outcome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReminderOutcomeAdapter extends TypeAdapter<ReminderOutcome> {
  @override
  final typeId = 3;

  @override
  ReminderOutcome read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ReminderOutcome.shown;
      case 1:
        return ReminderOutcome.takenBreak;
      case 2:
        return ReminderOutcome.continued;
      default:
        return ReminderOutcome.shown;
    }
  }

  @override
  void write(BinaryWriter writer, ReminderOutcome obj) {
    switch (obj) {
      case ReminderOutcome.shown:
        writer.writeByte(0);
      case ReminderOutcome.takenBreak:
        writer.writeByte(1);
      case ReminderOutcome.continued:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderOutcomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
