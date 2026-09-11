import 'dart:async';

import 'package:flutter/material.dart';

class HeroCarousel extends StatefulWidget {
  const HeroCarousel({super.key});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  static const _slides = [
    _PromoSlide(
      image: 'assets/images/hero.png',
      background: Color(0xFF315C3A),
      fullBleed: true,
    ),
    _PromoSlide(
      image: 'assets/products/banana.png',
      background: Color(0xFFFFE8A3),
    ),
    _PromoSlide(
      image: 'assets/products/apple.png',
      background: Color(0xFFDCEFE2),
    ),
  ];

  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_pageController.hasClients) return;

      final nextPage = (_currentPage + 1) % _slides.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 140,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            key: const ValueKey('hero-carousel-pages'),
            controller: _pageController,
            itemCount: _slides.length,
            onPageChanged: (page) => setState(() => _currentPage = page),
            itemBuilder: (_, index) => _slides[index],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.28),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _slides.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    right: index == _slides.length - 1 ? 0 : 4,
                  ),
                  child: _Indicator(
                    key: ValueKey('hero-indicator-$index'),
                    active: index == _currentPage,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _PromoSlide extends StatelessWidget {
  const _PromoSlide({
    required this.image,
    required this.background,
    this.fullBleed = false,
  });

  final String image;
  final Color background;
  final bool fullBleed;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: background,
    child: fullBleed
        ? Image.asset(image, fit: BoxFit.cover)
        : Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
  );
}

class _Indicator extends StatelessWidget {
  const _Indicator({super.key, this.active = false});

  final bool active;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    width: active ? 20 : 8,
    height: 6,
    decoration: BoxDecoration(
      color: active ? const Color(0xFF53B175) : Colors.white70,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
