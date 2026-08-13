import '../../domain/models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Product(
        id: '1',
        name: 'Smartphone Pro',
        description: 'High-end smartphone with amazing camera.',
        price: 999.99,
        imageUrl: 'https://picsum.photos/seed/1/200',
        category: 'Electronics',
      ),
      Product(
        id: '2',
        name: 'Wireless Headphones',
        description: 'Noise cancelling headphones for music lovers.',
        price: 199.99,
        imageUrl: 'https://picsum.photos/seed/2/200',
        category: 'Electronics',
      ),
      Product(
        id: '3',
        name: 'Coffee Maker',
        description: 'Brew the perfect cup every morning.',
        price: 79.99,
        imageUrl: 'https://picsum.photos/seed/3/200',
        category: 'Home',
      ),
      Product(
        id: '4',
        name: 'Running Shoes',
        description: 'Lightweight shoes for long distance running.',
        price: 120.00,
        imageUrl: 'https://picsum.photos/seed/4/200',
        category: 'Sports',
      ),
      Product(
        id: '5',
        name: 'Yoga Mat',
        description: 'Non-slip mat for your daily yoga sessions.',
        price: 25.00,
        imageUrl: 'https://picsum.photos/seed/5/200',
        category: 'Sports',
      ),
      Product(
        id: '6',
        name: 'Smart Watch',
        description: 'Track your fitness and stay connected.',
        price: 249.99,
        imageUrl: 'https://picsum.photos/seed/6/200',
        category: 'Electronics',
      ),
    ];
  }
}
