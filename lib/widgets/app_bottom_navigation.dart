import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});
  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    currentIndex: 0,
    selectedItemColor: AppColors.green,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'Favourite',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Account',
      ),
    ],
  );
}
