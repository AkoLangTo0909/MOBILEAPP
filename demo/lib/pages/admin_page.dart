import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/moderation_card.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Admin Moderation',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Review campus submissions',
              style: TextStyle(
                color: textMuted,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 20),

            const ModerationCard(
              author: 'Adelphi Hipolito',
              title: 'Petition for more campus charging stations',
            ),

            const ModerationCard(
              author: 'Dr. Elyza O\'Connor',
              title: 'Research paper publication announcement',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// MODERATION CARD
// ============================================================

