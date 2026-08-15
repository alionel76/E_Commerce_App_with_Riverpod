import '../models/product.dart';
import '../repositories/i_product_repository.dart';
import '../../presentation/providers/product_providers.dart';

class ProductService {
  final IProductRepository _repository;

  ProductService(this._repository);

  Future<List<Product>> getProducts() async {
    return _repository.fetchProducts();
  }

  List<Product> filterAndSortProducts(
    List<Product> products, {
    String? category,
    String? query,
    ProductSortOrder sortOrder = ProductSortOrder.none,
  }) {
    // 1. Filtering
    var filtered = products.where((p) {
      final matchesCategory = category == null || p.category == category;
      final matchesQuery = query == null ||
          p.name.toLowerCase().contains(query.toLowerCase()) ||
          p.description.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();

    // 2. Sorting
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
  }
}
