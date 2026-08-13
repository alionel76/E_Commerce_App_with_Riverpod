import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    _loadFavorites();
    return {};
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    state = favorites.toSet();
  }

  Future<void> toggleFavorite(String productId) async {
    final newState = Set<String>.from(state);
    if (newState.contains(productId)) {
      newState.remove(productId);
    } else {
      newState.add(productId);
    }
    state = newState;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', state.toList());
  }

  bool isFavorite(String productId) => state.contains(productId);
}

final favoritesProvider =
    NotifierProvider<FavoritesNotifier, Set<String>>(FavoritesNotifier.new);
