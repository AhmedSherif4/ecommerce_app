import 'package:ecommerce_app/config/resources/app_strings.dart';

class AppValidation {
  static emailValidation() => (String? email) {
    if (email!.isEmpty) {
      return AppStrings.pleaseEnterEmail;
    } else if (!RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    ).hasMatch(email.trim())) {
      return AppStrings.invalidEmail;
    }
  };

  static phoneValidation() => (String? emailOrPhone) {
    if (emailOrPhone!.isEmpty) {
      return AppStrings.pleaseEnterPhoneNumber;
    } else if (!RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        ).hasMatch(emailOrPhone) &&
        !RegExp(
          r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$",
        ).hasMatch(emailOrPhone)) {
      return AppStrings.invalidPhoneNumber;
    }
  };

  static passwordValidation() => (String? password) {
    if (password!.isEmpty) {
      return AppStrings.pleaseEnterPassword;
    }
  };
  static phoneNumberValidation() => (String? phone) {
    if (phone!.isEmpty) {
      return AppStrings.pleaseEnterPhoneNumber;
    } else if (phone.length < 7) {
      return AppStrings.phoneNumberMin7Digits;
    } else if (!RegExp(
      r'^(?:\+9660?|00966|009660?|9660?|0)?5(\d{8})$',
    ).hasMatch(phone)) {
      return AppStrings.invalidPhoneNumber;
    }
  };

  static egyptianPhoneNumberValidation() => (String? phone) {
    if (phone == null || phone.isEmpty) {
      return AppStrings.pleaseEnterPhoneNumber;
    } else if (phone.length < 11) {
      return AppStrings.phoneNumberMin11Digits;
    } else if (!RegExp(r'^(?:\+201|01)?[0-2,5]{1}\d{8}$').hasMatch(phone)) {
      return AppStrings.invalidPhoneNumber;
    }
  };

  static nameValidation() => (value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterFullName;
    }
  };
}
