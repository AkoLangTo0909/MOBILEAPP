import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ModerationCard extends StatelessWidget {
  final String author;
  final String title;

  const ModerationCard({
    super.key,
    required this.author,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            author,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(title),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Post approved!'),
                      ),
                    );
                  },
                  child: const Text(
                    'Approve',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Post rejected.'),
                      ),
                    );
                  },
                  child: const Text(
                    'Reject',
                    style: TextStyle(
                      color: primaryRed,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROFILE
// ============================================================

