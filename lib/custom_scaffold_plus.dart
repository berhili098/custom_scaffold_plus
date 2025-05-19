import 'package:custom_scaffold_plus/body_wrapper.dart';
import 'package:flutter/material.dart';
// import 'package:transportapp/core/shared/widgets/body_wrapper.dart';

/// A powerful, customizable scaffold that supports:
/// - Background images (light/dark)
/// - Scrollable or static content
/// - Pull-to-refresh
/// - Focus dismiss on tap
/// - Floating button positioning
/// - Drawer & bottom nav
class CustomScaffoldPlus extends StatelessWidget {
  /// The main body widget.
  final Widget? body;

  /// Whether to wrap content in a scroll view.
  final bool scrolling;

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
      body: BodyWrapper(
        child: Container(
          decoration: backgroundDecoration,
          child: content,
        ),
      ),
    );
  }
}
