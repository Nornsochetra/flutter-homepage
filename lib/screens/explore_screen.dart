import 'package:flutter/material.dart';

import '../models/explore_category.dart';
import '../utils/app_colors.dart';
import '../widgets/explore_category_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const categories = [
    ExploreCategory(
      name: 'Fresh Produce & Vegetables',
      image: 'assets/explores/pngfuel 6.png',
      color: Color(0xFF53B175),
    ),
    ExploreCategory(
      name: 'Oils, Condiments & Cooking Essentials',
      image: 'assets/explores/pngfuel 8.png',
      color: Color(0xFFF8A44C),
    ),
    ExploreCategory(
      name: 'Fresh Meat, Seafood & Poultry',
      image: 'assets/explores/pngfuel 9.png',
      color: Color(0xFFF7A593),
    ),
    ExploreCategory(
      name: 'Bakery, Breads & Grains',
      image: 'assets/explores/pngfuel 7.png',
      color: Color(0xFFD3B0E0),
    ),
    ExploreCategory(
      name: 'Dairy & Eggs',
      image: 'assets/explores/pngfuel.png',
      color: Color(0xFFFDE598),
    ),
    ExploreCategory(
      name: 'Beverages & Drinks',
      image: 'assets/explores/pngfuel 5.png',
      color: Color(0xFFB7DFF5),
    ),
  ];

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        children: [
          const Text(
            'Find Products',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            height: 52,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Store',
                hintStyle: const TextStyle(
                  color: AppColors.muted,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.dark,
                  size: 28,
                ),
                filled: true,
                fillColor: AppColors.searchBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 376),
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 180 / 240,
                  ),
                  itemBuilder: (_, index) =>
                      ExploreCategoryCard(category: categories[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
