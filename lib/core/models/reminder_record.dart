import 'package:hive_ce/hive.dart';

part 'reminder_record.g.dart';

/// Outcome dialog reminder.
@HiveType(typeId: 3)
enum ReminderOutcome {
  @HiveField(0)
  shown,

  @HiveField(1)
  takenBreak,

  @HiveField(2)
  continued,
}

/// Satu kejadian notifikasi reminder yang terkirim (owned modul reminder).
///
/// Beda dari `Violation`: ini BUKAN pelanggaran berpoin, hanya catatan
/// "pengguna sudah diingatkan pada ...". Penalty tetap milik alur punishment.
@HiveType(typeId: 2)
class ReminderRecord {
  const ReminderRecord({
    required this.id,
    required this.packageName,
    required this.notifiedAt,
    required this.usageMinutes,
    required this.limitMinutes,
    this.outcome = ReminderOutcome.shown,
  });

  /// ID deterministik agar pengiriman idempotent: `{packageName}:{yyyy-MM-dd}`.
  static String idFor({required String packageName, required DateTime date}) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$packageName:$y-$m-$d';
  }

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String packageName;

  @HiveField(2)
  final DateTime notifiedAt;

  @HiveField(3)
  final int usageMinutes;

  @HiveField(4)
  final int limitMinutes;

  @HiveField(5)
  final ReminderOutcome outcome;
}
