import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ToggleDark extends ThemeEvent {}

class LoadFromStorage extends ThemeEvent {}

class ChangeLocale extends ThemeEvent {
  final String locale;
  const ChangeLocale(this.locale);

  @override
  List<Object?> get props => [locale];
}
