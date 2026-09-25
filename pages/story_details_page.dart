import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StoryDetailsPage extends StatefulWidget {
  const StoryDetailsPage({super.key});

  @override
  State<StoryDetailsPage> createState() =>
      _StoryDetailsPageState();
}

class _StoryDetailsPageState extends State<StoryDetailsPage> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Maria Santos • 2 hours ago',
              style: TextStyle(
                color: textMuted,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'My Experience at the College Hackathon',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'It was a challenging but very fun experience! '
              'I learned a lot and met new people. '
              'The event gave students an opportunity to work together '
              'and build creative solutions.',
              style: TextStyle(
                color: Colors.grey,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 18),

            Container(
              height: 210,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF243550),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  Icons.groups,
                  size: 75,
                  color: Colors.white24,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  icon: Icon(
                    liked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: primaryRed,
                  ),
                ),

                Text(
                  liked ? '49 Likes' : '48 Likes',
                ),

                const SizedBox(width: 20),

                const Icon(
                  Icons.comment_outlined,
                  size: 20,
                ),

                const SizedBox(width: 5),

                const Text('12 Comments'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ADMIN
// ============================================================

