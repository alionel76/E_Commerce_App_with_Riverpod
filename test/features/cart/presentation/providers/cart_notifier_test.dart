import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/features/cart/presentation/providers/cart_provider.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/models/product.dart';

void main() {
  group('CartNotifier Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state is empty', () {
      expect(container.read(cartProvider), []);
    });

    test('Add product to cart', () {
      const product = Product(id: '1', name: 'P1', description: 'D1', price: 10.0, imageUrl: '', category: 'T1');
      container.read(cartProvider.notifier).addToCart(product);
      final cart = container.read(cartProvider);
      expect(cart.length, 1);
      expect(cart[0].product.id, '1');
      expect(cart[0].quantity, 1);
    });

    test('Increment quantity when adding same product', () {
      const product = Product(id: '1', name: 'P1', description: 'D1', price: 10.0, imageUrl: '', category: 'T1');
      container.read(cartProvider.notifier).addToCart(product);
      container.read(cartProvider.notifier).addToCart(product);
      final cart = container.read(cartProvider);
      expect(cart.length, 1);
      expect(cart[0].quantity, 2);
    });

    test('Update quantity', () {
      const product = Product(id: '1', name: 'P1', description: 'D1', price: 10.0, imageUrl: '', category: 'T1');
      container.read(cartProvider.notifier).addToCart(product);
      container.read(cartProvider.notifier).updateQuantity('1', 5);
      expect(container.read(cartProvider)[0].quantity, 5);
    });

    test('Remove item when quantity is set to 0', () {
      const product = Product(id: '1', name: 'P1', description: 'D1', price: 10.0, imageUrl: '', category: 'T1');
      container.read(cartProvider.notifier).addToCart(product);
      container.read(cartProvider.notifier).updateQuantity('1', 0);
      expect(container.read(cartProvider).isEmpty, true);
    });

    test('Remove product from cart', () {
      const product = Product(id: '1', name: 'P1', description: 'D1', price: 10.0, imageUrl: '', category: 'T1');
      container.read(cartProvider.notifier).addToCart(product);
      container.read(cartProvider.notifier).removeFromCart('1');
      expect(container.read(cartProvider), []);
    });

    test('Calculate total price', () {
      const p1 = Product(id: '1', name: 'P1', description: 'D1', price: 10.0, imageUrl: '', category: 'T1');
      const p2 = Product(id: '2', name: 'P2', description: 'D2', price: 20.0, imageUrl: '', category: 'T2');
      container.read(cartProvider.notifier).addToCart(p1);
      container.read(cartProvider.notifier).updateQuantity('1', 2); // 20
      container.read(cartProvider.notifier).addToCart(p2); // 20
      expect(container.read(cartProvider.notifier).totalPrice, 40.0);
    });
  });
}
