import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/category_card.dart';
import 'events_page.dart';
import 'stories_page.dart';
import 'achievements_page.dart';
import 'institutes_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'CampusChronicle',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No new notifications.'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_none,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cardColor2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good day, Juan! 👋',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Stay updated with the latest news, announcements, '
                    'and events happening around the campus.',
                    style: TextStyle(
                      color: textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Explore Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),

            CategoryCard(
              icon: Icons.article_outlined,
              iconColor: Colors.red,
              title: 'News',
              subtitle: '12 new stories',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoriesPage(),
                  ),
                );
              },
            ),

            CategoryCard(
              icon: Icons.calendar_month_outlined,
              iconColor: Colors.blue,
              title: 'Events',
              subtitle: '4 active events',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventsPage(),
                  ),
                );
              },
            ),

            CategoryCard(
              icon: Icons.menu_book_outlined,
              iconColor: Colors.green,
              title: 'Stories',
              subtitle: '26 student narratives',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoriesPage(),
                  ),
                );
              },
            ),

            CategoryCard(
              icon: Icons.emoji_events_outlined,
              iconColor: Colors.amber,
              title: 'Achievements',
              subtitle: '8 campus highlights',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AchievementsPage(),
                  ),
                );
              },
            ),

            CategoryCard(
              icon: Icons.account_balance_outlined,
              iconColor: Colors.purple,
              title: 'Institutes',
              subtitle: '5 campus institutes',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InstitutesPage(),
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
// CATEGORY CARD
// ============================================================

