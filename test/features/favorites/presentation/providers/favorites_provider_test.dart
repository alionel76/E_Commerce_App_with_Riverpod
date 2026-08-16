import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:e_commerce_app_with_riverpod/shared/providers/storage_providers.dart';

void main() {
  group('FavoritesNotifier Tests', () {
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({'favorites': ['1']});
      prefs = await SharedPreferences.getInstance();
    });

    test('Initial state is loaded from SharedPreferences', () async {
      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
      );
      
      final favorites = container.read(favoritesProvider);
      expect(favorites.contains('1'), true);
      expect(favorites.length, 1);
    });

    test('Toggle favorite adds/removes and persists', () async {
      final container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
      );

      // Add '2'
      await container.read(favoritesProvider.notifier).toggleFavorite('2');
      expect(container.read(favoritesProvider).contains('2'), true);
      expect(prefs.getStringList('favorites'), contains('2'));

      // Remove '1'
      await container.read(favoritesProvider.notifier).toggleFavorite('1');
      expect(container.read(favoritesProvider).contains('1'), false);
      expect(prefs.getStringList('favorites'), isNot(contains('1')));
    });
  });
}
