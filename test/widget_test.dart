import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/main.dart';
import 'package:e_commerce_app_with_riverpod/src/providers/storage_providers.dart';

void main() {
  testWidgets('App starts and shows catalog with mock storage', (WidgetTester tester) async {
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

    expect(find.text('E-Shop'), findsOneWidget);
    
    // Initial loading state
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    
    await tester.pumpAndSettle();
    
    // After products are loaded
    expect(find.byType(TextField), findsOneWidget); // Search bar
    expect(find.byIcon(Icons.sort), findsOneWidget); // Sort button
  });
}
