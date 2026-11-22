import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:scrollless/core/models/reminder_record.dart';
import 'package:scrollless/features/reminder/services/reminder_history_store.dart';

void main() {
  late Directory tempDir;
  late ReminderHistoryStore store;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('reminder_history_test');
    Hive.init(tempDir.path);
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ReminderRecordAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(ReminderOutcomeAdapter());
    }
    store = await ReminderHistoryStore.open();
  });

  setUp(() => store.clear());

  tearDownAll(() async {
    await Hive.close();
    await tempDir.delete(recursive: true);
  });

  ReminderRecord record({
    required String id,
    required int usageMinutes,
    DateTime? notifiedAt,
  }) {
    return ReminderRecord(
      id: id,
      packageName: 'com.instagram.android',
      notifiedAt: notifiedAt ?? DateTime(2026, 11, 22, 14, 32),
      usageMinutes: usageMinutes,
      limitMinutes: 30,
    );
  }

  test('idFor deterministik per package + tanggal', () {
    expect(
      ReminderRecord.idFor(
        packageName: 'com.instagram.android',
        date: DateTime(2026, 11, 22, 23, 59),
      ),
      'com.instagram.android:2026-11-22',
    );
  });

  test('save id sama = overwrite, bukan duplikat', () async {
    const id = 'com.instagram.android:2026-11-22';
    await store.save(record(id: id, usageMinutes: 31));
    await store.save(record(id: id, usageMinutes: 32));

    final list = store.listDesc();
    expect(list, hasLength(1));
    expect(list.single.usageMinutes, 32);
  });

  test('listDesc terurut terbaru dulu', () async {
    await store.save(
      record(
        id: 'a:2026-11-20',
        usageMinutes: 35,
        notifiedAt: DateTime(2026, 11, 20, 20, 15),
      ),
    );
    await store.save(
      record(
        id: 'a:2026-11-22',
        usageMinutes: 32,
        notifiedAt: DateTime(2026, 11, 22, 14, 32),
      ),
    );

    final list = store.listDesc();
    expect(
      list.map((e) => e.id),
      ['a:2026-11-22', 'a:2026-11-20'],
    );
  });
}
