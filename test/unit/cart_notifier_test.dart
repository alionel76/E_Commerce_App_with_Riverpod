import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/src/presentation/providers/cart_provider.dart';
import 'package:e_commerce_app_with_riverpod/src/domain/models/product.dart';

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
      const product = Product(
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
      const product = Product(
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

    test('update quantity', () {
      const product = Product(
        id: '1',
        name: 'Test Product',
        description: 'Description',
        price: 10.0,
        imageUrl: '',
        category: 'Test',
      );

      container.read(cartProvider.notifier).addToCart(product);
      container.read(cartProvider.notifier).updateQuantity('1', 5);

      expect(container.read(cartProvider)[0].quantity, 5);
    });

    test('remove product from cart', () {
      const product = Product(
        id: '1',
        name: 'Test Product',
        description: 'Description',
        price: 10.0,
        imageUrl: '',
        category: 'Test',
      );

      container.read(cartProvider.notifier).addToCart(product);
      container.read(cartProvider.notifier).removeFromCart('1');

      expect(container.read(cartProvider), []);
    });
  });
}
