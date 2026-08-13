import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_providers.dart';
import '../widgets/product_card.dart';

class CatalogScreen extends ConsumerWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredProductsAsync = ref.watch(filteredProductsProvider);
    final currentFilter = ref.watch(categoryFilterProvider);

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              FilterChip(
                label: const Text('All'),
                selected: currentFilter == null,
                onSelected: (_) => ref.read(categoryFilterProvider.notifier).state = null,
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Electronics'),
                selected: currentFilter == 'Electronics',
                onSelected: (_) => ref.read(categoryFilterProvider.notifier).state = 'Electronics',
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Home'),
                selected: currentFilter == 'Home',
                onSelected: (_) => ref.read(categoryFilterProvider.notifier).state = 'Home',
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Sports'),
                selected: currentFilter == 'Sports',
                onSelected: (_) => ref.read(categoryFilterProvider.notifier).state = 'Sports',
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredProductsAsync.when(
            data: (products) => GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(product: products[index]),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }
}
