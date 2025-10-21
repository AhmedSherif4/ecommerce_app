import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/theme_manager/domain/i_theme_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/theme_manager/factory/app_theme_factory.dart';
import 'theme_event.dart';
import 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IAppThemeFactory factory;
  final IThemeRepository repository;

  ThemeBloc(this.factory, this.repository)
    : super(ThemeState(isDark: repository.loadThemeMode())) {
    // تغيير Light/Dark
    on<ToggleDark>((event, emit) async {
      final newDark = !state.isDark;
      await repository.saveThemeMode(newDark);
      emit(state.copyWith(isDark: newDark));
    });

    // تحميل الإعدادات من التخزين
    on<LoadFromStorage>((event, emit) async {
      final isDark = repository.loadThemeMode();
      emit(state.copyWith(isDark: isDark));
    });

    // تغيير اللغة
    on<ChangeLocale>((event, emit) async {
      await repository.changeLocale();
      emit(state.copyWith(localeState: RequestStates.loaded));
    });
  }
}

//todo: add the Bottom here to use it in UI
