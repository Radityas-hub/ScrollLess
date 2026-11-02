import 'package:scrollless/core/models/limit_rule.dart';

abstract interface class LimitRuleRepository {
  Future<List<LimitRule>> getAll();

  Future<void> save(LimitRule rule);

  Future<void> delete(String packageName);
}
