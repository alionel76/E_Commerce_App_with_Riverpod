import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app_with_riverpod/src/features/products/domain/services/product_service.dart';
import 'package:e_commerce_app_with_riverpod/src/features/products/domain/models/product.dart';
import 'package:e_commerce_app_with_riverpod/src/features/products/domain/repositories/i_product_repository.dart';

class MockProductRepository implements IProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    return const [
      Product(id: '1', name: 'Laptop', description: 'desc', price: 1000, imageUrl: '', category: 'Electronics'),
    ];
  }
}

void main() {
  test('filter products', () async {
    final service = ProductService(MockProductRepository());
    final products = await service.getProducts();
    final filtered = service.filterProducts(products, category: 'Electronics');
    expect(filtered.length, 1);
  });
}
