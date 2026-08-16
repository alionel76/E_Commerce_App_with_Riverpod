import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/features/products/presentation/providers/product_list_provider.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/models/product.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/repositories/i_product_repository.dart';

class MockRepo implements IProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    return [
      const Product(id: '1', name: 'P1', description: 'D1', price: 10, imageUrl: '', category: 'C1'),
    ];
  }
}

void main() {
  test('productsProvider fetches products from repository', () async {
    final container = ProviderContainer(
      overrides: [
        productRepositoryProvider.overrideWithValue(MockRepo()),
      ],
    );

    final products = await container.read(productsProvider.future);
    expect(products.length, 1);
    expect(products[0].name, 'P1');
  });
}
