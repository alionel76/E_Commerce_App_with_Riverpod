import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/src/presentation/providers/favorites_provider.dart';
import 'package:e_commerce_app_with_riverpod/src/presentation/providers/storage_providers.dart';

void main() {
  group('FavoritesNotifier Tests', () {
    late ProviderContainer container;

    setUp(() async {
      SharedPreferences.setMockInitialValues({'favorites': ['1', '2']});
      final prefs = await SharedPreferences.getInstance();
      
      container = ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('loads initial favorites from storage', () {
      final favorites = container.read(favoritesProvider);
      expect(favorites, {'1', '2'});
    });

    test('toggle favorite removes existing item', () async {
      await container.read(favoritesProvider.notifier).toggleFavorite('1');
      final favorites = container.read(favoritesProvider);
      expect(favorites.contains('1'), false);
      expect(favorites.contains('2'), true);
    });

    test('toggle favorite adds new item', () async {
      await container.read(favoritesProvider.notifier).toggleFavorite('3');
      final favorites = container.read(favoritesProvider);
      expect(favorites.contains('3'), true);
    });
  });
}
