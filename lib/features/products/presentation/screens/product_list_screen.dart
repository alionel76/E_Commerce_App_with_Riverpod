import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_list_provider.dart';
import '../providers/product_filter_provider.dart';
import '../providers/product_sort_provider.dart';
import '../providers/search_provider.dart';
import '../widgets/product_card.dart';
import '../../../../core/widgets/async_value_widget.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredProductsAsync = ref.watch(filteredProductsProvider);
    final currentFilter = ref.watch(categoryFilterProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => 
                      ref.read(searchQueryProvider.notifier).setQuery(value),
                  decoration: const InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<ProductSortOrder>(
                icon: const Icon(Icons.sort),
                onSelected: (order) => 
                    ref.read(productSortProvider.notifier).setSortOrder(order),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: ProductSortOrder.none,
                    child: Text('Default'),
                  ),
                  const PopupMenuItem(
                    value: ProductSortOrder.priceAsc,
                    child: Text('Price: Low to High'),
                  ),
                  const PopupMenuItem(
                    value: ProductSortOrder.priceDesc,
                    child: Text('Price: High to Low'),
                  ),
                  const PopupMenuItem(
                    value: ProductSortOrder.nameAsc,
                    child: Text('Name: A-Z'),
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              FilterChip(
                label: const Text('All'),
                selected: currentFilter == null,
                onSelected: (_) => ref.read(categoryFilterProvider.notifier).setCategory(null),
              ),
              const SizedBox(width: 8),
              ...['Electronics', 'Home', 'Sports'].map((cat) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  label: Text(cat),
                  selected: currentFilter == cat,
                  onSelected: (_) => ref.read(categoryFilterProvider.notifier).setCategory(cat),
                ),
              )),
            ],
          ),
        ),
        Expanded(
          child: AsyncValueWidget(
            value: filteredProductsAsync,
            onRetry: () => ref.invalidate(productsProvider),
            data: (products) => products.isEmpty 
              ? const Center(child: Text('No products found.'))
              : GridView.builder(
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
          ),
        ),
      ],
    );
  }
}
