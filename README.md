# 🧱 custom_scaffold_plus

A powerful, flexible, and production-ready alternative to Flutter's native `Scaffold`.  
`custom_scaffold_plus` provides features like scrollable content with pull-to-refresh, light/dark mode background images, keyboard unfocus gesture, drawer support, bottom navigation, floating action buttons, and more — all in one place.

---

## ✨ Features

- 🎨 Light & Dark mode background image support with smooth transitions
- 🔄 Optional scrollable body with pull-to-refresh
- 🎯 Keyboard dismiss on outside tap
- 🧭 Padding, AppBar, FAB, Drawer, BottomNav
- 📱 Responsive layout with mobile, tablet, and desktop support
- 🔧 Custom FAB positioning & inset behavior
- 📦 Easy to drop in your existing projects
- 🌈 Custom background gradients
- 🖼️ Overlay image support
- 📐 Flexible height control
- ⚡ Customizable animations

---

## ✨ Examples

### Basic Usage

```dart
import 'package:custom_scaffold_plus/custom_scaffold_plus.dart';

// Basic usage
CustomScaffoldPlus(
  body: Center(
    child: Text('Hello World!'),
  ),
)
```

### With Background Image

```dart
CustomScaffoldPlus(
  isDark: true, // Use dark mode background
  darkBackgroundAsset: 'assets/bg_dark.jpg',
  lightBackgroundAsset: 'assets/bg_light.jpg',
  body: Center(
    child: Text('Hello with background!'),
  ),
)
```

### With Scrolling and Refresh

```dart
CustomScaffoldPlus(
  scrolling: true,
  onRefresh: () async {
    // Handle refresh
    await fetchNewData();
  },
  body: Column(
    children: [
      // Your scrollable content
    ],
  ),
)
```

### With Gradient Background

```dart
CustomScaffoldPlus(
  backgroundGradient: LinearGradient(
    colors: [Colors.blue, Colors.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  body: Center(
    child: Text('Gradient Background'),
  ),
)
```

### With Responsive Layout

```dart
ResponsiveLayout(
  mobile: CustomScaffoldPlus(
    // Mobile layout configuration
    body: MobileContent(),
  ),
  tablet: CustomScaffoldPlus(
    // Tablet layout configuration
    body: TabletContent(),
  ),
  desktop: CustomScaffoldPlus(
    // Desktop layout configuration
    body: DesktopContent(),
  ),
)
```

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  custom_scaffold_plus: ^1.0.0
```

## 📋 Available Properties

| Property | Type | Description |
|----------|------|-------------|
| `body` | `Widget?` | The main content of the scaffold |
| `scrolling` | `bool` | Whether to wrap content in a scroll view |
| `padding` | `EdgeInsetsGeometry` | Padding around the body |
| `appBar` | `PreferredSizeWidget?` | App bar widget |
| `onRefresh` | `Function()?` | Callback for pull-to-refresh gesture |
| `backgroundColor` | `Color` | Background color (used if no image is provided) |
| `darkBackgroundAsset` | `String?` | Background image for dark mode |
| `lightBackgroundAsset` | `String?` | Background image for light mode |
| `isDark` | `bool` | Whether the app is in dark mode |
| `floatingActionButton` | `Widget?` | Floating action button |
| `floatingActionButtonLocation` | `FloatingActionButtonLocation?` | Location of the floating button |
| `resizeToAvoidBottomInset` | `bool?` | Whether to resize when keyboard is open |
| `extendBody` | `bool` | Whether to extend the body behind bottom widgets |
| `drawer` | `Widget?` | Optional drawer widget |
| `bottomNavigationBar` | `Widget?` | Optional bottom navigation widget |
| `backgroundGradient` | `Gradient?` | Optional gradient for the background |
| `heightFactor` | `double?` | Optional height factor to control the body height (0.0 to 1.0) |
| `overlayAsset` | `String?` | Optional overlay image asset path |
| `showOverlay` | `bool` | Whether to show the overlay image |
| `bodyAlignment` | `Alignment` | Alignment of the body content |
| `animationDuration` | `Duration` | Duration for theme change animations |
| `animationCurve` | `Curve` | Curve for theme change animations |
