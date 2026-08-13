import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../products/presentation/providers/product_providers.dart';
import '../providers/favorites_provider.dart';
import '../../../products/presentation/widgets/product_card.dart';
import '../../../../core/widgets/async_value_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final productsAsync = ref.watch(productsProvider);

    return AsyncValueWidget(
      value: productsAsync,
      onRetry: () => ref.invalidate(productsProvider),
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
