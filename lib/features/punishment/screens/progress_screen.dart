import 'package:flutter/material.dart';
import 'package:scrollless/shared/widgets/section_card.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const Key('progress-screen'),
      padding: const EdgeInsets.all(16),
      children: [
        Text('Progress', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        const Text('Lihat streak, penalty, dan tantangan fokus harian.'),
        const SizedBox(height: 20),
        const Row(
          children: [
            Expanded(
              child: SectionCard(
                title: 'Streak',
                child: Text('0 hari', style: TextStyle(fontSize: 24)),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: SectionCard(
                title: 'Penalty',
                child: Text('0 poin', style: TextStyle(fontSize: 24)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const SectionCard(
          title: 'Tantangan hari ini',
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.self_improvement),
            title: Text('Fokus tanpa scrolling'),
            subtitle: Text('Selesaikan satu sesi fokus selama 25 menit.'),
          ),
        ),
      ],
    );
  }
}
