import 'package:hive_ce/hive.dart';

part 'violation.g.dart';

@HiveType(typeId: 1)
class Violation {
  const Violation({
    required this.id,
    required this.packageName,
    required this.occurredAt,
    required this.overLimitMinutes,
    required this.penaltyPoints,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String packageName;

  @HiveField(2)
  final DateTime occurredAt;

  @HiveField(3)
  final int overLimitMinutes;

  @HiveField(4)
  final int penaltyPoints;
}
