import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:e_commerce_app_with_riverpod/shared/providers/storage_providers.dart';

void main() {
  group('FavoritesNotifier Tests', () {
    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({'favorites': ['1']});
      final prefs = await SharedPreferences.getInstance();
      container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
      );
    });

    test('Loads initial favorites', () {
      expect(container.read(favoritesProvider), {'1'});
    });

    test('Add favorite', () async {
      await container.read(favoritesProvider.notifier).toggleFavorite('2');
      expect(container.read(favoritesProvider).contains('2'), true);
    });

    test('Remove favorite', () async {
      await container.read(favoritesProvider.notifier).toggleFavorite('1');
      expect(container.read(favoritesProvider).contains('1'), false);
    });

    test('Check if favorite', () {
      expect(container.read(favoritesProvider.notifier).isFavorite('1'), true);
      expect(container.read(favoritesProvider.notifier).isFavorite('99'), false);
    });
  });
}
