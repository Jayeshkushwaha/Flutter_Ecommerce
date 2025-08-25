import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/screens/ecommerce_home_screen.dart';

void main() {
  testWidgets('EcommerceHomeScreen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: EcommerceHomeScreen(),
      ),
    );

    // Verify that the app bar title is displayed
    expect(find.text('Stylish'), findsOneWidget);
    
    // Verify that the search bar is displayed
    expect(find.byType(TextField), findsOneWidget);
    
    // Verify that the categories section is displayed
    expect(find.text('Categories'), findsOneWidget);
    
    // Verify that the deal of the day section is displayed
    expect(find.text('Deal of the Day'), findsOneWidget);
    
    // Verify that the trending products section is displayed
    expect(find.text('Trending Products'), findsOneWidget);
  });
}