import 'package:flutter/foundation.dart';
import 'package:scrollless/core/models/usage_snapshot.dart';
import 'package:scrollless/core/repositories/usage_repository.dart';
import 'package:usage_stats/usage_stats.dart';

class AndroidUsageRepository implements UsageRepository {
  bool get _isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  @override
  Future<bool> hasUsagePermission() async {
    if (!_isAndroid) return false;
    return await UsageStats.checkUsagePermission() ?? false;
  }

  @override
  Future<void> requestUsagePermission() async {
    if (_isAndroid) await UsageStats.grantUsagePermission();
  }

  @override
  Future<List<UsageSnapshot>> getUsage({
    required DateTime start,
    required DateTime end,
  }) async {
    if (!_isAndroid) return const [];

    final usage = await UsageStats.queryAndAggregateUsageStats(start, end);
    return usage.entries
        .map((entry) {
          final foregroundMilliseconds =
              int.tryParse(entry.value.totalTimeInForeground ?? '') ?? 0;
          return UsageSnapshot(
            packageName: entry.key,
            foregroundDuration: Duration(milliseconds: foregroundMilliseconds),
            capturedAt: end,
          );
        })
        .toList(growable: false);
  }
}
