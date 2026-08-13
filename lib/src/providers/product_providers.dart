import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';
import '../services/product_service.dart';
import 'search_provider.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productServiceProvider = Provider((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductService(repository);
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final service = ref.watch(productServiceProvider);
  return service.getProducts();
});

class CategoryFilter extends Notifier<String?> {
  @override
  String? build() => null;

  void setCategory(String? category) {
    state = category;
  }
}

final categoryFilterProvider =
    NotifierProvider<CategoryFilter, String?>(CategoryFilter.new);

final filteredProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final productsAsync = ref.watch(productsProvider);
  final selectedCategory = ref.watch(categoryFilterProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final service = ref.watch(productServiceProvider);

  return productsAsync.whenData((products) {
    return service.filterProducts(
      products, 
      category: selectedCategory, 
      query: searchQuery
    );
  });
});
