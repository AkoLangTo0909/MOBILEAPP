import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/stat_card.dart';
import 'events_page.dart';

class InstituteDetailsPage extends StatelessWidget {
  final String name;
  final String acronym;
  final IconData icon;
  final Color iconColor;

  const InstituteDetailsPage({
    super.key,
    required this.name,
    required this.acronym,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(acronym),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF243550),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 75,
                ),
              ),
            ),

            const SizedBox(height: 18),

            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Explore programs, research activities, student organizations, '
              'events and opportunities offered by this institute.',
              style: TextStyle(
                color: textMuted,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: const [
                Expanded(
                  child: StatCard(
                    number: '12',
                    label: 'Programs',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    number: '3',
                    label: 'Labs',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            ListTile(
              tileColor: cardColor,
              leading: Icon(
                Icons.menu_book,
                color: iconColor,
              ),
              title: const Text('Program Catalog'),
              subtitle: const Text(
                'View programs and course information',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Program catalog opened.'),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            ListTile(
              tileColor: cardColor,
              leading: Icon(
                Icons.event,
                color: iconColor,
              ),
              title: const Text('Institute Events'),
              subtitle: const Text(
                'View upcoming workshops and activities',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

