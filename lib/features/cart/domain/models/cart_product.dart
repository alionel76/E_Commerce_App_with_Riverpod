import 'package:equatable/equatable.dart';
import 'package:e_commerce_app_with_riverpod/features/products/domain/models/product.dart';

class CartProduct extends Equatable {
  final Product product;
  final int quantity;

  const CartProduct({required this.product, required this.quantity});

  CartProduct copyWith({Product? product, int? quantity}) {
    return CartProduct(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [product, quantity];
}
