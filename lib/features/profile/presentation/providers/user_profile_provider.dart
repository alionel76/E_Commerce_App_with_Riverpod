import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/user_profile.dart';

class UserProfileNotifier extends Notifier<UserProfile?> {
  @override
  UserProfile? build() => const UserProfile(name: 'Lionel Adandokpossi', email: 'lionel@example.com');

  void updateName(String name) {
    if (state != null) {
      state = UserProfile(name: name, email: state!.email);
    }
  }
}

final userProfileProvider = NotifierProvider<UserProfileNotifier, UserProfile?>(UserProfileNotifier.new);
