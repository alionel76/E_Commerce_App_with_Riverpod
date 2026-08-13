import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProducts();
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

  return productsAsync.whenData((products) {
    if (selectedCategory == null) return products;
    return products.where((p) => p.category == selectedCategory).toList();
  });
});
