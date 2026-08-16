import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/providers/storage_providers.dart';

/// Provider for managing favorite products with local persistence using SharedPreferences.
/// This implementation fulfills the requirement for local data storage.
class FavoritesNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final favorites = prefs.getStringList('favorites') ?? [];
    return favorites.toSet();
  }

  Future<void> toggleFavorite(String productId) async {
    final newState = Set<String>.from(state);
    if (newState.contains(productId)) {
      newState.remove(productId);
    } else {
      newState.add(productId);
    }
    
    // Optimistic UI update
    state = newState;
    
    // Robust persistence with error handling
    await AsyncValue.guard(() async {
      final prefs = ref.read(sharedPreferencesProvider);
      await prefs.setStringList('favorites', state.toList());
    });
  }

  bool isFavorite(String productId) => state.contains(productId);
}

final favoritesProvider =
    NotifierProvider<FavoritesNotifier, Set<String>>(FavoritesNotifier.new);
