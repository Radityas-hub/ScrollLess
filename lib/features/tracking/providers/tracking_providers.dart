import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollless/core/repositories/limit_rule_repository.dart';
import 'package:scrollless/core/repositories/usage_repository.dart';
import 'package:scrollless/features/tracking/services/android_usage_repository.dart';
import 'package:scrollless/features/tracking/services/hive_limit_rule_repository.dart';

final usageRepositoryProvider = Provider<UsageRepository>(
  (ref) => AndroidUsageRepository(),
);

final limitRuleRepositoryProvider = Provider<LimitRuleRepository>(
  (ref) => HiveLimitRuleRepository(),
);

class UsagePermissionController extends AsyncNotifier<bool> {
  @override
  Future<bool> build() {
    return ref.read(usageRepositoryProvider).hasUsagePermission();
  }

  Future<void> request() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(usageRepositoryProvider);
      await repository.requestUsagePermission();
      return repository.hasUsagePermission();
    });
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      ref.read(usageRepositoryProvider).hasUsagePermission,
    );
  }
}

final usagePermissionProvider =
    AsyncNotifierProvider<UsagePermissionController, bool>(
      UsagePermissionController.new,
    );
