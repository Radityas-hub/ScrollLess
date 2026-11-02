import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollless/features/home/providers/navigation_provider.dart';
import 'package:scrollless/features/punishment/screens/progress_screen.dart';
import 'package:scrollless/features/reminder/screens/reminder_screen.dart';
import 'package:scrollless/features/tracking/screens/tracking_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const _screens = <Widget>[
    TrackingScreen(),
    ReminderScreen(),
    ProgressScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollLess'),
        actions: [
          IconButton(
            tooltip: 'Pengaturan',
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(index: selectedIndex, children: _screens),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: ref
            .read(navigationIndexProvider.notifier)
            .select,
        destinations: const [
          NavigationDestination(
            key: Key('tracking-tab'),
            icon: Icon(Icons.query_stats_outlined),
            selectedIcon: Icon(Icons.query_stats),
            label: 'Tracking',
          ),
          NavigationDestination(
            key: Key('reminder-tab'),
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            label: 'Reminder',
          ),
          NavigationDestination(
            key: Key('progress-tab'),
            icon: Icon(Icons.emoji_events_outlined),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
