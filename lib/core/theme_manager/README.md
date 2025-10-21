# 🎨 Flutter Advanced Theme System (Light/Dark with Semantic Colors)

This project demonstrates a **scalable and maintainable theming system** in Flutter:
- ✅ Light & Dark Theme support.
- ✅ Full Color System from a UI/UX design system.
- ✅ `SemanticColors` layer for meaningful color usage.
- ✅ `ThemeExtension` (`AppColorsTheme`) for easy access to semantic colors.
- ✅ Integration with Bloc (`ThemeBloc`) to toggle theme at runtime.
- ✅ Easily add new colors or change mappings later.

---

## 📌 Folder Structure
```
lib/
 └── core/
      └── theme_manager/
           ├── tokens/color_tokens.dart
           ├── models/semantic_colors.dart
           ├── extensions/app_theme_extensions.dart
           ├── factory/app_theme_factory.dart
           └── service/app_colors.dart (helper/extension for usage)
```

---

## 🚀 How It Works

### 1️⃣ Color Tokens
**File:** `color_tokens.dart`  
👉 **Purpose:** Raw colors from your design system (e.g. Blue500, Grey50, etc.)  
These are just constants and **never change at runtime**.

Example:
```dart
static const blue500 = Color(0xFF2A78FF);
static const grey50  = Color(0xFFF9FAFB);
```

---

### 2️⃣ Semantic Colors
**File:** `semantic_colors.dart`  
👉 **Purpose:** A higher-level layer that maps raw tokens to their **semantic meaning** in your app:
- `brandPrimary` = Main brand color.
- `surfaceBackground` = Main background.
- `success` = Success feedback color.
- `error` = Error feedback color.
…and so on.

✅ **Why?**  
If the brand color changes later (e.g. from blue to green), you only update in one place instead of searching the whole app.

---

### 3️⃣ Theme Factory
**File:** `app_theme_factory.dart`  
👉 **Purpose:** Build `ThemeData` (for Light and Dark) **from your `SemanticColors`.**

- `buildTheme(isDark: bool)` returns a full `ThemeData`.
- `_lightSemantic()` and `_darkSemantic()` define how tokens map to semantic colors for each theme.

✨ **If you want to add a new theme (e.g. HighContrast):**  
Create a new `_highContrastSemantic()` and add a switch in `buildTheme`.

---

### 4️⃣ Theme Extension
**File:** `app_theme_extensions.dart`  
👉 **Purpose:** Allow you to attach `SemanticColors` directly to `ThemeData` as an extension.

```dart
extensions: [
  AppColorsTheme(semantic: colors),
],
```

Then anywhere in your app:
```dart
final colors = Theme.of(context).extension<AppColorsTheme>()!.semantic;
```

✅ **Why?**  
Clean and semantic usage in your widgets, without passing colors manually.

---

### 5️⃣ Usage Helper (Optional)
**File:** `app_colors.dart`  
👉 **Purpose:** Add a `BuildContext` extension for even cleaner usage:
```dart
extension AppColorExt on BuildContext {
  SemanticColors get colors =>
      Theme.of(this).extension<AppColorsTheme>()!.semantic;
}
```

✅ **Usage:**
```dart
Text('Hello', style: TextStyle(color: context.colors.brandPrimary));
Container(color: context.colors.surfaceBackground);
```

---

### 6️⃣ ThemeBloc (Optional)
**File:** `theme_bloc.dart`  
👉 **Purpose:** Toggle between Light and Dark at runtime and persist user choice.

✅ **Events:**
- `ThemeEvent.toggleDark()` → switches between light & dark.
- `ThemeEvent.loadFromStorage()` → loads saved theme at startup.

✅ **State:**
- `ThemeState(currentTheme, isDark)` holds the current `ThemeData`.

---

## 🎨 Adding a New Color
1. Add the raw color to `color_tokens.dart`:
```dart
static const purple500 = Color(0xFF9C27B0);
```

2. Map it in `semantic_colors.dart` (if needed):
```dart
final Color specialHighlight;
```
Add it to the constructor and `copyWith`.

3. Update `_lightSemantic()` and `_darkSemantic()` in `app_theme_factory.dart`:
```dart
specialHighlight: ColorTokens.purple500,
```

4. Done! Now you can access it:
```dart
context.colors.specialHighlight
```

---

## 🚦 Disabling One Theme
If you want **only Light Theme**:
```dart
ThemeData buildTheme({required bool isDark}) {
  return _themeFromSemantic(_lightSemantic(), false);
}
```

If you want **only Dark Theme**:
```dart
ThemeData buildTheme({required bool isDark}) {
  return _themeFromSemantic(_darkSemantic(), true);
}
```

---

## ✅ Summary
| Feature            | File                        | Purpose                        |
|--------------------|-----------------------------|--------------------------------|
| 🎨 Raw Tokens      | `color_tokens.dart`         | Store base colors from DS      |
| 🔤 Semantic Layer  | `semantic_colors.dart`      | Map tokens to meaningful roles |
| 🏗 Theme Builder   | `app_theme_factory.dart`    | Build ThemeData from semantics |
| 🧩 Theme Extension | `app_theme_extensions.dart` | Attach semantics to ThemeData  |
| ✨ Usage Helper     | `app_colors.dart`           | Easy `context.colors` access   |
| 🔄 State Mgmt      | `theme_bloc.dart`           | Toggle & persist themes        |

---

💙 **Happy Theming!**  
If you need to add more brands, colors, or want a code sample for multi-brand support, just ask! 🚀🔥
