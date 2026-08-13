import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/main.dart';
import 'package:e_commerce_app_with_riverpod/src/shared/providers/storage_providers.dart';

void main() {
  testWidgets('App starts', (WidgetTester tester) async {
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
    
    // Pump enough to handle the 1-second delay in MockProductRepository
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  });
}
