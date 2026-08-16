import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductSortOrder {
  none,
  priceAsc,
  priceDesc,
  nameAsc,
}

class ProductSortNotifier extends Notifier<ProductSortOrder> {
  @override
  ProductSortOrder build() => ProductSortOrder.none;

  void setSortOrder(ProductSortOrder order) {
    state = order;
  }
}

final productSortProvider =
    NotifierProvider<ProductSortNotifier, ProductSortOrder>(ProductSortNotifier.new);
