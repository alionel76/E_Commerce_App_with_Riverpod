import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app_with_riverpod/src/services/product_service.dart';
import 'package:e_commerce_app_with_riverpod/src/models/product.dart';
import 'package:e_commerce_app_with_riverpod/src/repositories/product_repository.dart';

class MockProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    return [
      Product(id: '1', name: 'Laptop', description: 'desc', price: 1000, imageUrl: '', category: 'Electronics'),
      Product(id: '2', name: 'Sofa', description: 'desc', price: 500, imageUrl: '', category: 'Home'),
    ];
  }
}

void main() {
  group('ProductService Tests', () {
    late ProductService service;
    late List<Product> products;

    setUp(() async {
      service = ProductService(MockProductRepository());
      products = await service.getProducts();
    });

    test('filter by category', () {
      final filtered = service.filterProducts(products, category: 'Electronics');
      expect(filtered.length, 1);
      expect(filtered[0].name, 'Laptop');
    });

    test('filter by search query', () {
      final filtered = service.filterProducts(products, query: 'sof');
      expect(filtered.length, 1);
      expect(filtered[0].name, 'Sofa');
    });
  });
}
