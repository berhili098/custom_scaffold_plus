import 'package:flutter/material.dart';

/// A responsive layout widget that adapts to different screen sizes.
///
/// This widget allows you to specify different layouts for mobile, tablet, and desktop screens.
/// It automatically determines the current screen size and renders the appropriate layout.
class ResponsiveLayout extends StatelessWidget {
  /// Widget to display on mobile screens (< 650 width)
  final Widget mobile;

  /// Widget to display on tablet screens (>= 650 width && < 1100 width)
  final Widget? tablet;

  /// Widget to display on desktop screens (>= 1100 width)
  final Widget? desktop;

  /// Custom breakpoint for mobile screens
  final double? mobileBreakpoint;

  /// Custom breakpoint for tablet screens
  final double? tabletBreakpoint;

  /// Creates a responsive layout widget
  ///
  /// The [mobile] parameter is required as it serves as the fallback layout.
  /// If [tablet] is null, the mobile layout will be used for tablet screens.
  /// If [desktop] is null, the tablet layout will be used for desktop screens,
  /// or the mobile layout if tablet is also null.
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.mobileBreakpoint,
    this.tabletBreakpoint,
  });

  /// Returns true if the screen width is less than 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < (650);

  /// Returns true if the screen width is between 650 and 1100
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= (650) &&
      MediaQuery.of(context).size.width < (1100);

  /// Returns true if the screen width is greater than or equal to 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= (1100);

  @override
  Widget build(BuildContext context) {
    final double mobileWidth = mobileBreakpoint ?? 650;
    final double tabletWidth = tabletBreakpoint ?? 1100;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= tabletWidth && desktop != null) {
        return desktop!;
      } else if (constraints.maxWidth >= mobileWidth && tablet != null) {
        return tablet!;
      } else {
        return mobile;
      }
    });
  }
}
