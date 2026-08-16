import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../../domain/services/product_service.dart';
import 'search_provider.dart';
import 'product_filter_provider.dart';
import 'product_sort_provider.dart';

final productRepositoryProvider = Provider<IProductRepository>((ref) => MockProductRepository());

final productServiceProvider = Provider((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductService(repository);
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final service = ref.watch(productServiceProvider);
  return service.getProducts();
});

final filteredProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final productsAsync = ref.watch(productsProvider);
  final selectedCategory = ref.watch(categoryFilterProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final sortOrder = ref.watch(productSortProvider);
  final service = ref.watch(productServiceProvider);

  return productsAsync.whenData((products) {
    return service.filterAndSortProducts(
      products,
      category: selectedCategory,
      query: searchQuery,
      sortOrder: sortOrder,
    );
  });
});
