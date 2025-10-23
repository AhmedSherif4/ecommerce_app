// import 'package:appsflyer_sdk/appsflyer_sdk.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:tiktok_events_sdk/tiktok_events_sdk.dart';
//
// import '../core/services/services_locator.dart';
// import '../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
//
// class AppAnalytics {
//   const AppAnalytics._internal();
//
//   static const AppAnalytics _instance = AppAnalytics._internal();
//
//   factory AppAnalytics() => _instance;
//
//   static late FirebaseAnalytics analytics;
//   static late FirebaseAnalyticsObserver observer;
//   static late AppsFlyerOptions appsFlyerOptions;
//   static late AppsflyerSdk appsflyerSdk;
//
//   // Initialize Firebase Analytics
//   static void initFirebaseAnalytics() {
//     analytics = FirebaseAnalytics.instance;
//     observer = FirebaseAnalyticsObserver(analytics: analytics);
//     analytics.setAnalyticsCollectionEnabled(true);
//   }
//
//   // Initialize AppsFlyer
//   static Future<void> initAppsFlyer() async {
//     print('initAppsFlyer');
//     try {
//       appsFlyerOptions = AppsFlyerOptions(
//         afDevKey: 'JoJKxi4YEtTMiAV6kdrrFT',
//         appId: '6477544252',
//         showDebug: true,
//         // timeToWaitForATTUserAuthorization: 50, // for iOS 14.5
//         disableAdvertisingIdentifier: true, // Optional field
//         disableCollectASA: true, // Optional field
//         manualStart: true,
//       );
//       appsFlyerOptions.afDevKey;
//
//       appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
//       await appsflyerSdk
//           .initSdk(
//             registerConversionDataCallback: true,
//             registerOnAppOpenAttributionCallback: true,
//             registerOnDeepLinkingCallback: true,
//           )
//           .then((value) => print('AppsFlyer SDK initialized $value'))
//           .catchError((e) => print('Error initializing AppsFlyer: $e'));
//       appsflyerSdk.startSDK(
//         onSuccess: () {
//           print("AppsFlyer SDK initialized successfully.");
//         },
//         onError: (int errorCode, String errorMessage) {
//           print(
//             "Error initializing AppsFlyer SDK: Code $errorCode - $errorMessage",
//           );
//         },
//       );
//
//       await appsflyerSdk.logEvent('open_app', {});
//     } catch (e) {
//       print('Error initializing AppsFlyer: $e');
//     }
//   }
//
//   static Future<void> initTiktokSdk() async {
//     try {
//       // iOS options example
//       const iosOptions = TikTokIosOptions(
//         disableTracking: false, // true would disable ALL tracking
//         disableAutomaticTracking: true,
//         disableSKAdNetworkSupport: true,
//       );
//
//       // Android options example
//       const androidOptions = TikTokAndroidOptions(
//         // disableAutoStart: true,
//         enableAutoIapTrack: true, // enable IAP tracking
//         disableAdvertiserIDCollection: false,
//       );
//
//       // Pass these options to the initialize method
//       await TikTokEventsSdk.initSdk(
//             androidAppId: 'com.edu_tasses.ecommerce_app',
//
//             tikTokAndroidId: '7516516462618525697',
//
//             iosAppId: '6477544252',
//             tiktokIosId: '7482585068863733778',
//             isDebugMode: true,
//             logLevel: TikTokLogLevel.debug,
//             androidOptions: androidOptions,
//             iosOptions: iosOptions,
//           )
//           .then((v) {
//             print('TikTok SDK initialized');
//
//             openAppTikTok();
//           })
//           .catchError((e) {
//             print('Error initializing TikTok SDK: $e');
//           });
//     } catch (e) {
//       print('Error initializing TikTok SDK: $e');
//     }
//   }
//
//   static Future<void> openAppTikTok() async {
//     try {
//       await TikTokEventsSdk.logEvent(
//         event: TikTokEvent(
//           eventName: 'open_app',
//           properties: EventProperties(
//             contentName: 'ecommerce_app',
//             contentType: 'app_launch',
//             customProperties: {
//               'app_name': 'ecommerce_app',
//               'timestamp': DateTime.now().millisecondsSinceEpoch,
//               'platform': 'android',
//               'access_token': 'TTh2TLu0eQgWxWfScpQ0Af4S4Gk0czh2',
//             },
//           ),
//         ),
//       );
//       print('TikTok open_app event logged successfully');
//     } catch (e) {
//       print('Error logging TikTok open_app event: $e');
//     }
//   }
//
//   static Future<void> userRegisterDataAndVerifyPhoneNumberAF({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//   }) async {
//     try {
//       //'name is $name\n mail is $mail\n phone is $phone'.log();
//       await appsflyerSdk
//           .logEvent('user_registered', {
//             'name': name,
//             'phone': phone,
//             'mail': mail,
//           })
//           .then((v) {
//             // 'user_registered logged'.log();
//           })
//           .catchError((e) {
//             //
//           });
//     } catch (e) {
//       //  //
//     }
//   }
//
//   static Future<void> userSelectLevelAF({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//   }) async {
//     try {
//       await appsflyerSdk.logEvent('user_select_level', {
//         'name': name,
//         'phone': phone,
//         'mail': mail,
//       });
//     } catch (e) {
//       //
//     }
//   }
//
//   static Future<void> userAddSubjectToCartAF({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required String subjectName,
//     required int price,
//   }) async {
//     try {
//       await appsflyerSdk.logEvent('user_add_subject_to_cart', {
//         'name': name,
//         'phone': phone,
//         'mail': mail,
//         'subjectName': subjectName,
//         'price': price,
//       });
//       print('user_add_subject_to_cart logged');
//     } catch (e) {
//       print('Error logging event: $e');
//       // //
//     }
//   }
//
//   static Future<void> userOpenCheckoutPageAF({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required int totalPrice,
//   }) async {
//     try {
//       await appsflyerSdk.logEvent('user_open_checkout_page', {
//         'name': name,
//         'phone': phone,
//         'mail': mail,
//         'totalPrice': totalPrice,
//       });
//     } catch (e) {
//       // //
//     }
//   }
//
//   static Future<void> userOpenPaymentPageAndNotPaidOrFailedPaymentAF({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required int totalPrice,
//     required String paymentStatus,
//   }) async {
//     try {
//       await appsflyerSdk
//           .logEvent('user_open_payment_page_and_not_paid_or_failed_payment', {
//             'name': name,
//             'phone': phone,
//             'mail': mail,
//             'totalPrice': totalPrice,
//             'paymentStatus': paymentStatus,
//           });
//     } catch (e) {
//       // //
//     }
//   }
//
//   static Future<void> userPaymentSuccessFullyAF({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required int totalPrice,
//   }) async {
//     try {
//       await appsflyerSdk.logEvent('user_payment_success_fully', {
//         'name': name,
//         'phone': phone,
//         'mail': mail,
//         'totalPrice': totalPrice,
//       });
//     } catch (e) {
//       //
//     }
//   }
//
//   static Future<void> userRegisterDataAndVerifyPhoneNumberTikTok({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//   }) async {
//     try {
//       await TikTokEventsSdk.logEvent(
//         event: TikTokEvent(
//           eventName: 'user_registered',
//           properties: EventProperties(
//             contentName: name,
//             contentType: phone,
//             customProperties: {'mail': mail},
//           ),
//         ),
//       );
//     } catch (e) {
//       //
//     }
//   }
//
//   static Future<void> userSelectLevelTikTok({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//   }) async {
//     try {
//       await TikTokEventsSdk.logEvent(
//         event: TikTokEvent(
//           eventName: 'user_select_level',
//           properties: EventProperties(
//             contentName: name,
//             contentType: phone,
//             customProperties: {'mail': mail},
//           ),
//         ),
//       );
//     } catch (e) {
//       //
//     }
//   }
//
//   static Future<void> userAddSubjectToCartTikTok({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required String subjectName,
//     required int price,
//   }) async {
//     try {
//       await TikTokEventsSdk.logEvent(
//         event: TikTokEvent(
//           eventName: 'user_add_subject_to_cart',
//           properties: EventProperties(
//             contentName: subjectName,
//             contentType: phone,
//             contentId: subjectName,
//             customProperties: {'mail': mail, 'price': price},
//           ),
//         ),
//       ).then((onValue) {
//         //  '''
//         //  user_add_subject_to_cart logged
//         //  name is $name
//         //  phone is $phone
//         // // '''.log();
//       });
//     } catch (e) {
//       // 'error here $e'.log();
//       // )),);
//     } catch (e) {
//       //
//     }
//   }
//
//   static Future<void> userOpenCheckoutPageTikTok({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required int totalPrice,
//   }) async {
//     try {
//       await TikTokEventsSdk.logEvent(
//         event: TikTokEvent(
//           eventName: 'user_open_checkout_page',
//           properties: EventProperties(
//             contentName: name,
//             contentType: phone,
//             customProperties: {'price': totalPrice},
//           ),
//         ),
//       );
//     } catch (e) {
//       //
//     }
//   }
//
//   static Future<void> userOpenPaymentPageAndNotPaidOrFailedPaymentTikTok({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required int totalPrice,
//     required String paymentStatus,
//   }) async {
//     try {
//       await TikTokEventsSdk.logEvent(
//         event: TikTokEvent(
//           eventName: 'user_open_payment_page_and_not_paid_or_failed_payment',
//           properties: EventProperties(
//             contentName: name,
//             contentType: phone,
//             contentId: paymentStatus,
//             customProperties: {'mail': mail, 'price': totalPrice},
//           ),
//         ),
//       );
//     } catch (e) {
//       //
//     }
//   }
//
//   static Future<void> userPaymentSuccessFullyTikTok({
//     required String name,
//     required String phone,
//     String mail = 'mail not set',
//     required int totalPrice,
//   }) async {
//     try {
//       await TikTokEventsSdk.logEvent(
//         event: TikTokEvent(
//           eventName: 'user_payment_success_fully',
//           properties: EventProperties(
//             contentName: name,
//             contentType: phone,
//             customProperties: {'mail': mail, 'price': totalPrice},
//           ),
//         ),
//       );
//     } catch (e) {
//       //
//     }
//   }
//
//   // Set User Property
//   static Future<void> setUserProperty(String name, String value) async {
//     try {
//       await analytics.setUserProperty(name: name, value: value);
//     } catch (e) {
//       print('Error setting user property: $e');
//     }
//   }
//
//   // Log Custom Event
//   static Future<void> logEvent(
//     String name, {
//     Map<String, Object>? parameters,
//   }) async {
//     try {
//       await analytics.logEvent(name: name, parameters: parameters);
//     } catch (e) {
//       print('Error logging event: $e');
//     }
//   }
//
//   // Log Screen View
//   static Future<void> logScreenView(
//     String screenName, {
//     Map<String, Object>? parameters,
//   }) async {
//     try {
//       await analytics.logScreenView(
//         screenName: screenName,
//         parameters: parameters,
//       );
//     } catch (e) {
//       print('Error logging screen view: $e');
//     }
//   }
//
//   // User Login Event
//   static Future<void> loginLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logEvent(
//         'user_login',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//       await logScreenView(
//         'user_login',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // User Sign Up Event
//   static Future<void> signUpLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logEvent(
//         'new_user_sign_up',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//       await logScreenView(
//         'new_user_sign_up',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // App Opened Event
//   static Future<void> appOpenedLogEvent() async {
//     await logEvent('app_opened');
//     await logScreenView('Open_App');
//   }
//
//   // Home Screen Viewed Event
//   static Future<void> viewHomeScreenLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logEvent(
//         'user_open_home_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//       await logScreenView(
//         'user_open_home_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // Lesson Screen Viewed Event
//   static Future<void> viewLessonScreenLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_open_lesson_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // Group Screen Viewed Event
//   static Future<void> viewGroupScreenLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_open_group_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // Question Screen Viewed Event
//   static Future<void> viewQuestionScreenLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_open_question_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // Nafees Screen Viewed Event
//   static Future<void> viewNafeesScreenLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_open_nafees_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // Cart Screen Viewed Event
//   static Future<void> viewCartScreenLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_open_cart_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // Checkout Screen Viewed Event
//   static Future<void> viewCheckoutScreenLogEvent() async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_open_checkout_screen',
//         parameters: {'name': userData.name, 'user_id': userData.id},
//       );
//     }
//   }
//
//   // Add Classroom to Cart Event
//   static Future<void> logAddClassroomToCart({
//     required String classroomName,
//   }) async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logEvent(
//         'user_add_classroom_to_cart',
//         parameters: {
//           'name': userData.name,
//           'user_id': userData.id,
//           'classroomName': classroomName,
//         },
//       );
//       await logScreenView(
//         'user_add_classroom_to_cart',
//         parameters: {
//           'name': userData.name,
//           'user_id': userData.id,
//           'classroomName': classroomName,
//         },
//       );
//     }
//   }
//
//   // Add Term to Cart Event
//   static Future<void> logAddTermToCart({required String termName}) async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_add_term_to_cart',
//         parameters: {
//           'name': userData.name,
//           'user_id': userData.id,
//           'termName': termName,
//         },
//       );
//     }
//   }
//
//   // Add Subject to Cart Event
//   static Future<void> logAddSubjectToCart({required String subjectName}) async {
//     final userData = getIt<UserLocalDataSource>().getUserData();
//     if (userData != null) {
//       await logScreenView(
//         'user_add_subject_to_cart',
//         parameters: {
//           'name': userData.name,
//           'user_id': userData.id,
//           'subjectName': subjectName,
//         },
//       );
//     }
//   }
// }
