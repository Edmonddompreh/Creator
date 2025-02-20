import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:creator/features/home/widgets/project_card.dart';
import 'package:creator/features/home/widgets/section_title.dart';
//import 'package:creator/features/home/controllers/homecontrollers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'creator.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Text(
                'THE GHANAIAN HOME MACHINERY',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            SectionTitle(title: 'EXPLORE'),
            ProjectCard(
              title: 'PROJECT 1',
              landSize: '45 x 100',
              bedrooms: 3,
              imagePath: 'assets/project1.jpg',
            ),
            SectionTitle(title: 'New IN'),
            ProjectCard(
              title: 'PROJECT 2',
              deliveryTime: '35 min',
              price: '\$7.99',
              imagePath: 'assets/project2.jpg',
            ),
            SectionTitle(title: 'Apply Early Access'),
            ProjectCard(
              title: 'PROJECT 1',
              landSize: '45 x 100',
              bedrooms: 3,
              imagePath: 'assets/project3.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
