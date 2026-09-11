import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/app_colors.dart';
import '../widgets/category_card.dart';
import '../widgets/hero_carousel.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const exclusive = [
    Product(
      image: 'assets/products/banana.png',
      name: 'Organic\nBananas',
      detail: '7pcs, Price',
      price: '\$ 4.99',
    ),
    Product(
      image: 'assets/products/apple.png',
      name: 'Red Apple',
      detail: '1Kg, Price',
      price: '\$ 8.99',
    ),
    Product(
      image: 'assets/products/carrot.png',
      name: 'Green Apple',
      detail: '1Kg, Price',
      price: '\$ 9.99',
    ),
  ];
  static const bestSelling = [
    Product(
      image: 'assets/products/pepper.png',
      name: 'Red Pepper',
      detail: '100g, Price',
      price: '\$ 2.79',
    ),
    Product(
      image: 'assets/products/tomato.png',
      name: 'Tomato',
      detail: '1Kg, Price',
      price: '\$ 7.99',
    ),
    Product(
      image: 'assets/products/green-apple.png',
      name: 'Green Apple',
      detail: '1Kg, Price',
      price: '\$ 12.99',
    ),
  ];
  static const groceries = [
    Product(
      image: 'assets/products/Beef.png',
      name: 'Beef',
      detail: '100g, Price',
      price: '\$ 20.88',
    ),
    Product(
      image: 'assets/products/Chicken.png',
      name: 'Chicken',
      detail: '1pcs, Price',
      price: '\$ 22.75',
    ),
    Product(
      image: 'assets/products/green-apple.png',
      name: 'Green Apple',
      detail: '1Kg, Price',
      price: '\$ 12.99',
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
        children: [
          Center(
            child: Image.asset('assets/logo/carrot.png', width: 26, height: 28),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: AppColors.muted),
              SizedBox(width: 7),
              Text(
                'Phnom Penh, Cambodia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your product',
                hintStyle: const TextStyle(
                  color: AppColors.muted,
                  fontWeight: FontWeight.w600,
                ),
                prefixIcon: const Icon(Icons.search, size: 28),
                filled: true,
                fillColor: AppColors.searchBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const HeroCarousel(),
          _section('Exclusive Offer', exclusive),
          _section('Best Selling', bestSelling),
          const SizedBox(height: 22),
          const SectionHeader(title: 'Groceries'),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryCard(
                  image: 'assets/categories/pulse.png',
                  title: 'Pulses',
                  color: Color(0x26F8A44C),
                ),
                CategoryCard(
                  image: 'assets/categories/rices.png',
                  title: 'Rices',
                  color: Color(0x2653B175),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _productRow(groceries),
        ],
      ),
    ),
  );

  Widget _section(String title, List<Product> products) => Column(
    children: [
      const SizedBox(height: 22),
      SectionHeader(title: title),
      const SizedBox(height: 16),
      _productRow(products),
    ],
  );
  Widget _productRow(List<Product> products) => SizedBox(
    height: 248,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (_, _) => const SizedBox(width: 16),
      itemBuilder: (_, i) => ProductCard(product: products[i]),
    ),
  );
}
