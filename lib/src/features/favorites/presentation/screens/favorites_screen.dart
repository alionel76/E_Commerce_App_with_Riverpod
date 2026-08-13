import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/src/features/products/presentation/providers/product_providers.dart';
import 'package:e_commerce_app_with_riverpod/src/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:e_commerce_app_with_riverpod/src/features/products/presentation/widgets/product_card.dart';
import 'package:e_commerce_app_with_riverpod/src/core/widgets/async_value_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final productsAsync = ref.watch(productsProvider);

    return AsyncValueWidget(
      value: productsAsync,
      data: (products) {
        final favoriteProducts = products.where((p) => favorites.contains(p.id)).toList();
        
        if (favoriteProducts.isEmpty) {
          return const Center(child: Text('No favorites yet.'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) => ProductCard(product: favoriteProducts[index]),
        );
      },
    );
  }
}
