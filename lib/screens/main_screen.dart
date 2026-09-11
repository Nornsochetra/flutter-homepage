import 'package:flutter/material.dart';

import '../widgets/app_bottom_navigation.dart';
import 'explore_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _screens = [HomeScreen(), ExploreScreen()];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectScreen(int index) {
    if (index >= _screens.length || index == _currentIndex) return;

    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: PageView(
      key: const ValueKey('main-screen-pages'),
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) => setState(() => _currentIndex = index),
      children: _screens,
    ),
    bottomNavigationBar: AppBottomNavigation(
      currentIndex: _currentIndex,
      onTap: _selectScreen,
    ),
  );
}
