import 'package:class_ecommerce_app/screens/favorites.dart';
import 'package:class_ecommerce_app/screens/catalog.dart';
import 'package:class_ecommerce_app/screens/profile.dart';
import 'package:class_ecommerce_app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectIndexProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> screens = [Catalog(), Search(), Favorites(), Profile()];
    final selectedIndex = ref.watch(selectIndexProvider);
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (currentIndex) {
          ref.read(selectIndexProvider.notifier).state = currentIndex;
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        // showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Catalog'),
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
