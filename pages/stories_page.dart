import 'package:flutter/material.dart';
import '../widgets/story_card.dart';
import 'story_details_page.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StoryCard(
            title: 'My Experience at the College Hackathon',
            author: 'Maria Santos',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StoryDetailsPage(),
                ),
              );
            },
          ),

          StoryCard(
            title: 'Students Celebrate Another Successful Campus Event',
            author: 'Campus Chronicle',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StoryDetailsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ============================================================
// STORY CARD
// ============================================================

