import '../models/product.dart';
import '../repositories/i_product_repository.dart';

class ProductService {
  final IProductRepository _repository;

  ProductService(this._repository);

  Future<List<Product>> getProducts() async {
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
