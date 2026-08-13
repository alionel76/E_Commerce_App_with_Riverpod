import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app_with_riverpod/src/domain/services/product_service.dart';
import 'package:e_commerce_app_with_riverpod/src/domain/models/product.dart';
import 'package:e_commerce_app_with_riverpod/src/domain/repositories/i_product_repository.dart';

class MockProductRepository implements IProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    return const [
      Product(id: '1', name: 'Laptop', description: 'Powerful laptop', price: 1000, imageUrl: '', category: 'Electronics'),
      Product(id: '2', name: 'Sofa', description: 'Comfy sofa', price: 500, imageUrl: '', category: 'Home'),
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

    test('filter returns all when no criteria', () {
      final filtered = service.filterProducts(products);
      expect(filtered.length, 2);
    });
  });
}
