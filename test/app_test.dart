import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrollless/app.dart';
import 'package:scrollless/core/models/usage_snapshot.dart';
import 'package:scrollless/core/repositories/usage_repository.dart';
import 'package:scrollless/features/tracking/providers/tracking_providers.dart';

class FakeUsageRepository implements UsageRepository {
  @override
  Future<List<UsageSnapshot>> getUsage({
    required DateTime start,
    required DateTime end,
  }) async => const [];

  @override
  Future<bool> hasUsagePermission() async => false;

  @override
  Future<void> requestUsagePermission() async {}
}

void main() {
  testWidgets('shows all three feature areas', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          usageRepositoryProvider.overrideWithValue(FakeUsageRepository()),
        ],
        child: const ScrollLessApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reminder-tab')));
    await tester.pumpAndSettle();
    expect(find.text('Reminder'), findsWidgets);

    await tester.tap(find.byKey(const Key('progress-tab')));
    await tester.pumpAndSettle();
    expect(find.text('Progress'), findsWidgets);
  });
}
