# VS Code Guidelines for Flutter & Dart Development

Welcome to the guidelines for building beautiful, performant, and maintainable Flutter applications in VS Code. These recommendations ensure best practices, code quality, and a modern developer experience.

## 1. User Interaction
- **Audience:** Assume users are familiar with programming but may be new to Dart/Flutter.
- **Explanations:** When generating code, explain Dart-specific features (null safety, futures, streams).
- **Clarification:** Ask for clarification if requests are ambiguous, especially regarding platform or functionality.
- **Dependencies:** When suggesting packages, explain their benefits and usage.
- **Formatting:** Use the VS Code Dart extension or `dart format` for consistent code style.
- **Linting:** Enable the Dart linter and use recommended rules. Run `dart analyze` regularly.

## 2. Project Structure
- **Standard Layout:** Use the default Flutter project structure (`lib/main.dart` as entry point).
- **Feature Organization:** For large projects, organize code by feature (presentation, domain, data).

## 3. Coding Style & Quality
- **SOLID Principles:** Apply SOLID principles throughout the codebase.
- **Concise & Declarative:** Prefer functional and declarative patterns. Write concise, modern Dart code.
- **Composition over Inheritance:** Build complex widgets and logic using composition.
- **Immutability:** Favor immutable data structures and widgets.
- **Naming Conventions:** Use `PascalCase` for classes, `camelCase` for members/variables/functions/enums, and `snake_case` for files.
- **Error Handling:** Anticipate and handle errors. Avoid silent failures.
- **Testing:** Write code with testing in mind. Use fakes/stubs for dependencies.
- **Logging:** Use the `logging` package or `dart:developer` for structured logs.

## 4. Dart Best Practices
- **Effective Dart:** Follow [Effective Dart](https://dart.dev/effective-dart).
- **Async/Await:** Use `Future`, `async`, and `await` for async operations. Use `Stream` for event sequences.
- **Null Safety:** Write sound null-safe code. Avoid `!` unless guaranteed non-null.
- **Pattern Matching & Records:** Use these features to simplify code.
- **Switch Statements:** Prefer exhaustive switches.
- **Documentation:** Add doc comments to all public APIs. Use `///` for documentation.

## 5. Flutter Best Practices
- **Immutability:** Use immutable widgets, especially `StatelessWidget`.
- **Composition:** Compose smaller widgets. Break down large `build()` methods.
- **List Performance:** Use `ListView.builder` or `SliverList` for long lists.
- **Isolates:** Use `compute()` for expensive calculations.
- **Const Constructors:** Use `const` where possible.

## 6. State Management
- **Built-in Solutions:** Prefer built-in state management (e.g., `ValueNotifier`, `ChangeNotifier`).
- **Streams & Futures:** Use `StreamBuilder` and `FutureBuilder` for async UI updates.
- **MVVM:** Structure complex apps using MVVM.
- **Dependency Injection:** Use manual constructor injection. Use `provider` only if explicitly requested.

## 7. Routing & Navigation
- **GoRouter:** Use `go_router` for declarative navigation and deep linking. Add via `flutter pub add go_router`.
- **Navigator:** Use for dialogs and temporary views.

## 8. Data Handling & Serialization
- **JSON:** Use `json_serializable` and `json_annotation` for JSON parsing/encoding.
- **Field Renaming:** Use `fieldRename: FieldRename.snake` for snake_case JSON keys.

## 9. Visual Design & Theming
- **Centralized Theme:** Define a centralized `ThemeData` for consistent style.
- **Light/Dark Themes:** Support both modes with `ThemeMode` toggle.
- **Color Scheme:** Use `ColorScheme.fromSeed` for harmonious palettes.
- **Custom Fonts:** Use `google_fonts` for custom fonts. Define a `TextTheme`.
- **Responsiveness:** Use `LayoutBuilder` or `MediaQuery` for responsive UIs.
- **Icons & Images:** Use relevant, licensed images. Declare assets in `pubspec.yaml`.

## 10. Layout Best Practices
- **Flexible Layouts:** Use `Expanded`, `Flexible`, `Wrap`, `SingleChildScrollView`, `ListView.builder`, `FittedBox`, `LayoutBuilder`.
- **Stack & Overlay:** Use `Stack`, `Positioned`, `Align`, and `OverlayPortal` for advanced layouts.

## 11. Color & Font Guidelines
- **Contrast:** Meet WCAG 2.1 standards (4.5:1 for text).
- **Palette:** Use the 60-30-10 rule for color balance.
- **Font Selection:** Limit font families, prioritize legibility, use scale and weight for hierarchy.

## 12. Testing
- **Unit/Widget/Integration Tests:** Use `package:test`, `flutter_test`, and `integration_test`.
- **Mocks:** Prefer fakes/stubs. Use `mockito` or `mocktail` if needed.
- **Coverage:** Aim for high coverage.

## 13. Documentation
- **Dartdoc:** Use `///` for doc comments. Start with a summary, add details and code samples.
- **Commenting:** Explain why, not what. Avoid redundancy.

## 14. Accessibility (A11Y)
- **Contrast & Scaling:** Ensure text contrast and dynamic text scaling.
- **Semantic Labels:** Use `Semantics` for clear labels.
- **Screen Reader Testing:** Test with TalkBack (Android) and VoiceOver (iOS).

---

**For more details, see the official [Flutter documentation](https://docs.flutter.dev/) and [Dart documentation](https://dart.dev/).**
