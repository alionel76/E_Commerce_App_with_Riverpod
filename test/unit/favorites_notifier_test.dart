import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_commerce_app_with_riverpod/src/presentation/providers/favorites_provider.dart';
import 'package:e_commerce_app_with_riverpod/src/presentation/providers/storage_providers.dart';

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

    test('loads initial favorites', () {
      expect(container.read(favoritesProvider), {'1'});
    });
  });
}
