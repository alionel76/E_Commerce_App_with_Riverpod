import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/features/products/presentation/providers/product_list_provider.dart';
import 'package:e_commerce_app_with_riverpod/features/products/presentation/providers/product_detail_provider.dart';
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
  test('productDetailProvider fetches correct product', () async {
    final container = ProviderContainer(
      overrides: [
        productRepositoryProvider.overrideWithValue(MockRepo()),
      ],
    );

    // Wait for products to load
    await container.read(productsProvider.future);

    final productAsync = container.read(productDetailProvider('1'));
    expect(productAsync.value?.name, 'P1');
  });
}
