import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/main.dart';
import 'package:e_commerce_app_with_riverpod/shared/providers/storage_providers.dart';
import 'package:e_commerce_app_with_riverpod/features/products/presentation/screens/product_list_screen.dart';
import 'package:e_commerce_app_with_riverpod/features/profile/presentation/screens/profile_screen.dart';
import 'package:e_commerce_app_with_riverpod/features/favorites/presentation/screens/favorites_screen.dart';

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
    
    // 2. Wait for data loading (Mock repository delay)
    await tester.pumpAndSettle(const Duration(seconds: 1));
    
    // 3. Verify Product List content
    expect(find.byType(ProductListScreen), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget); // Search bar
    expect(find.text('Electronics'), findsOneWidget); // Category chip
    
    // 4. Test Navigation to Profile
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.byType(ProfileScreen), findsOneWidget);
    expect(find.text('Lionel Adandokpossi'), findsOneWidget);
    expect(find.text('Dark Mode'), findsOneWidget);

    // 5. Test Navigation to Favorites
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();
    expect(find.byType(FavoritesScreen), findsOneWidget);
  });
}
