import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/institute_card.dart';
import 'institute_details_page.dart';

class InstitutesPage extends StatelessWidget {
  const InstitutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Institutes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          InstituteCard(
            name: 'Institute of Computing Science',
            acronym: 'ICS',
            icon: Icons.computer,
            iconColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstituteDetailsPage(
                    name: 'Institute of Computing Science',
                    acronym: 'ICS',
                    icon: Icons.computer,
                    iconColor: Colors.red,
                  ),
                ),
              );
            },
          ),

          InstituteCard(
            name: 'Institute of Business Education',
            acronym: 'IBE',
            icon: Icons.business_center,
            iconColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstituteDetailsPage(
                    name: 'Institute of Business Education',
                    acronym: 'IBE',
                    icon: Icons.business_center,
                    iconColor: Colors.blue,
                  ),
                ),
              );
            },
          ),

          InstituteCard(
            name: 'Institute of Arts and Science',
            acronym: 'IAS',
            icon: Icons.menu_book,
            iconColor: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstituteDetailsPage(
                    name: 'Institute of Arts and Science',
                    acronym: 'IAS',
                    icon: Icons.menu_book,
                    iconColor: Colors.green,
                  ),
                ),
              );
            },
          ),

          InstituteCard(
            name: 'Institute of Teacher Education',
            acronym: 'ITE',
            icon: Icons.school,
            iconColor: Colors.amber,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstituteDetailsPage(
                    name: 'Institute of Teacher Education',
                    acronym: 'ITE',
                    icon: Icons.school,
                    iconColor: Colors.amber,
                  ),
                ),
              );
            },
          ),

          InstituteCard(
            name: 'Institute of Hospitality and Tourism Management',
            acronym: 'IHTM',
            icon: Icons.restaurant,
            iconColor: Colors.purple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InstituteDetailsPage(
                    name: 'Institute of Hospitality and Tourism Management',
                    acronym: 'IHTM',
                    icon: Icons.restaurant,
                    iconColor: Colors.purple,
                  ),
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
// INSTITUTE CARD
// ============================================================

