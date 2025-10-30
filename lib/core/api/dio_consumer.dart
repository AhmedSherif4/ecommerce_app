import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../config/resources/app_strings.dart';
import '../../config/routes/routes_names.dart';
import '../../config/storages/keys.dart';
import '../../config/storages/secure_storage.dart';
import '../../my_app/my_app.dart';
import '../exceptions/exceptions.dart';
import '../services/services_locator.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'interceptors.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..connectTimeout = const Duration(minutes: 1)
      ..headers = {apiKey: api}
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < 500;
      };
    client.interceptors.add(AppInterceptors());
    if (kDebugMode) {
      client.interceptors.add(LogInterceptor());
    }
  }

  String api = dotenv.env[AppKeys.supabaseAnonKey]!;
  String apiKey = 'apiKey';

  @override
  Future post(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options:
            options ??
            Options(
              headers: {
                'Authorization':
                    'Bearer ${(await getIt<BaseAppSecurityData>().getToken() != '') ? await getIt<BaseAppSecurityData>().getToken() : ''}',
              },
            ),
      );
      if (response.statusCode == 401) {
        // if (await getIt<BaseAppSecurityData>().getToken() == '') {
        //   getIt<BaseAppSecurityData>().deleteToken();
        // }
        // // if( navigatorKey.currentWidget != AppRoutesNames.rSplashScreen)
        // navigatorKey.currentState?.pushNamedAndRemoveUntil(
        //   AppRoutesNames.rLoginScreen,
        //   (route) => false,
        // );
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future postDataBackParent(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options:
            options ??
            Options(
              headers: {
                'Authorization':
                    'Bearer ${(await getIt<BaseAppSecurityData>().getToken() != '') ? await getIt<BaseAppSecurityData>().getToken() : ''}',
              },
            ),
      );
      if (response.statusCode == 401) {
        // if( navigatorKey.currentWidget != AppRoutesNames.rSplashScreen)
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutesNames.rLoginScreen,
          (route) => false,
        );
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future publicPost(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options:
            options ??
            Options(
              headers: {
                //'Authorization': 'Bearer '' }',
              },
            ),
      );
      if (response.statusCode == 401) {
        if (await getIt<BaseAppSecurityData>().getToken() == '') {
          getIt<BaseAppSecurityData>().deleteToken();
        }
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutesNames.rLoginScreen,
          (route) => false,
        );
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      ServerException(message: error.toString());
    }
  }

  @override
  Future download(
    String url, {
    required dynamic savePath,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await client.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future get(String path, {Options? options}) async {
    try {
      final response = await client.get(path, options: options);
      return response;
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future patch(String path, {Options? options}) async {
    try {
      final response = await client.patch(path, options: options);
      return response;
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future put(String path, {Options? options}) async {
    try {
      final response = await client.put(path, options: options);
      return response;
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future delete(String path, {Options? options}) async {
    try {
      final response = await client.delete(path, options: options);
      return response;
    } on DioException catch (error) {
      _handleError(error);
    } on Exception catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  DioExceptionType? _handleError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        throw const ServerException(
          message: AppStrings.connectionTimeoutWithServer,
        );
      case DioExceptionType.sendTimeout:
        throw const ServerException(message: AppStrings.sendTimeoutWithServer);
      case DioExceptionType.receiveTimeout:
        throw const ServerException(
          message: AppStrings.receiveTimeoutWithServer,
        );
      case DioExceptionType.badCertificate:
        throw const ServerException(
          message: AppStrings.invalidCertificateFromServer,
        );
      case DioExceptionType.badResponse:
        if (dioError.response!.statusCode == 404) {
          throw const ServerException(message: AppStrings.requestNotFound);
        } else if (dioError.response!.statusCode == 500) {
          throw const ServerException(message: AppStrings.serverError);
        } else if (dioError.response!.statusCode == 400 ||
            dioError.response!.statusCode == 401 ||
            dioError.response!.statusCode == 403) {
          // if(dioError.message == 'Unauthorized' &&  AppReference.getCurrentRoute() != AppRoutesNames.rSplashScreen) {
          navigatorKey.currentState!.pushNamedAndRemoveUntil(
            AppRoutesNames.rLoginScreen,
            (route) => false,
          );
          // }else {
          //   throw const ServerException(message: 'حدث خطأ');
          // }
          // } else {
          throw const ServerException(message: AppStrings.genericError);
        }
      case DioExceptionType.cancel:
        throw const ServerException(message: AppStrings.requestCancelled);
      case DioExceptionType.connectionError:
        throw const ServerException(message: AppStrings.noInternetConnection);
      case DioExceptionType.unknown:
        throw const ServerException(message: AppStrings.genericError);
    }
    return null;
  }
}
