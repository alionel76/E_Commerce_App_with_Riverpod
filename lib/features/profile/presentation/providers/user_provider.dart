import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/user_profile.dart';

class UserNotifier extends Notifier<UserProfile?> {
  @override
  UserProfile? build() => const UserProfile(name: 'Lionel Adandokpossi', email: 'lionel@example.com');

  void updateName(String name) {
    if (state != null) {
      state = UserProfile(name: name, email: state!.email);
    }
  }
}

final userProvider = NotifierProvider<UserNotifier, UserProfile?>(UserNotifier.new);
