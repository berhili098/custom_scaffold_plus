# 🧱 custom_scaffold_plus

A powerful, flexible, and production-ready alternative to Flutter's native `Scaffold`.  
`custom_scaffold_plus` provides features like scrollable content with pull-to-refresh, light/dark mode background images, keyboard unfocus gesture, drawer support, bottom navigation, floating action buttons, and more — all in one place.

---

## ✨ Features

- 🎨 Light & Dark mode background image support
- 🔄 Optional scrollable body with pull-to-refresh
- 🎯 Keyboard dismiss on outside tap
- 🧭 Padding, AppBar, FAB, Drawer, BottomNav
- 📱 Responsive and extendable layout
- 🔧 Custom FAB positioning & inset behavior
- 📦 Easy to drop in your existing projects

---

## ✨ Example

```dart
import 'package:custom_scaffold_plus/custom_scaffold_plus.dart';

// Basic usage
CustomScaffoldPlust(
  child: Center(
    child: Text('Hello World!'),
  ),
)

// With background image
CustomScaffoldPlust(
  isDark: true, // Use dark mode background
  darkBackgroundAsset: 'assets/bg_dark.jpg',
  lightBackgroundAsset: 'assets/bg_light.jpg',
  child: Center(
    child: Text('Hello with background!'),
  ),
)

// With scrolling and refresh
CustomScaffoldPlust(
  scrolling: true,
  onRefresh: () {
    // Handle refresh
    print('Refreshing...');
  },
  child: Column(
    children: [
      // Your scrollable content
    ],
  ),
)
```

## 🚀 Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  custom_scaffold_plus: ^0.0.1
  ```
