import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/main.dart';
import 'package:e_commerce_app_with_riverpod/src/shared/providers/storage_providers.dart';

void main() {
  testWidgets('Full User Flow: App starts, Catalog loads, and Navigation works', (WidgetTester tester) async {
    // Setup mock initial values
    SharedPreferences.setMockInitialValues({'favorites': ['1']});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const MyApp(),
      ),
    );

    // 1. Check Initial State
    expect(find.text('E-Shop'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    
    // 2. Wait for data loading (Mock repository delay)
    await tester.pumpAndSettle(const Duration(seconds: 2));
    
    // 3. Verify Catalog content
    expect(find.byType(TextField), findsOneWidget); // Search bar
    expect(find.text('Electronics'), findsOneWidget); // Category chip
    
    // 4. Test Navigation to Profile
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.text('Lionel Adandokpossi'), findsOneWidget);
    expect(find.text('Dark Mode'), findsOneWidget);

    // 5. Test Navigation to Favorites
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();
    expect(find.text('No favorites yet.'), findsNothing); // We mocked '1' as favorite
  });
}
