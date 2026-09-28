import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/achievement_card.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AchievementCard(
            title: 'Campus Coding Champions',
            description:
                'Students won the regional coding competition.',
          ),
          AchievementCard(
            title: 'Research Excellence Award',
            description:
                'Outstanding student research projects.',
          ),
          AchievementCard(
            title: 'Sports Festival Champions',
            description:
                'Students achieved first place in the annual sports festival.',
          ),
        ],
      ),
    );
  }
}

