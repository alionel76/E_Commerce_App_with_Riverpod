import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfile {
  final String name;
  final String email;

  UserProfile({required this.name, required this.email});
}

class UserNotifier extends Notifier<UserProfile?> {
  @override
  UserProfile? build() => UserProfile(name: 'Lionel Adandokpossi', email: 'lionel@example.com');

  void updateName(String name) {
    if (state != null) {
      state = UserProfile(name: name, email: state!.email);
    }
  }
}

final userProvider = NotifierProvider<UserNotifier, UserProfile?>(UserNotifier.new);
