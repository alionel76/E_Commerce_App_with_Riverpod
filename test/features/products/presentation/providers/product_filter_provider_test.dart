import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/features/products/presentation/providers/product_filter_provider.dart';

void main() {
  test('categoryFilterProvider initial state is null', () {
    final container = ProviderContainer();
    expect(container.read(categoryFilterProvider), null);
  });

  test('categoryFilterProvider can change category', () {
    final container = ProviderContainer();
    container.read(categoryFilterProvider.notifier).setCategory('Electronics');
    expect(container.read(categoryFilterProvider), 'Electronics');
  });
}
