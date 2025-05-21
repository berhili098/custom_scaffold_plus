import 'package:custom_scaffold_plus/custom_scaffold_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ResponsiveLayout shows mobile layout on small screens',
      (WidgetTester tester) async {
    // Set up a small screen size

    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveLayout(
          mobile: const Text('Mobile Layout'),
          tablet: const Text('Tablet Layout'),
          desktop: const Text('Desktop Layout'),
        ),
      ),
    );

    expect(find.text('Mobile Layout'), findsOneWidget);
    expect(find.text('Tablet Layout'), findsNothing);
    expect(find.text('Desktop Layout'), findsNothing);

    // Reset the screen size
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('ResponsiveLayout shows tablet layout on medium screens',
      (WidgetTester tester) async {
    // Set up a medium screen size

    tester.view.physicalSize = const Size(800, 1024);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveLayout(
          mobile: const Text('Mobile Layout'),
          tablet: const Text('Tablet Layout'),
          desktop: const Text('Desktop Layout'),
        ),
      ),
    );

    expect(find.text('Mobile Layout'), findsNothing);
    expect(find.text('Tablet Layout'), findsOneWidget);
    expect(find.text('Desktop Layout'), findsNothing);

    // Reset the screen size
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('ResponsiveLayout shows desktop layout on large screens',
      (WidgetTester tester) async {
    // Set up a large screen size
    tester.view.physicalSize = const Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveLayout(
          mobile: const Text('Mobile Layout'),
          tablet: const Text('Tablet Layout'),
          desktop: const Text('Desktop Layout'),
        ),
      ),
    );

    expect(find.text('Mobile Layout'), findsNothing);
    expect(find.text('Tablet Layout'), findsNothing);
    expect(find.text('Desktop Layout'), findsOneWidget);

    // Reset the screen size
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('ResponsiveLayout falls back to mobile when tablet is null',
      (WidgetTester tester) async {
    // Set up a medium screen size
    tester.view.physicalSize = const Size(800, 1024);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveLayout(
          mobile: const Text('Mobile Layout'),
          // tablet is null
          desktop: const Text('Desktop Layout'),
        ),
      ),
    );

    expect(find.text('Mobile Layout'), findsOneWidget);
    expect(find.text('Desktop Layout'), findsNothing);

    // Reset the screen size
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });

  testWidgets('ResponsiveLayout uses custom breakpoints',
      (WidgetTester tester) async {
    // Set up a screen size that would normally be tablet
    tester.view.physicalSize = const Size(800, 1024);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      MaterialApp(
        home: ResponsiveLayout(
          mobile: const Text('Mobile Layout'),
          tablet: const Text('Tablet Layout'),
          desktop: const Text('Desktop Layout'),
          // Set custom breakpoint higher than the test screen width
          mobileBreakpoint: 900,
        ),
      ),
    );

    // Should show mobile layout because of custom breakpoint
    expect(find.text('Mobile Layout'), findsOneWidget);
    expect(find.text('Tablet Layout'), findsNothing);
    expect(find.text('Desktop Layout'), findsNothing);

    // Reset the screen size
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
