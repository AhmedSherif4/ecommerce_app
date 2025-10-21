enum ToastStates { congrats, error, info, warning }

enum RequestStates { initial, loading, loaded, error }

enum FormattedAppState { initial, loading, error, loaded }

enum BasicDialogStatus { retry, success, failed, halfSuccess }

enum UsersType { child, parent }

enum SendType { phone, email }

enum GenderType { male, female, other }

enum HomeLayoutStatesEnum {
  homeLayoutInitState,
  changeBottomNavState,
  appFlowState,
}

enum PickImageState {
  init,
  startLoadingImage,
  imagePickedSuccessfully,
  imagePickedError,
  imagePickedInValidFormat,
}

enum StringType { english, arabic, quranicArabic, unknown }

enum ImageSourceType { gallery, camera }

enum PickImageShape { item, dialog, bottomSheet }

enum Availability { loading, available, unavailable }

enum TextConverterType {
  title,
  description,
  select_1,
  select_2,
  select_3,
  select_4,
}
