import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  String category = 'News';

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void publishPost() {
    if (titleController.text.trim().isEmpty ||
        contentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a title and content.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post published successfully!'),
      ),
    );

    titleController.clear();
    contentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Post',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Share with your campus community',
              style: TextStyle(
                color: textMuted,
                fontSize: 11,
              ),
            ),

            const SizedBox(height: 20),

            const Text('Category'),

            const SizedBox(height: 7),

            DropdownButtonFormField<String>(
              value: category,
              decoration: InputDecoration(
                filled: true,
                fillColor: cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'News',
                  child: Text('News'),
                ),
                DropdownMenuItem(
                  value: 'Events',
                  child: Text('Events'),
                ),
                DropdownMenuItem(
                  value: 'Stories',
                  child: Text('Stories'),
                ),
                DropdownMenuItem(
                  value: 'Achievements',
                  child: Text('Achievements'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  category = value ?? 'News';
                });
              },
            ),

            const SizedBox(height: 15),

            const Text('Title'),

            const SizedBox(height: 7),

            AppTextField(
              controller: titleController,
              hint: 'Give your post a title',
              icon: Icons.title,
            ),

            const SizedBox(height: 15),

            const Text('Content'),

            const SizedBox(height: 7),

            TextField(
              controller: contentController,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Write your post here...',
                filled: true,
                fillColor: cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            PrimaryButton(
              text: 'Publish Post',
              onPressed: publishPost,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// STORIES
// ============================================================

