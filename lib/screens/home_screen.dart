import 'package:class_ecommerce_app/screens/favorites.dart';
import 'package:class_ecommerce_app/screens/catalog.dart';
import 'package:class_ecommerce_app/screens/profile.dart';
import 'package:class_ecommerce_app/screens/search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    Catalog(),
    Search(),
    Favorites(),
    Profile(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (currentIndex) {
          selectedIndex = currentIndex;
          setState(() {});
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        // showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Catalog',),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
