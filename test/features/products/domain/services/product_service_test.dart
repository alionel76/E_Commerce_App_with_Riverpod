import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/services/product_service.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/models/product.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/repositories/i_product_repository.dart';
import 'package:e_commerce_app_with_riverpod/features/products/presentation/providers/product_providers.dart';

class MockProductRepository implements IProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    return const [
      Product(id: '1', name: 'Z Laptop', description: 'desc', price: 1000, imageUrl: '', category: 'Electronics'),
      Product(id: '2', name: 'A Sofa', description: 'desc', price: 500, imageUrl: '', category: 'Home'),
      Product(id: '3', name: 'M Watch', description: 'desc', price: 750, imageUrl: '', category: 'Electronics'),
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

    test('Filter by category', () {
      final filtered = service.filterAndSortProducts(products, category: 'Electronics');
      expect(filtered.length, 2);
    });

    test('Filter by search query', () {
      final filtered = service.filterAndSortProducts(products, query: 'sof');
      expect(filtered.length, 1);
      expect(filtered[0].name, 'A Sofa');
    });

    test('Sort by Price ASC', () {
      final result = service.filterAndSortProducts(products, sortOrder: ProductSortOrder.priceAsc);
      expect(result[0].price, 500);
      expect(result[2].price, 1000);
    });

    test('Sort by Price DESC', () {
      final result = service.filterAndSortProducts(products, sortOrder: ProductSortOrder.priceDesc);
      expect(result[0].price, 1000);
      expect(result[2].price, 500);
    });

    test('Sort by Name ASC', () {
      final result = service.filterAndSortProducts(products, sortOrder: ProductSortOrder.nameAsc);
      expect(result[0].name, 'A Sofa');
      expect(result[2].name, 'Z Laptop');
    });
  });
}
