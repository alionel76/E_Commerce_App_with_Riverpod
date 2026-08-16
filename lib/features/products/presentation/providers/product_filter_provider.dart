import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryFilterNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setCategory(String? category) {
    state = category;
  }
}

final categoryFilterProvider =
    NotifierProvider<CategoryFilterNotifier, String?>(CategoryFilterNotifier.new);
