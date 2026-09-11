import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) => Container(
    width: 160,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.border),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(product.image, width: 128, fit: BoxFit.contain),
        ),
        const SizedBox(height: 12),
        Text(
          product.name,
          style: const TextStyle(fontSize: 16, color: AppColors.dark),
        ),
        const SizedBox(height: 4),
        Text(
          product.detail,
          style: const TextStyle(fontSize: 14, color: AppColors.muted),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                product.price,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ],
        ),
      ],
    ),
  );
}
