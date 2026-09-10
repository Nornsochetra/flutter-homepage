import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
  });
  final String image, title;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    width: 220,
    margin: const EdgeInsets.only(right: 16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      children: [
        Image.asset(image, width: 100, height: 85),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
