import 'package:ecommerce_app/core/theme_manager/data/theme_repository.dart';
import 'package:ecommerce_app/core/theme_manager/domain/i_theme_repository.dart';
import 'package:injectable/injectable.dart';

import '../factory/app_theme_factory.dart';

@module
abstract class ThemeInjectionModule {
  @lazySingleton
  IAppThemeFactory get themeFactory => AppThemeFactory();

  @lazySingleton
  IThemeRepository get themeRepository => ThemeRepository();
}
