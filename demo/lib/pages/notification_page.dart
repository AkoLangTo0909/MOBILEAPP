import 'package:flutter/material.dart';
import '../theme/app_theme.dart';


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
              'Notifications',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Stay updated on campus activity',
              style: TextStyle(color: textMuted, fontSize: 11),
            ),
            const SizedBox(height: 20),

            const _NotificationTile(
              icon: Icons.campaign_outlined,
              title: 'New campus petition',
              message: 'Adelphi Hipolito submitted a petition for more charging stations.',
              time: '10 minutes ago',
            ),
            const _NotificationTile(
              icon: Icons.article_outlined,
              title: 'New announcement',
              message: 'Dr. Elyza O’Connor published a research paper announcement.',
              time: '1 hour ago',
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
  });

  final IconData icon;
  final String title;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(message),
        ),
        trailing: Text(
          time,
          style: const TextStyle(color: textMuted, fontSize: 11),
        ),
      ),
    );
  }
}