import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 45,
              backgroundColor: cardColor2,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Juan Dela Cruz',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'student@campus.edu',
              style: TextStyle(
                color: textMuted,
              ),
            ),

            const SizedBox(height: 30),

            ListTile(
              tileColor: cardColor,
              leading: const Icon(Icons.person_outline),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Edit profile selected.'),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            ListTile(
              tileColor: cardColor,
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Settings selected.'),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            ListTile(
              tileColor: cardColor,
              leading: const Icon(
                Icons.logout,
                color: primaryRed,
              ),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
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
// ACHIEVEMENTS
// ============================================================

