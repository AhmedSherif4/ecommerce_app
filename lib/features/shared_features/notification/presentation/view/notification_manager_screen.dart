import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app_assets/app_assets.dart';
import '../../../../../config/resources/app_constants.dart';
import '../../../../../config/resources/app_strings.dart';
import '../../../../../core/base_widgets/loading_widget.dart';
import '../../../../../core/base_widgets/snackbar_widget.dart';
import '../../../../../core/enum/enum_generation.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../../core/shared_widget/header_for_more.dart';
import '../../../../../my_app/app_reference.dart';
import '../../domain/repository/notification_repository.dart';
import '../view_model/notification_bloc.dart';

class NotificationManagerScreen extends StatefulWidget {
  const NotificationManagerScreen({super.key});

  @override
  State<NotificationManagerScreen> createState() =>
      _NotificationManagerScreenState();
}

class _NotificationManagerScreenState extends State<NotificationManagerScreen> {
  late String notificationMarkExam;
  late String notificationReUploadExam;
  late String notificationLessonFinish;
  late String notificationLogin;
  late String notificationSessionTime;

  @override
  void initState() {
    super.initState();
    notificationMarkExam = '';
    notificationReUploadExam = '';
    notificationLessonFinish = '';
    notificationLogin = '';
    notificationSessionTime = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NotificationBloc, NotificationState>(
        listener: (context, state) {
          switch (state.updateNotificationState) {
            case RequestStates.loading:
              showLoadingDialog(context);
            case RequestStates.loaded:
              Navigator.pop(context);
              showSnackBar(
                description: state.updateNotificationMessage,
                state: ToastStates.congrats,
                context: context,
              );
              final user = getIt<UserLocalDataSource>().getUserData()!;
              final temp = user.copyWith(
                /*notificationMarkExam: notificationMarkExam,
                notificationReUploadExam: notificationReUploadExam,
                notificationLessonFinish: notificationLessonFinish,
                notificationLogin: notificationLogin,
                notificationSessionTime: notificationSessionTime,*/
              );

              getIt<UserLocalDataSource>().saveUserData(userModel: temp);

            case RequestStates.error:
              Navigator.pop(context);
              showSnackBar(
                description: state.updateNotificationMessage,
                state: ToastStates.error,
                context: context,
              );
            default:
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const HeaderForMore(title: AppStrings.notifications),
                Spacing.spaceHS16,
                SizedBox(
                  width:
                      (AppReference.deviceIsTablet &&
                          !AppReference.isPortrait(context))
                      ? AppReference.deviceWidth(context) * .6
                      : AppReference.deviceWidth(context),
                  child: Column(
                    children: [
                      NotificationManageItem(
                        title: 'AppStrings.whenExamCorrect',
                        value: (String value) {
                          notificationMarkExam = value;
                          context.read<NotificationBloc>().add(
                            UpdateNotificationEvent(
                              notificationManagerParameters:
                                  NotificationManagerParameters(
                                    markExam: notificationMarkExam,
                                    reUploadExam: notificationReUploadExam,
                                    lessonFinish: notificationLessonFinish,
                                    login: notificationLogin,
                                    sessionTime: notificationSessionTime,
                                  ),
                            ),
                          );
                        },
                        isOn: 'on' /*getIt<UserLocalDataSource>()
                            .getUserData()!
                            .notificationMarkExam!*/,
                      ),
                      Spacing.spaceHS16,
                      NotificationManageItem(
                        title: 'AppStrings.whenExamReUpload',
                        value: (String value) {
                          notificationReUploadExam = value;
                          context.read<NotificationBloc>().add(
                            UpdateNotificationEvent(
                              notificationManagerParameters:
                                  NotificationManagerParameters(
                                    markExam: notificationMarkExam,
                                    reUploadExam: notificationReUploadExam,
                                    lessonFinish: notificationLessonFinish,
                                    login: notificationLogin,
                                    sessionTime: notificationSessionTime,
                                  ),
                            ),
                          );
                        },
                        isOn: 'on' /*getIt<UserLocalDataSource>()
                            .getUserData()!
                            .notificationReUploadExam!*/,
                      ),
                      Spacing.spaceHS16,
                      NotificationManageItem(
                        title: 'AppStrings.whenFinishLesson',
                        value: (String value) {
                          notificationLessonFinish = value;
                          context.read<NotificationBloc>().add(
                            UpdateNotificationEvent(
                              notificationManagerParameters:
                                  NotificationManagerParameters(
                                    markExam: notificationMarkExam,
                                    reUploadExam: notificationReUploadExam,
                                    lessonFinish: notificationLessonFinish,
                                    login: notificationLogin,
                                    sessionTime: notificationSessionTime,
                                  ),
                            ),
                          );
                        },
                        isOn: 'on' /*getIt<UserLocalDataSource>()
                            .getUserData()!
                            .notificationLessonFinish!*/,
                      ),
                      Spacing.spaceHS16,
                      NotificationManageItem(
                        title: 'AppStrings.whenLogin',
                        value: (String value) {
                          notificationLogin = value;
                          context.read<NotificationBloc>().add(
                            UpdateNotificationEvent(
                              notificationManagerParameters:
                                  NotificationManagerParameters(
                                    markExam: notificationMarkExam,
                                    reUploadExam: notificationReUploadExam,
                                    lessonFinish: notificationLessonFinish,
                                    login: notificationLogin,
                                    sessionTime: notificationSessionTime,
                                  ),
                            ),
                          );
                        },
                        isOn: 'on' /*getIt<UserLocalDataSource>()
                            .getUserData()!
                            .notificationLogin!*/,
                      ),
                      Spacing.spaceHS16,
                      NotificationManageItem(
                        title: 'AppStrings.timeInAppNoti',
                        value: (String value) {
                          notificationSessionTime = value;
                          context.read<NotificationBloc>().add(
                            UpdateNotificationEvent(
                              notificationManagerParameters:
                                  NotificationManagerParameters(
                                    markExam: notificationMarkExam,
                                    reUploadExam: notificationReUploadExam,
                                    lessonFinish: notificationLessonFinish,
                                    login: notificationLogin,
                                    sessionTime: notificationSessionTime,
                                  ),
                            ),
                          );
                        },
                        isOn: 'on' /*getIt<UserLocalDataSource>()
                            .getUserData()!
                            .notificationSessionTime!*/,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ).paddingBody(),
      ),
    );
  }
}

class NotificationManageItem extends StatefulWidget {
  final String title;
  final Function(String value) value;
  final String isOn;

  const NotificationManageItem({
    super.key,
    required this.title,
    required this.value,
    required this.isOn,
  });

  @override
  State<NotificationManageItem> createState() => _NotificationManageItemState();
}

class _NotificationManageItemState extends State<NotificationManageItem> {
  late bool isOn;

  @override
  void initState() {
    super.initState();
    isOn = widget.isOn == 'on' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(Assets.projectIconBellDuotone),
      title: Text(widget.title, style: context.typography.bodyMedium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.appBorderRadiusR20.r),
      ),
      tileColor: context.colors.primary0,
      trailing: Switch(
        activeThumbColor: context.colors.primary0,
        inactiveThumbColor: context.colors.primary9,
        activeTrackColor: context.colors.primary3,
        inactiveTrackColor: context.colors.primary4,
        value: isOn,
        onChanged: (bool value) {
          setState(() {
            isOn = value;
            if (value) {
              widget.value('on');
            } else {
              widget.value('off');
            }
          });
        },
      ),
    );
  }
}
