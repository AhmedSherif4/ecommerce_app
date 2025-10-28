class EndPoints {
  static const String baseUrl =
      'https://ucyrylmtzpvglhqeztpn.supabase.co/rest/v1/rpc';

  static String imagePath(String imgPath) => '$baseUrl$imgPath';

  static const String checkTokenPath = '/check_user_token';

  static const String getUserData = '/users'; // after login

  static const String updateUserProfile =
      '/update_user_profile'; // after signup

  static const String sendVerificationCode =
      '/send_verification_code'; // (at signup screen) before verify code

  static const String verifyCode =
      '/verify_code'; // (at verification screen) before signup

  //------------------------------------------
  //! payment apis
  static const String createOrder = '/create_order';
  static const String createPayment =
      'https://ucyrylmtzpvglhqeztpn.supabase.co/functions/v1/create-payment';
  static const String initiatePayment = '/initiate_payment';
  static const String getUserOrders = '/get_user_orders';
  //------------------------------------------
  static const String getAllCategories = '/get_all_categories';
  static const String filterProducts = '/filter_products';
  static const String searchProducts = '/search_products';
  static String getAllProductsWithStats(page, limitPerPage) =>
      '/get_all_products_with_stats?&page=$page&limit_per_page=$limitPerPage';
  static String getAllProductsByCategory(id, page, limitPerPage) =>
      '/get_products_by_category?category_id=$id&page=$page&limit_per_page=$limitPerPage';

  //------------------------------------------
  static const String getUserFavorites = '/get_user_favorites';

  static const String addToFavorites = '/add_to_favorites';

  static const String removeFromFavorites = '/remove_from_favorites';
  //------------------------------------------

  static const String forgotPasswordPath = '/api/forget-password';

  static const String checkChildIsSubscribe = '/api/check-child-is-subscribe';

  static const String parentUnLinkChildPath = '/api/parent-unlink-child';

  static const String childAddNewParentPath = '/api/child-add-new-parent';

  static const String childAddExistParentPath = '/api/child-add-exist-parent';

  static const String parentAddNewChildPath = '/api/parent-add-new-child';

  static const String parentAddExistChildPath = '/api/parent-add-exist-child';

  static const String termsAndConditionsPath = '/api/terms-and-conditions';

  static const String getGuestData = '/api/guest-login';

  static const String checkVersion = '/api/check-app-version';

  static const String contactUsPath = '/api/contact-us';

  static const String mePath = '/api/me';

  static const String simulatedStoreExamAnswer =
      '/api/simulated-store-exam-answer';

  static const String simulatedModelAnswers = '/api/simulated-model-answers';

  static const String simulatedExams = '/api/simulated-exams';

  static const String simulatedPlans = '/api/simulated-plans';

  static const String editProfile = '/api/edit-profile';

  static const String changePasswordPath = '/api/change-password';

  static const String childNotification = '/api/child-notification';

  static const String childReadAllNotification =
      '/api/child-read-all-notification';

  static const String institutionUpdateNotification =
      '/api/institution-update-notification';
}
