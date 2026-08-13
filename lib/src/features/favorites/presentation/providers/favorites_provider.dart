import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/providers/storage_providers.dart';

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
    state = newState;
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setStringList('favorites', state.toList());
  }

  bool isFavorite(String productId) => state.contains(productId);
}

final favoritesProvider =
    NotifierProvider<FavoritesNotifier, Set<String>>(FavoritesNotifier.new);
