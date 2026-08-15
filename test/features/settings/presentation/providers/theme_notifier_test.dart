import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/features/settings/presentation/providers/theme_provider.dart';
import 'package:e_commerce_app_with_riverpod/shared/providers/storage_providers.dart';

void main() {
  group('ThemeNotifier Tests', () {
    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({'theme_mode': ThemeMode.dark.index});
      final prefs = await SharedPreferences.getInstance();
      container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
      );
    });

    test('Loads initial theme from storage', () {
      expect(container.read(themeProvider), ThemeMode.dark);
    });

    test('Toggle theme', () async {
      await container.read(themeProvider.notifier).toggleTheme();
      expect(container.read(themeProvider), ThemeMode.light);
    });
  });
}
