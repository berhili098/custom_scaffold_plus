library;

import 'package:custom_scaffold_plus/body_wrapper.dart';
import 'package:flutter/material.dart';

export 'package:custom_scaffold_plus/body_wrapper.dart';
export 'package:custom_scaffold_plus/responsive_layout.dart';

/// A powerful, customizable scaffold that supports:
/// - Background images (light/dark)
/// - Scrollable or static content
/// - Pull-to-refresh
/// - Focus dismiss on tap
/// - Floating button positioning
/// - Drawer & bottom nav
/// - Custom background gradients
/// - Responsive height adjustments
/// - Custom overlay images
class CustomScaffoldPlus extends StatelessWidget {
  /// The main body widget.
  final Widget? body;

  /// Whether to wrap content in a scroll view.
  final bool scrolling;

  final bool hasSafeArea;

  /// Padding around the body.
  final EdgeInsetsGeometry padding;

  /// App bar widget.
  final PreferredSizeWidget? appBar;

  /// Callback for pull-to-refresh gesture.
  final void Function()? onRefresh;

  /// Background color (used if no image is provided).
  final Color backgroundColor;

  /// Background image for dark mode.
  final String? darkBackgroundAsset;

  /// Background image for light mode.
  final String? lightBackgroundAsset;

  /// Whether the app is in dark mode.
  final bool isDark;

  /// Floating action button.
  final Widget? floatingActionButton;

  /// Location of the floating button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Whether to resize when keyboard is open.
  final bool? resizeToAvoidBottomInset;

  /// Whether to extend the body behind bottom widgets.
  final bool extendBody;

  /// Optional drawer widget.
  final Widget? drawer;

  /// Optional bottom navigation widget.
  final Widget? bottomNavigationBar;

  /// Optional gradient for the background.
  final Gradient? backgroundGradient;

  /// Optional height factor to control the body height (0.0 to 1.0).
  final double? heightFactor;

  /// Optional overlay image asset path.
  final String? overlayAsset;

  /// Whether to show the overlay image.
  final bool showOverlay;

  /// Alignment of the body content.
  final Alignment bodyAlignment;

  /// Duration for theme change animations.
  final Duration animationDuration;

  /// Curve for theme change animations.
  final Curve animationCurve;

  const CustomScaffoldPlus({
    super.key,
    this.body,
    this.scrolling = false,
    this.padding = EdgeInsets.zero,
    this.appBar,
    this.onRefresh,
    this.backgroundColor = Colors.white,
    this.darkBackgroundAsset,
    this.lightBackgroundAsset,
    this.isDark = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.drawer,
    this.bottomNavigationBar,
    this.backgroundGradient,
    this.heightFactor,
    this.overlayAsset,
    this.hasSafeArea = true,
    this.showOverlay = false,
    this.bodyAlignment = Alignment.topCenter,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundDecoration = (darkBackgroundAsset != null || lightBackgroundAsset != null)
        ? BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isDark ? darkBackgroundAsset! : lightBackgroundAsset!,
              ),
              fit: BoxFit.cover,
            ),
          )
        : null;

    Widget content = GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: scrolling
          ? RefreshIndicator(
              onRefresh: () async => onRefresh?.call(),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: Padding(
                      padding: padding,
                      child: body,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: padding,
              child: body,
            ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      extendBody: extendBody,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      body: AnimatedSwitcher(
          duration: animationDuration,
          switchInCurve: animationCurve,
          switchOutCurve: animationCurve,
          child: SafeArea(
            bottom: hasSafeArea,
            top: false,
            left: hasSafeArea,
            right: hasSafeArea,
            child: BodyWrapper(
              backgroundColor: backgroundColor,
              gradient: backgroundGradient,
              heightFactor: heightFactor,
              alignment: bodyAlignment,
              bgOverlay: overlayAsset,
              showOverlay: showOverlay,
              child: Container(
                padding: padding,
                key: ValueKey<bool>(isDark),
                decoration: backgroundDecoration,
                child: content,
              ),
            ),
          )),
    );
  }
}
