import 'package:scrollless/core/models/usage_snapshot.dart';

abstract interface class UsageRepository {
  Future<bool> hasUsagePermission();

  Future<void> requestUsagePermission();

  Future<List<UsageSnapshot>> getUsage({
    required DateTime start,
    required DateTime end,
  });
}
