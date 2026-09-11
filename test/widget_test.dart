import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_homepage/main.dart';

void main() {
  testWidgets('displays the grocery home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const GroceryApp());

    expect(find.text('Exclusive Offer'), findsOneWidget);
    expect(find.text('Phnom Penh, Cambodia'), findsOneWidget);
  });

  testWidgets('updates the banner indicator when swiped', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const GroceryApp());

    double indicatorWidth(int index) =>
        tester.getSize(find.byKey(ValueKey('hero-indicator-$index'))).width;

    expect(indicatorWidth(0), 20);
    expect(indicatorWidth(1), 8);

    await tester.drag(
      find.byKey(const ValueKey('hero-carousel-pages')),
      const Offset(-500, 0),
    );
    await tester.pumpAndSettle();

    expect(indicatorWidth(0), 8);
    expect(indicatorWidth(1), 20);
  });

  testWidgets('automatically advances the banner carousel', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const GroceryApp());

    double indicatorWidth(int index) =>
        tester.getSize(find.byKey(ValueKey('hero-indicator-$index'))).width;

    expect(indicatorWidth(0), 20);

    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 250));

    expect(indicatorWidth(0), 8);
    expect(indicatorWidth(1), 20);
  });

  testWidgets('opens the explore screen from bottom navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const GroceryApp());

    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();

    expect(find.text('Find Products'), findsOneWidget);
    expect(find.text('Fresh Produce & Vegetables'), findsOneWidget);

    await tester.drag(find.byType(GridView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Beverages & Drinks'), findsOneWidget);
  });
}
