import 'package:custom_scaffold_plus/custom_scaffold_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomScaffoldPlus renders static child correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomScaffoldPlus(
          body: const Text('Hello World'),
        ),
      ),
    );

    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('CustomScaffoldPlus shows AppBar and FAB',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomScaffoldPlus(
          appBar: AppBar(title: const Text('App Bar')),
          body: const Text('Main Content'),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    expect(find.text('App Bar'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('CustomScaffoldPlus handles dark and light background assets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomScaffoldPlus(
          body: const Text('BG Test'),
          isDark: true,
          darkBackgroundAsset: 'assets/bg_dark.jpg',
          lightBackgroundAsset: 'assets/bg_light.jpg',
        ),
      ),
    );

    // Background images are not visible through `tester`, so we verify no error occurs
    expect(find.text('BG Test'), findsOneWidget);
  });

  testWidgets(
      'CustomScaffoldPlus renders scrollable content with RefreshIndicator',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomScaffoldPlus(
          scrolling: true,
          onRefresh: () async {},
          body: SingleChildScrollView(
            child: Column(
              children: List.generate(50, (index) => Text('Item $index')),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Item 0'), findsOneWidget);
    expect(find.byType(RefreshIndicator), findsOneWidget);
  });
}
