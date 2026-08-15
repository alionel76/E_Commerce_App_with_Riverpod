import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/models/product.dart';
import 'package:e_commerce_app_with_riverpod/features/cart/domain/models/cart_product.dart';
import 'package:e_commerce_app_with_riverpod/features/profile/domain/models/user_profile.dart';

void main() {
  group('Models Tests', () {
    test('Product equality and copyWith', () {
      const product1 = Product(id: '1', name: 'N1', description: 'D1', price: 10, imageUrl: 'I1', category: 'C1');
      const product2 = Product(id: '1', name: 'N1', description: 'D1', price: 10, imageUrl: 'I1', category: 'C1');
      final product3 = product1.copyWith(name: 'N2');

      expect(product1, product2);
      expect(product1 == product3, false);
      expect(product3.name, 'N2');
      expect(product3.id, '1');
    });

    test('CartProduct equality and copyWith', () {
      const product = Product(id: '1', name: 'N1', description: 'D1', price: 10, imageUrl: 'I1', category: 'C1');
      const cart1 = CartProduct(product: product, quantity: 2);
      const cart2 = CartProduct(product: product, quantity: 2);
      final cart3 = cart1.copyWith(quantity: 3);

      expect(cart1, cart2);
      expect(cart1 == cart3, false);
      expect(cart3.quantity, 3);
    });

    test('UserProfile equality and copyWith', () {
      const user1 = UserProfile(name: 'L', email: 'E');
      const user2 = UserProfile(name: 'L', email: 'E');
      final user3 = user1.copyWith(name: 'M');

      expect(user1, user2);
      expect(user1 == user3, false);
      expect(user3.name, 'M');
    });
  });
}
