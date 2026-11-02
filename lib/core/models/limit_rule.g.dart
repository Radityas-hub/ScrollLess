// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit_rule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LimitRuleAdapter extends TypeAdapter<LimitRule> {
  @override
  final typeId = 0;

  @override
  LimitRule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LimitRule(
      packageName: fields[0] as String,
      appName: fields[1] as String,
      dailyLimitMinutes: (fields[2] as num).toInt(),
      enabled: fields[3] == null ? true : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LimitRule obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.packageName)
      ..writeByte(1)
      ..write(obj.appName)
      ..writeByte(2)
      ..write(obj.dailyLimitMinutes)
      ..writeByte(3)
      ..write(obj.enabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LimitRuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
