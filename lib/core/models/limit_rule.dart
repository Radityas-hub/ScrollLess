import 'package:hive_ce/hive.dart';

part 'limit_rule.g.dart';

@HiveType(typeId: 0)
class LimitRule {
  const LimitRule({
    required this.packageName,
    required this.appName,
    required this.dailyLimitMinutes,
    this.enabled = true,
  });

  @HiveField(0)
  final String packageName;

  @HiveField(1)
  final String appName;

  @HiveField(2)
  final int dailyLimitMinutes;

  @HiveField(3, defaultValue: true)
  final bool enabled;

  Duration get dailyLimit => Duration(minutes: dailyLimitMinutes);
}
