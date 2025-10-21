# 📄 Responsive System Feature Doc

## ✨ Overview

This document explains the **Responsive System** used in this project. It is designed for **enterprise-level Flutter apps** and follows **OOP**, **OOD**, **SOLID**, and uses **Strategy** and **Facade** design patterns to ensure clean code and scalability.

---

## 📂 Files Structure

Place these files under `lib/core/responsive/`:

```
lib/core/responsive/
 ├── responsive_manager.dart        // Core logic for responsive calculations
 ├── responsive_extensions.dart     // Extensions on num for .w .h .f .r
 ├── responsive_strategy.dart       // Strategies for spacing (Mobile/Tablet/etc.)
 ├── responsive_context.dart        // Context to pick the right strategy
 ├── spacing_facade.dart            // Facade for easy access to spacing values
 ├── app_sizes.dart                 // Centralized page paddings, margins, etc.
 └── app_borders.dart               // Centralized border radius values
```

---

## 📏 ResponsiveManager

Handles conversion of px to responsive units based on device type and orientation.

**Example:**

```dart
ResponsiveManager.init(context);

10.w // width responsive
20.h // height responsive
14.f // font size responsive
12.r // border radius responsive
```

---

## 🎯 Spacing Strategies (Strategy Pattern)

Defines spacing tokens for each device type:

```dart
class MobileSpacingConfig implements ISpacingConfig {
  @override double get xs => 4;
  @override double get s => 8;
  @override double get m => 16;
  @override double get l => 24;
  @override double get xl => 32;
}
```

Tablet, Foldable, and Desktop each have their own configs.

**Init:**

```dart
SpacingContext.init(ResponsiveManager.deviceType);
Spacing.m // returns responsive value based on device
```

---

## ✨ Spacing Facade

Provides simple access to spacing and ready-made widgets:

```dart
Spacing.s    // spacing value
Spacing.mH   // SizedBox with vertical spacing
Spacing.lW   // SizedBox with horizontal spacing
```

---

## 📐 AppSizes

Central place for common paddings/margins:

```dart
class AppSizes {
  static EdgeInsets get pagePadding => EdgeInsets.symmetric(
    horizontal: Spacing.l,
    vertical: Spacing.m,
  );
}
```

---

## 🎨 AppBorders

Central place for border radius:

```dart
class AppBorders {
  static BorderRadius get defaultRadius => BorderRadius.circular(
    ResponsiveManager.deviceType == DeviceType.tablet ? 16.r : 12.r,
  );
}
```

---

## 🔧 Usage in Pages

```dart
@override
Widget build(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ResponsiveManager.init(context);
    SpacingContext.init(ResponsiveManager.deviceType);
  });

  return Scaffold(
    body: Padding(
      padding: AppSizes.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Responsive Text', style: TextStyle(fontSize: 16.f)),
          Spacing.mH,
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: AppBorders.defaultRadius,
            ),
          ),
        ],
      ),
    ),
  );
}
```

---

## ➕ Add New Spacing Token

- Update `ISpacingConfig` and all its implementations.
- It will be automatically available in `Spacing` Facade.

---

## 📊 Responsive Accuracy

- `.w` & `.h` calculated from screen size vs reference design.
- `.f` respects `textScaleFactor`.
- `.r` calculates radius proportionally.

✅ Fully scalable and accurate for large projects.

---

**✔️ Ready to integrate into your feature directory!**

