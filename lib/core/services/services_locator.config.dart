// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce_app/config/base_local_data_source/base_local_data_source.dart'
    as _i1055;
import 'package:ecommerce_app/config/base_remote_data_source/base_remote_data_source.dart'
    as _i831;
import 'package:ecommerce_app/config/base_repository/base_repository.dart'
    as _i407;
import 'package:ecommerce_app/config/storages/secure_storage.dart' as _i226;
import 'package:ecommerce_app/core/api/api_consumer.dart' as _i176;
import 'package:ecommerce_app/core/api/dio_consumer.dart' as _i190;
import 'package:ecommerce_app/core/api/interceptors.dart' as _i348;
import 'package:ecommerce_app/core/api/network_info.dart' as _i405;
import 'package:ecommerce_app/core/services/third_party_instance.dart' as _i481;
import 'package:ecommerce_app/core/shared_models/user/data/user_local_data_source/user_local_data_source.dart'
    as _i183;
import 'package:ecommerce_app/core/shared_widget/image_pick/image_pick_view_model/image_pick_bloc.dart'
    as _i352;
import 'package:ecommerce_app/core/theme_manager/domain/i_theme_repository.dart'
    as _i103;
import 'package:ecommerce_app/core/theme_manager/factory/app_theme_factory.dart'
    as _i778;
import 'package:ecommerce_app/core/theme_manager/service/injection_module.dart'
    as _i399;
import 'package:ecommerce_app/core/theme_manager/theme_bloc/theme_bloc.dart'
    as _i976;
import 'package:ecommerce_app/features/auth/complete_profile_screen/data/social_register_data_source/social_register_remote_data_source.dart'
    as _i55;
import 'package:ecommerce_app/features/auth/complete_profile_screen/data/social_registetr_repository/social_register_repository.dart'
    as _i984;
import 'package:ecommerce_app/features/auth/complete_profile_screen/domain/social_register_base_repository/social_register_base_repository.dart'
    as _i395;
import 'package:ecommerce_app/features/auth/complete_profile_screen/domain/social_register_usecases/social_register_usecase.dart'
    as _i1023;
import 'package:ecommerce_app/features/auth/complete_profile_screen/social_register_view_model/social_register_bloc.dart'
    as _i867;
import 'package:ecommerce_app/features/auth/forget_password/forget_password.dart'
    as _i733;
import 'package:ecommerce_app/features/auth/login/domain/login_usecases/social_login_use_case.dart'
    as _i49;
import 'package:ecommerce_app/features/auth/login/login.dart' as _i569;
import 'package:ecommerce_app/features/auth/sign_up/sign_up.dart' as _i613;
import 'package:ecommerce_app/features/auth/verification/verification.dart'
    as _i1054;
import 'package:ecommerce_app/features/home_layout/data/data_source/home_layout_remote_data_source/home_layout_remote_data_source.dart'
    as _i834;
import 'package:ecommerce_app/features/home_layout/data/data_source/home_layout_repository_impl/home_layout_repository_impl.dart'
    as _i34;
import 'package:ecommerce_app/features/home_layout/domain/repository/home_layout_repository.dart'
    as _i80;
import 'package:ecommerce_app/features/home_layout/domain/usecase/check_chils_is_subscribe_use_usecase.dart'
    as _i778;
import 'package:ecommerce_app/features/home_layout/home_layout.dart' as _i708;
import 'package:ecommerce_app/features/intro/global/data/global_data_source/global_remote_data_source.dart'
    as _i1042;
import 'package:ecommerce_app/features/intro/global/data/global_screen_repository/global_repository.dart'
    as _i432;
import 'package:ecommerce_app/features/intro/global/domain/global_base_repository/global_base_repository.dart'
    as _i764;
import 'package:ecommerce_app/features/intro/global/domain/global_usecases/global_usecase.dart'
    as _i1065;
import 'package:ecommerce_app/features/intro/global/global_view_model/global_bloc.dart'
    as _i866;
import 'package:ecommerce_app/features/intro/onboarding/on_boarding_local_data.dart'
    as _i504;
import 'package:ecommerce_app/features/intro/splash/data/splash_data_source/splash_remote_data_source.dart'
    as _i29;
import 'package:ecommerce_app/features/intro/splash/data/splash_screen_repository/splash_repository.dart'
    as _i670;
import 'package:ecommerce_app/features/intro/splash/domain/splash_base_repository/splash_base_repository.dart'
    as _i974;
import 'package:ecommerce_app/features/intro/splash/domain/splash_usecases/check_token_usecase.dart'
    as _i390;
import 'package:ecommerce_app/features/intro/splash/presentation/splash_view_model/splash_bloc.dart'
    as _i409;
import 'package:ecommerce_app/features/shared_features/contact_us/data/contact_us_data_source/contact_us_local_data_sourcec.dart'
    as _i510;
import 'package:ecommerce_app/features/shared_features/contact_us/data/contact_us_data_source/contact_us_remote_data_source.dart'
    as _i793;
import 'package:ecommerce_app/features/shared_features/contact_us/data/contact_us_repository/contact_us_repository.dart'
    as _i614;
import 'package:ecommerce_app/features/shared_features/contact_us/domain/contact_us_base_repository/contact_us_base_repository.dart'
    as _i687;
import 'package:ecommerce_app/features/shared_features/contact_us/domain/contact_us_usecases/contact_us_usecase.dart'
    as _i109;
import 'package:ecommerce_app/features/shared_features/contact_us/presentations/view_model/contact_us_bloc.dart'
    as _i380;
import 'package:ecommerce_app/features/shared_features/get_social_data/data/get_social_remote_data_source/get_social_remote_data_source.dart'
    as _i530;
import 'package:ecommerce_app/features/shared_features/get_social_data/data/get_social_repository/get_social_repository_impl.dart'
    as _i253;
import 'package:ecommerce_app/features/shared_features/get_social_data/domain/get_social_base_repository/get_social_base_repository.dart'
    as _i648;
import 'package:ecommerce_app/features/shared_features/get_social_data/domain/use_cases/get_apple_data.dart'
    as _i377;
import 'package:ecommerce_app/features/shared_features/get_social_data/domain/use_cases/get_google_data.dart'
    as _i802;
import 'package:ecommerce_app/features/shared_features/get_social_data/presentation/get_social_data_view_model/get_social_data_bloc.dart'
    as _i641;
import 'package:ecommerce_app/features/shared_features/notification/data/remote_data_source/notification_remote_data_source.dart'
    as _i414;
import 'package:ecommerce_app/features/shared_features/notification/data/repository/notification_repository_impl.dart'
    as _i640;
import 'package:ecommerce_app/features/shared_features/notification/domain/repository/notification_repository.dart'
    as _i799;
import 'package:ecommerce_app/features/shared_features/notification/domain/use_case/notification_use_case.dart'
    as _i167;
import 'package:ecommerce_app/features/shared_features/notification/presentation/view_model/notification_bloc.dart'
    as _i532;
import 'package:ecommerce_app/features/shared_features/profile/edit_profile/edit_profile.dart'
    as _i893;
import 'package:ecommerce_app/features/shared_features/simulated_plans/simulated_plans.dart'
    as _i537;
import 'package:ecommerce_app/features/shared_features/terms_and_conditions/terms_and_conditions.dart'
    as _i567;
import 'package:ecommerce_app/features/shared_features/un_link/un_link.dart'
    as _i879;
import 'package:ecommerce_app/features/shared_logic/localization_logic/presentation/localization_view_model/localization_bloc.dart'
    as _i954;
import 'package:ecommerce_app/my_app/notification/i_notification_service.dart'
    as _i651;
import 'package:ecommerce_app/my_app/notification/injectable_module.dart'
    as _i843;
import 'package:ecommerce_app/my_app/notification/notification_handler.dart'
    as _i412;
import 'package:ecommerce_app/my_app/notification/notification_initializer.dart'
    as _i496;
import 'package:ecommerce_app/my_app/notification/notification_router_strategy.dart'
    as _i242;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    final themeInjectionModule = _$ThemeInjectionModule();
    final notificationInjectableModule = _$NotificationInjectableModule();
    gh.factory<_i352.ImagePickBloc>(() => _i352.ImagePickBloc());
    gh.factory<_i954.LanguageBloc>(() => _i954.LanguageBloc());
    gh.lazySingleton<_i348.AppInterceptors>(() => _i348.AppInterceptors());
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => injectableModule.flutterSecureStorage,
    );
    gh.lazySingleton<_i454.SupabaseClient>(
      () => injectableModule.supabaseClient,
    );
    gh.lazySingleton<_i778.IAppThemeFactory>(
      () => themeInjectionModule.themeFactory,
    );
    gh.lazySingleton<_i103.IThemeRepository>(
      () => themeInjectionModule.themeRepository,
    );
    gh.lazySingleton<_i892.FirebaseMessaging>(
      () => notificationInjectableModule.firebaseMessaging,
    );
    gh.lazySingleton<_i163.FlutterLocalNotificationsPlugin>(
      () => notificationInjectableModule.localNotif,
    );
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => notificationInjectableModule.navigatorKey,
    );
    gh.lazySingleton<_i242.NotificationRouterStrategy>(
      () => notificationInjectableModule.notificationRouterStrategy,
    );
    gh.lazySingleton<_i496.NotificationInitializer>(
      () => notificationInjectableModule.notificationInitializer,
    );
    gh.lazySingleton<_i412.LocalNotificationHandler>(
      () => notificationInjectableModule.localNotificationHandler,
    );
    gh.lazySingleton<_i651.INotificationService>(
      () => notificationInjectableModule.notificationService,
    );
    gh.lazySingleton<_i1055.BaseLocalDataSource>(
      () => _i1055.BaseLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i405.NetworkInfo>(
      () => _i405.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i183.UserLocalDataSource>(
      () => _i183.UserLocalDataSourceImpl(
        baseLocalDataSource: gh<_i1055.BaseLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i407.BaseRepository>(() => _i407.BaseRepositoryImpl());
    gh.factory<_i976.ThemeBloc>(
      () => _i976.ThemeBloc(
        gh<_i778.IAppThemeFactory>(),
        gh<_i103.IThemeRepository>(),
      ),
    );
    gh.lazySingleton<_i176.ApiConsumer>(
      () => _i190.DioConsumer(client: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i510.GetContactUsLocalDataSource>(
      () => _i510.GetContactUsLocalDataSourceImpl(
        localDataSource: gh<_i1055.BaseLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i567.GetTermsAndConditionsLocalDataSource>(
      () => _i567.GetTermsAndConditionsLocalDataSourceImpl(
        localDataSource: gh<_i1055.BaseLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i226.BaseAppSecurityData>(
      () => _i226.AppSecurityData(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i831.BaseRemoteDataSource>(
      () => _i831.BaseRemoteDataSourceImpl(
        apiConsumer: gh<_i176.ApiConsumer>(),
        networkInfo: gh<_i405.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i793.ContactUsRemoteDataSource>(
      () => _i793.ContactUssRemoteDataSourceImpl(
        gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i893.EditProfileRemoteDataSource>(
      () => _i893.EditProfileRemoteDataSourceImpl(
        baseRemoteDataSource: gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i567.TermsAndConditionsRemoteDataSource>(
      () => _i567.TermsAndConditionsRemoteDataSourceImpl(
        gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i414.NotificationRemoteDataSource>(
      () => _i414.NotificationRemoteDataSourceImpl(
        remoteDataSource: gh<_i831.BaseRemoteDataSource>(),
        apiConsumer: gh<_i176.ApiConsumer>(),
      ),
    );
    gh.lazySingleton<_i893.EditProfileBaseRepository>(
      () => _i893.EditProfileRepository(
        remoteDataSource: gh<_i893.EditProfileRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i29.CheckUserTokenBaseRemoteDataSource>(
      () => _i29.CheckUserTokenRemoteDataSourceImpl(
        networkInfo: gh<_i405.NetworkInfo>(),
        apiConsumer: gh<_i176.ApiConsumer>(),
        baseRemoteDataSource: gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i504.OnBoardingLocalData>(
      () => _i504.OnBoardingLocalDataImpl(
        baseLocalDataSource: gh<_i1055.BaseLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i537.SimulatedRemoteDataSource>(
      () => _i537.SimulatedRemoteDataSourceImpl(
        baseRemoteDataSource: gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i613.SignUpRemoteDataSource>(
      () => _i613.SignUpRemoteDataSourceImpl(gh<_i831.BaseRemoteDataSource>()),
    );
    gh.lazySingleton<_i687.ContactUsBaseRepository>(
      () => _i614.ContactUsRepository(
        localDataSource: gh<_i510.GetContactUsLocalDataSource>(),
        remoteDataSource: gh<_i793.ContactUsRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i109.GetContactUsUseCase>(
      () => _i109.GetContactUsUseCase(
        repository: gh<_i687.ContactUsBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i613.SignUpBaseRepository>(
      () => _i613.SignUpRepository(
        remoteDataSource: gh<_i613.SignUpRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i1054.VerificationRemoteDataSource>(
      () => _i1054.VerificationRemoteDataSourceImpl(
        apiConsumer: gh<_i176.ApiConsumer>(),
        networkInfo: gh<_i405.NetworkInfo>(),
        baseDataSource: gh<_i831.BaseRemoteDataSource>(),
        client: gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i799.NotificationRepository>(
      () => _i640.NotificationRepositoryImpl(
        notificationRemoteDataSource: gh<_i414.NotificationRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i879.UnLinkRemoteDataSource>(
      () => _i879.UnLinkRemoteDataSourceImpl(gh<_i831.BaseRemoteDataSource>()),
    );
    gh.lazySingleton<_i1042.GlobalBaseRemoteDataSource>(
      () => _i1042.GlobalRemoteDataSourceImpl(
        networkInfo: gh<_i405.NetworkInfo>(),
        apiConsumer: gh<_i176.ApiConsumer>(),
        baseRemoteDataSource: gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i55.SocialRegisterBaseRemoteDataSource>(
      () => _i55.SocialRegisterRemoteDataSourceImpl(
        baseDataSource: gh<_i831.BaseRemoteDataSource>(),
        client: gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i530.GetSocialDataBaseRemoteDataSource>(
      () => _i530.GetSocialDataRemoteDataSourceImpl(
        gh<_i831.BaseRemoteDataSource>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i569.LoginRemoteDataSource>(
      () => _i569.LoginRemoteDataSourceImpl(
        baseDataSource: gh<_i831.BaseRemoteDataSource>(),
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
        client: gh<_i454.SupabaseClient>(),
        networkInfo: gh<_i405.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i974.CheckUserTokenBaseRepository>(
      () => _i670.CheckUserTokenRepository(
        remoteDataSource: gh<_i29.CheckUserTokenBaseRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i648.GetSocialDataBaseRepository>(
      () => _i253.GetSocialDataRepositoryImpl(
        getSocialDataBaseRemoteDataSource:
            gh<_i530.GetSocialDataBaseRemoteDataSource>(),
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
        networkInfo: gh<_i405.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i567.TermsAndConditionsBaseRepository>(
      () => _i567.TermsAndConditionsRepository(
        localDataSource: gh<_i567.GetTermsAndConditionsLocalDataSource>(),
        remoteDataSource: gh<_i567.TermsAndConditionsRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i390.CheckUserTokenUseCase>(
      () => _i390.CheckUserTokenUseCase(
        repository: gh<_i974.CheckUserTokenBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i733.ForgetPasswordRemoteDataSource>(
      () => _i733.ForgetPasswordRemoteDataSourceImpl(
        baseDataSource: gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1054.VerificationBaseRepository>(
      () => _i1054.VerificationRepository(
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
        remoteDataSource: gh<_i1054.VerificationRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i834.HomeLayoutRemoteDataSource>(
      () => _i834.HomeLayoutRemoteDataSourceImpl(
        gh<_i831.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i80.HomeLayoutRepository>(
      () => _i34.HomeLayoutRepositoryImpl(
        baseRepository: gh<_i407.BaseRepository>(),
        homeLayoutRemoteDataSource: gh<_i834.HomeLayoutRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i879.UnLinkRepository>(
      () => _i879.UnLinkRepositoryImpl(
        remoteDataSource: gh<_i879.UnLinkRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i537.SimulatedBaseRepository>(
      () => _i537.SimulatedRepository(
        baseRepository: gh<_i407.BaseRepository>(),
        remoteDataSource: gh<_i537.SimulatedRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i893.ChangePasswordUseCase>(
      () => _i893.ChangePasswordUseCase(
        repository: gh<_i893.EditProfileBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i893.EditProfileUseCase>(
      () => _i893.EditProfileUseCase(
        repository: gh<_i893.EditProfileBaseRepository>(),
      ),
    );
    gh.factory<_i893.EditProfileBloc>(
      () => _i893.EditProfileBloc(
        gh<_i893.EditProfileUseCase>(),
        gh<_i893.ChangePasswordUseCase>(),
      ),
    );
    gh.factory<_i380.ContactUsBloc>(
      () => _i380.ContactUsBloc(gh<_i109.GetContactUsUseCase>()),
    );
    gh.lazySingleton<_i377.GetAppleDataUseCase>(
      () => _i377.GetAppleDataUseCase(
        getSocialDataBaseRepository: gh<_i648.GetSocialDataBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i802.GetGoogleDataUseCase>(
      () => _i802.GetGoogleDataUseCase(
        getSocialDataBaseRepository: gh<_i648.GetSocialDataBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i764.GlobalBaseRepository>(
      () => _i432.GlobalRepository(
        remoteDataSource: gh<_i1042.GlobalBaseRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i613.SendVerificationCodeUseCase>(
      () => _i613.SendVerificationCodeUseCase(
        repository: gh<_i613.SignUpBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i569.LoginBaseRepository>(
      () => _i569.LoginRepository(
        remoteDataSource: gh<_i569.LoginRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
      ),
    );
    gh.factory<_i409.SplashBloc>(
      () => _i409.SplashBloc(gh<_i390.CheckUserTokenUseCase>()),
    );
    gh.lazySingleton<_i167.NotificationUseCase>(
      () => _i167.NotificationUseCase(
        repository: gh<_i799.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i167.ReadAllNotificationUseCase>(
      () => _i167.ReadAllNotificationUseCase(
        repository: gh<_i799.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i167.UpdateNotificationUseCase>(
      () => _i167.UpdateNotificationUseCase(
        repository: gh<_i799.NotificationRepository>(),
      ),
    );
    gh.lazySingleton<_i49.SocialLoginUseCase>(
      () =>
          _i49.SocialLoginUseCase(repository: gh<_i569.LoginBaseRepository>()),
    );
    gh.lazySingleton<_i569.LoginUseCase>(
      () => _i569.LoginUseCase(repository: gh<_i569.LoginBaseRepository>()),
    );
    gh.lazySingleton<_i395.SocialRegisterBaseRepository>(
      () => _i984.SocialRegisterRepository(
        remoteDataSource: gh<_i55.SocialRegisterBaseRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
        userLocalDataSource: gh<_i183.UserLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i733.ForgetPasswordBaseRepository>(
      () => _i733.ForgetPasswordRepository(
        remoteDataSource: gh<_i733.ForgetPasswordRemoteDataSource>(),
        baseRepository: gh<_i407.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i879.ChildAddExistParentScreenUseCase>(
      () => _i879.ChildAddExistParentScreenUseCase(
        repository: gh<_i879.UnLinkRepository>(),
      ),
    );
    gh.lazySingleton<_i879.ChildAddNewParentUseCase>(
      () => _i879.ChildAddNewParentUseCase(
        repository: gh<_i879.UnLinkRepository>(),
      ),
    );
    gh.lazySingleton<_i879.ParentAddExistChildUseCase>(
      () => _i879.ParentAddExistChildUseCase(
        repository: gh<_i879.UnLinkRepository>(),
      ),
    );
    gh.lazySingleton<_i879.ParentAddNewChildUseCase>(
      () => _i879.ParentAddNewChildUseCase(
        repository: gh<_i879.UnLinkRepository>(),
      ),
    );
    gh.lazySingleton<_i879.UnLinkUseCase>(
      () => _i879.UnLinkUseCase(repository: gh<_i879.UnLinkRepository>()),
    );
    gh.lazySingleton<_i537.GetSimulatedPlansUseCase>(
      () => _i537.GetSimulatedPlansUseCase(
        repository: gh<_i537.SimulatedBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i537.GetSimulatedExamsUseCase>(
      () => _i537.GetSimulatedExamsUseCase(
        repository: gh<_i537.SimulatedBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i537.GetSimulatedModelAnswersUseCase>(
      () => _i537.GetSimulatedModelAnswersUseCase(
        repository: gh<_i537.SimulatedBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i537.SubmitExamAnswerUseCase>(
      () => _i537.SubmitExamAnswerUseCase(
        repository: gh<_i537.SimulatedBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i567.GetTermsAndConditionsUseCase>(
      () => _i567.GetTermsAndConditionsUseCase(
        repository: gh<_i567.TermsAndConditionsBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i1065.GetGuestDataUseCase>(
      () => _i1065.GetGuestDataUseCase(gh<_i764.GlobalBaseRepository>()),
    );
    gh.lazySingleton<_i1054.CheckVerificationCodeUseCase>(
      () => _i1054.CheckVerificationCodeUseCase(
        repository: gh<_i1054.VerificationBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i1054.ResendVerificationCodeUseCase>(
      () => _i1054.ResendVerificationCodeUseCase(
        repository: gh<_i1054.VerificationBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i1054.SignUpUseCase>(
      () => _i1054.SignUpUseCase(
        repository: gh<_i1054.VerificationBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i1065.CheckAppVersionUseCase>(
      () => _i1065.CheckAppVersionUseCase(
        repository: gh<_i764.GlobalBaseRepository>(),
      ),
    );
    gh.lazySingleton<_i1065.GetInfoUseCase>(
      () => _i1065.GetInfoUseCase(repository: gh<_i764.GlobalBaseRepository>()),
    );
    gh.lazySingleton<_i1065.EditUserDataUseCase>(
      () => _i1065.EditUserDataUseCase(
        repository: gh<_i764.GlobalBaseRepository>(),
      ),
    );
    gh.factory<_i641.GetSocialDataBloc>(
      () => _i641.GetSocialDataBloc(
        getGoogleDataUseCase: gh<_i802.GetGoogleDataUseCase>(),
        getAppleDataUseCase: gh<_i377.GetAppleDataUseCase>(),
      ),
    );
    gh.lazySingleton<_i778.CheckChildIsSubscribeUseCase>(
      () => _i778.CheckChildIsSubscribeUseCase(
        homeLayoutRepository: gh<_i80.HomeLayoutRepository>(),
      ),
    );

    gh.lazySingleton<_i1023.SocialRegisterCodeUseCase>(
      () => _i1023.SocialRegisterCodeUseCase(
        repository: gh<_i395.SocialRegisterBaseRepository>(),
      ),
    );
    gh.factory<_i867.SocialRegisterBloc>(
      () => _i867.SocialRegisterBloc(gh<_i1023.SocialRegisterCodeUseCase>()),
    );
    gh.factory<_i879.UnLinkBloc>(
      () => _i879.UnLinkBloc(
        gh<_i879.UnLinkUseCase>(),
        gh<_i879.ChildAddExistParentScreenUseCase>(),
        gh<_i879.ChildAddNewParentUseCase>(),
        gh<_i879.ParentAddNewChildUseCase>(),
        gh<_i879.ParentAddExistChildUseCase>(),
      ),
    );
    gh.factory<_i532.NotificationBloc>(
      () => _i532.NotificationBloc(
        gh<_i167.NotificationUseCase>(),
        gh<_i167.ReadAllNotificationUseCase>(),
        gh<_i167.UpdateNotificationUseCase>(),
      ),
    );
    gh.factory<_i708.HomeLayoutBloc>(
      () => _i708.HomeLayoutBloc(gh<_i778.CheckChildIsSubscribeUseCase>()),
    );
    gh.factory<_i569.LoginBloc>(
      () => _i569.LoginBloc(
        loginUseCase: gh<_i569.LoginUseCase>(),
        socialLoginUseCase: gh<_i49.SocialLoginUseCase>(),
      ),
    );
    gh.factory<_i613.SignUpBloc>(
      () => _i613.SignUpBloc(gh<_i613.SendVerificationCodeUseCase>()),
    );
    gh.factory<_i866.GlobalBloc>(
      () => _i866.GlobalBloc(
        gh<_i1065.GetGuestDataUseCase>(),
        gh<_i1065.CheckAppVersionUseCase>(),
        gh<_i1065.GetInfoUseCase>(),
        gh<_i1065.EditUserDataUseCase>(),
      ),
    );
    gh.lazySingleton<_i733.ForgetPasswordUseCase>(
      () => _i733.ForgetPasswordUseCase(
        repository: gh<_i733.ForgetPasswordBaseRepository>(),
      ),
    );
    gh.factory<_i567.TermsAndConditionsBloc>(
      () => _i567.TermsAndConditionsBloc(
        gh<_i567.GetTermsAndConditionsUseCase>(),
      ),
    );
    gh.factory<_i537.SimulatedBloc>(
      () => _i537.SimulatedBloc(
        gh<_i537.GetSimulatedPlansUseCase>(),
        gh<_i537.GetSimulatedExamsUseCase>(),
        gh<_i537.GetSimulatedModelAnswersUseCase>(),
        gh<_i537.SubmitExamAnswerUseCase>(),
      ),
    );
    gh.factory<_i1054.VerificationBloc>(
      () => _i1054.VerificationBloc(
        gh<_i1054.CheckVerificationCodeUseCase>(),
        gh<_i1054.ResendVerificationCodeUseCase>(),
        gh<_i1054.SignUpUseCase>(),
      ),
    );
    gh.factory<_i733.ForgetPasswordBloc>(
      () => _i733.ForgetPasswordBloc(gh<_i733.ForgetPasswordUseCase>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i481.InjectableModule {}

class _$ThemeInjectionModule extends _i399.ThemeInjectionModule {}

class _$NotificationInjectableModule
    extends _i843.NotificationInjectableModule {}
