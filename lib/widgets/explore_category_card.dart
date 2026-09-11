import 'package:flutter/material.dart';

import '../models/explore_category.dart';
import '../utils/app_colors.dart';

class ExploreCategoryCard extends StatelessWidget {
  const ExploreCategoryCard({super.key, required this.category});

  final ExploreCategory category;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: category.color.withValues(alpha: 0.10),
      border: Border.all(color: category.color.withValues(alpha: 0.70)),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Expanded(
          child: Image.asset(
            category.image,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          category.name,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.dark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
        ),
      ],
    ),
  );
}
