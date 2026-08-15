import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/features/profile/presentation/providers/user_provider.dart';

void main() {
  group('UserNotifier Tests', () {
    test('Initial user profile is set', () {
      final container = ProviderContainer();
      final user = container.read(userProvider);
      expect(user?.name, 'Lionel Adandokpossi');
    });

    test('Update user name', () {
      final container = ProviderContainer();
      container.read(userProvider.notifier).updateName('New Name');
      expect(container.read(userProvider)?.name, 'New Name');
    });
  });
}
