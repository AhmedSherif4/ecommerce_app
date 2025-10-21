import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:equatable/equatable.dart';

import '../data/model/app_version_model.dart';

class GlobalState extends Equatable {
  final RequestStates getGuestDataState;
  final UserEntity? guestData;
  final RequestStates checkAppVersionState;
  final AppVersionModel appVersionModel;
  final InfoModel infoModel;
  final RequestStates infoState;
  final RequestStates checkMobileIdState;
  final bool mobileIdIsExit;
  final RequestStates editUseDataEventIsFinish;
  final String editUseDataErrorMessage;

  const GlobalState({
    this.getGuestDataState = RequestStates.initial,
    this.guestData,
    this.checkAppVersionState = RequestStates.initial,
    this.checkMobileIdState = RequestStates.initial,
    this.mobileIdIsExit = false,
    this.editUseDataEventIsFinish = RequestStates.initial,
    this.editUseDataErrorMessage = '',
    this.appVersionModel = const AppVersionModel(
      appVersion: 0,
      androidLink: '',
      iosLink: '',
      isReview: false,
      inReview2: false,
      appRepairing: false,
      appRequiredUpdate: false,
      appHaveUpdate: false,
      enablePurchase: false,
      enableNafees: false,
      invitationStatus: false,
    ),
    this.infoState = RequestStates.initial,
    this.infoModel = const InfoModel(
      androidLink: '',
      iosLink: '',
      apkVersion: "",
      iosVersion: "",
      splashView: false,
    ),
  });

  GlobalState copyWith({
    RequestStates? getGuestDataState,
    UserEntity? guestData,
    RequestStates? checkAppVersionState,
    AppVersionModel? appVersionModel,
    RequestStates? checkMobileIdState,
    InfoModel? infoModel,
    RequestStates? infoState,
    bool? mobileIdIsExit,
    RequestStates? editUseDataEventIsFinish,
    String? editUseDataErrorMessage,
  }) {
    return GlobalState(
      getGuestDataState: getGuestDataState ?? this.getGuestDataState,
      guestData: guestData ?? this.guestData,
      checkAppVersionState: checkAppVersionState ?? this.checkAppVersionState,
      appVersionModel: appVersionModel ?? this.appVersionModel,
      infoModel: infoModel ?? this.infoModel,
      infoState: infoState ?? this.infoState,
      mobileIdIsExit: mobileIdIsExit ?? this.mobileIdIsExit,
      checkMobileIdState: checkMobileIdState ?? this.checkMobileIdState,
      editUseDataErrorMessage:
          editUseDataErrorMessage ?? this.editUseDataErrorMessage,
      editUseDataEventIsFinish:
          editUseDataEventIsFinish ?? this.editUseDataEventIsFinish,
    );
  }

  @override
  List<Object?> get props => [
    getGuestDataState,
    guestData,
    checkAppVersionState,
    appVersionModel,
    infoModel,
    infoState,
    mobileIdIsExit,
    checkMobileIdState,
    editUseDataEventIsFinish,
    editUseDataErrorMessage,
  ];
}
