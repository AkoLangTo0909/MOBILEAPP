import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/event_card.dart';
import 'event_details_page.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Events',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "What's happening on campus",
              style: TextStyle(
                color: textMuted,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search events...',
                hintStyle: const TextStyle(
                  color: textMuted,
                ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            EventCard(
              title: 'College Foundation Day 2026',
              date: 'February 10, 2026 • 8:00 AM',
              location: 'University Gymnasium',
              icon: Icons.groups,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventDetailsPage(
                      title: 'College Foundation Day 2026',
                    ),
                  ),
                );
              },
            ),

            EventCard(
              title: 'IT Week 2026',
              date: 'March 12, 2026 • 9:00 AM',
              location: 'Exhibition Hall',
              icon: Icons.computer,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventDetailsPage(
                      title: 'IT Week 2026',
                    ),
                  ),
                );
              },
            ),

            EventCard(
              title: 'Student Leadership Summit',
              date: 'April 5, 2026 • 10:00 AM',
              location: 'Main Auditorium',
              icon: Icons.people,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventDetailsPage(
                      title: 'Student Leadership Summit',
                    ),
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
// EVENT CARD
// ============================================================

