import 'responsive_strategy.dart';
import 'responsive_manager.dart';

class SpacingContext {
  late final ISpacingConfig _strategy;
  static late SpacingContext _instance;

  SpacingContext._(this._strategy);
  static SpacingContext get instance => _instance;
  ISpacingConfig get spacing => _strategy;

  static void init(DeviceType type) {
    switch (type) {
      case DeviceType.mobile:
        _instance = SpacingContext._(MobileSpacingConfig());
        break;
      case DeviceType.tablet:
        _instance = SpacingContext._(TabletSpacingConfig());
        break;
    }
  }
}
