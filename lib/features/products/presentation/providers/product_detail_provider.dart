import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/product.dart';
import 'product_list_provider.dart';

// Using a simple Provider since StateProvider seems to cause issues in this environment
final selectedProductIdProvider = Provider<String?>((ref) => null);

final productDetailProvider = Provider.family<AsyncValue<Product>, String>((ref, id) {
  final productsAsync = ref.watch(productsProvider);
  
  return productsAsync.whenData((products) => 
    products.firstWhere((p) => p.id == id)
  );
});
