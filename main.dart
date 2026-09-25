import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CampusChronicleApp());
}

class CampusChronicleApp extends StatelessWidget {
  const CampusChronicleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Chronicle',
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
    );
  }
}
