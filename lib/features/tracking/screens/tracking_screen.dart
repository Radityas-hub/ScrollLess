import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollless/core/config/app_config.dart';
import 'package:scrollless/core/constants/tracked_apps.dart';
import 'package:scrollless/features/tracking/providers/tracking_providers.dart';
import 'package:scrollless/shared/widgets/section_card.dart';

class TrackingScreen extends ConsumerWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permission = ref.watch(usagePermissionProvider);

    return ListView(
      key: const Key('tracking-screen'),
      padding: const EdgeInsets.all(16),
      children: [
        Text('Dashboard', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        const Text('Pantau penggunaan aplikasi dan tetapkan batas harian.'),
        if (AppConfig.demoMode) ...[
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Chip(label: Text('Demo mode aktif')),
          ),
        ],
        const SizedBox(height: 20),
        SectionCard(
          title: 'Usage Access',
          subtitle: 'Diperlukan Android untuk membaca durasi penggunaan.',
          child: permission.when(
            data: (granted) => Row(
              children: [
                Icon(
                  granted ? Icons.check_circle : Icons.warning_amber_rounded,
                  color: granted ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    granted ? 'Akses diberikan' : 'Akses belum aktif',
                  ),
                ),
                if (!granted)
                  FilledButton(
                    onPressed: () =>
                        ref.read(usagePermissionProvider.notifier).request(),
                    child: const Text('Buka Settings'),
                  ),
              ],
            ),
            error: (error, stackTrace) => const Text(
              'Status izin gagal dibaca. Coba lagi dari perangkat Android.',
            ),
            loading: () => const LinearProgressIndicator(),
          ),
        ),
        const SizedBox(height: 16),
        SectionCard(
          title: 'Aplikasi dipantau',
          child: Column(
            children: [
              for (final app in supportedApps)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(child: Icon(Icons.phone_android)),
                  title: Text(app.name),
                  subtitle: Text(app.packageName),
                  trailing: const Text('30 menit'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
