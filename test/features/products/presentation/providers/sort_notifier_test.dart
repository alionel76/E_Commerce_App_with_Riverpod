import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/features/products/presentation/providers/product_providers.dart';

void main() {
  group('ProductSortNotifier Tests', () {
    test('initial sort order is none', () {
      final container = ProviderContainer();
      expect(container.read(productSortProvider), ProductSortOrder.none);
    });

    test('can change sort order', () {
      final container = ProviderContainer();
      container.read(productSortProvider.notifier).setSortOrder(ProductSortOrder.priceAsc);
      expect(container.read(productSortProvider), ProductSortOrder.priceAsc);
    });
  });
}
