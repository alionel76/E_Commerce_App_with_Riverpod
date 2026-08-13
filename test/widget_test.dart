import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/main.dart';

void main() {
  testWidgets('App starts and shows catalog', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    expect(find.text('E-Shop'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    
    await tester.pumpAndSettle();
    
    expect(find.byType(TextField), findsOneWidget); // Search bar
  });
}
