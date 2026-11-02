import 'package:hive_ce/hive.dart';
import 'package:scrollless/core/models/limit_rule.dart';
import 'package:scrollless/core/repositories/limit_rule_repository.dart';

class HiveLimitRuleRepository implements LimitRuleRepository {
  static const boxName = 'limit_rules';

  Future<Box<LimitRule>> _box() => Hive.openBox<LimitRule>(boxName);

  @override
  Future<void> delete(String packageName) async {
    final box = await _box();
    await box.delete(packageName);
  }

  @override
  Future<List<LimitRule>> getAll() async {
    final box = await _box();
    return box.values.toList(growable: false);
  }

  @override
  Future<void> save(LimitRule rule) async {
    final box = await _box();
    await box.put(rule.packageName, rule);
  }
}
