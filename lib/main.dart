import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(const GroceryApp());

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Online Groceries',
    theme: ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
    ),
    home: const HomeScreen(),
  );
}
