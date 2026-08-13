import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/main.dart';
import 'package:e_commerce_app_with_riverpod/src/presentation/providers/storage_providers.dart';

void main() {
  testWidgets('App starts and shows catalog with mock storage', (WidgetTester tester) async {
    // Setup mock initial values for SharedPreferences
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const MyApp(),
      ),
    );

    // Verify AppBar title
    expect(find.text('E-Shop'), findsOneWidget);
    
    // Initially, it should show a loading indicator (due to repository delay)
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    
    // Wait for the mock network delay and animations
    await tester.pumpAndSettle();
    
    // Verify that the catalog components are visible
    expect(find.byType(TextField), findsOneWidget); // Search bar
    expect(find.byIcon(Icons.sort), findsOneWidget); // Sort button
    expect(find.byType(FilterChip), findsAtLeastNWidgets(1)); // Category chips
  });
}
