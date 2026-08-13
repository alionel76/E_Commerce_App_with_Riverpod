import '../models/product.dart';
import '../repositories/product_repository.dart';

class ProductService {
  final ProductRepository _repository;

  ProductService(this._repository);

  Future<List<Product>> getProducts() async {
    // Add business logic here if needed (filtering, sorting, etc.)
    return _repository.fetchProducts();
  }

  List<Product> filterProducts(List<Product> products, {String? category, String? query}) {
    return products.where((p) {
      final matchesCategory = category == null || p.category == category;
      final matchesQuery = query == null || 
          p.name.toLowerCase().contains(query.toLowerCase()) ||
          p.description.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }
}
