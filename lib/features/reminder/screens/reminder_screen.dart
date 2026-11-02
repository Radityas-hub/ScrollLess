import 'package:flutter/material.dart';
import 'package:scrollless/core/services/notification_service.dart';
import 'package:scrollless/shared/widgets/section_card.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  bool? _permissionGranted;

  Future<void> _requestPermission() async {
    final granted = await NotificationService.instance.requestPermission();
    if (mounted) setState(() => _permissionGranted = granted);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const Key('reminder-screen'),
      padding: const EdgeInsets.all(16),
      children: [
        Text('Reminder', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        const Text('Kelola notifikasi dan pemeriksaan batas di background.'),
        const SizedBox(height: 20),
        SectionCard(
          title: 'Izin notifikasi',
          subtitle: 'Wajib diminta pada Android 13 dan yang lebih baru.',
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _permissionGranted == true
                      ? 'Notifikasi aktif'
                      : 'Aktifkan agar peringatan dapat muncul',
                ),
              ),
              FilledButton.tonal(
                onPressed: _requestPermission,
                child: const Text('Izinkan'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const SectionCard(
          title: 'Pemeriksaan background',
          subtitle: 'WorkManager berjalan secara eventual, bukan tepat waktu.',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.schedule),
            title: Text('Interval minimum Android'),
            trailing: Text('15 menit'),
          ),
        ),
      ],
    );
  }
}
