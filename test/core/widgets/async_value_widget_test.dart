import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_app_with_riverpod/core/widgets/async_value_widget.dart';

void main() {
  group('AsyncValueWidget Tests', () {
    testWidgets('Shows data when available', (WidgetTester tester) async {
      const data = 'Loaded Data';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AsyncValueWidget<String>(
              value: const AsyncData(data),
              data: (d) => Text(d),
            ),
          ),
        ),
      );

      expect(find.text(data), findsOneWidget);
    });

    testWidgets('Shows loading indicator', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AsyncValueWidget<String>(
              value: AsyncLoading(),
              data: _dummyBuilder,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Shows error state and triggers retry', (WidgetTester tester) async {
      bool retryTriggered = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AsyncValueWidget<String>(
              value: AsyncError('Error occurred', StackTrace.empty),
              data: (d) => Text(d),
              onRetry: () => retryTriggered = true,
            ),
          ),
        ),
      );

      expect(find.text('Error occurred'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);

      await tester.tap(find.text('Retry'));
      expect(retryTriggered, true);
    });
  });
}

Widget _dummyBuilder(String d) => const SizedBox.shrink();
