import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../../domain/services/product_service.dart';
import 'search_provider.dart';

enum ProductSortOrder {
  none,
  priceAsc,
  priceDesc,
  nameAsc,
}

final productRepositoryProvider = Provider<IProductRepository>((ref) => MockProductRepository());

final productServiceProvider = Provider((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductService(repository);
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final service = ref.watch(productServiceProvider);
  return service.getProducts();
});

class CategoryFilterNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setCategory(String? category) {
    state = category;
  }
}

final categoryFilterProvider =
    NotifierProvider<CategoryFilterNotifier, String?>(CategoryFilterNotifier.new);

class ProductSortNotifier extends Notifier<ProductSortOrder> {
  @override
  ProductSortOrder build() => ProductSortOrder.none;

  void setSortOrder(ProductSortOrder order) {
    state = order;
  }
}

final productSortProvider =
    NotifierProvider<ProductSortNotifier, ProductSortOrder>(ProductSortNotifier.new);

final filteredProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final productsAsync = ref.watch(productsProvider);
  final selectedCategory = ref.watch(categoryFilterProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final sortOrder = ref.watch(productSortProvider);
  final service = ref.watch(productServiceProvider);

  return productsAsync.whenData((products) {
    var filtered = service.filterProducts(
      products, 
      category: selectedCategory, 
      query: searchQuery
    );

    switch (sortOrder) {
      case ProductSortOrder.priceAsc:
        filtered.sort((a, b) => a.price.compareTo(b.price));
        break;
      case ProductSortOrder.priceDesc:
        filtered.sort((a, b) => b.price.compareTo(a.price));
        break;
      case ProductSortOrder.nameAsc:
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case ProductSortOrder.none:
        break;
    }
    
    return filtered;
  });
});
