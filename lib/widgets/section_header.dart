import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.dark,
        ),
      ),
      const Text(
        'See all',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.green,
        ),
      ),
    ],
  );
}
