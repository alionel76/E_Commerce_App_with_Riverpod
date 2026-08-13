import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/src/providers/cart_provider.dart';
import 'package:e_commerce_app_with_riverpod/src/models/product.dart';

void main() {
  group('CartNotifier Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is empty', () {
      expect(container.read(cartProvider), []);
    });

    test('add product to cart', () {
      final product = Product(
        id: '1',
        name: 'Test Product',
        description: 'Description',
        price: 10.0,
        imageUrl: '',
        category: 'Test',
      );

      container.read(cartProvider.notifier).addToCart(product);

      final cart = container.read(cartProvider);
      expect(cart.length, 1);
      expect(cart[0].product.id, '1');
      expect(cart[0].quantity, 1);
    });

    test('increment quantity when adding same product', () {
      final product = Product(
        id: '1',
        name: 'Test Product',
        description: 'Description',
        price: 10.0,
        imageUrl: '',
        category: 'Test',
      );

      container.read(cartProvider.notifier).addToCart(product);
      container.read(cartProvider.notifier).addToCart(product);

      final cart = container.read(cartProvider);
      expect(cart.length, 1);
      expect(cart[0].quantity, 2);
    });
  });
}
