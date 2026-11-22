import 'package:hive_ce/hive.dart';
import 'package:scrollless/core/models/reminder_record.dart';

/// Penyimpanan history pengingat (Box `reminder_history`).
///
/// Ditulis SEBELUM notifikasi dikirim (record-before-notify) agar
/// background check Android aman di-run ulang.
class ReminderHistoryStore {
  ReminderHistoryStore(this._box);

  final Box<ReminderRecord> _box;

  static Future<ReminderHistoryStore> open() async {
    final box = await Hive.openBox<ReminderRecord>('reminder_history');
    return ReminderHistoryStore(box);
  }

  /// Idempotent: id sama = overwrite, tidak duplikat.
  Future<void> save(ReminderRecord record) => _box.put(record.id, record);

  /// Terurut notifiedAt desc (terbaru dulu).
  List<ReminderRecord> listDesc() {
    final records = _box.values.toList()
      ..sort((a, b) => b.notifiedAt.compareTo(a.notifiedAt));
    return records;
  }

  /// Untuk testing/dev reset. Jangan dipakai di jalur produksi.
  Future<void> clear() => _box.clear();
}
