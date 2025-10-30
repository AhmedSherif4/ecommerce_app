import 'package:ecommerce_app/app_assets/app_assets.dart';
import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/shared_features/notification/data/model/notification_model.dart';
import 'package:ecommerce_app/features/shared_features/notification/domain/entity/notification_entity.dart';
import 'package:ecommerce_app/features/shared_features/notification/presentation/view_model/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/resources/app_constants.dart';
import '../../../../../config/resources/app_strings.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/shared_widget/header_for_more.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationItemEntity(
        title: "30% Special Discount!",
        body: "Special promotion only valid today.",
        imgPath: '',
        createdAt: DateTime.now(),
        id: 0,
        isRead: 0,
      ),
      NotificationItemEntity(
        title: "30% Special Discount!",
        body: "Special promotion only valid today.",
        imgPath: '',
        createdAt: DateTime.now(),
        id: 0,
        isRead: 0,
      ),
      NotificationItemEntity(
        title: "30% Special Discount!",
        body: "Special promotion only valid today.",
        imgPath: '',
        createdAt: DateTime.now(),
        id: 0,
        isRead: 0,
      ),
      NotificationItemEntity(
        title: "Top Up E-wallet Successfully!",
        body: "You have top up your e-wallet.",
        imgPath: '',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        id: 0,
        isRead: 0,
      ),
      NotificationItemModel(
        title: "Top Up E-wallet Successfully!",
        body: "You have top up your e-wallet.",
        imgPath: '',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        id: 0,
        isRead: 0,
      ),
      NotificationItemModel(
        title: "Top Up E-wallet Successfully!",
        body: "You have top up your e-wallet.",
        imgPath: '',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        id: 0,
        isRead: 0,
      ),
      NotificationItemModel(
        title: "Top Up E-wallet Successfully!",
        body: "You have top up your e-wallet.",
        imgPath: '',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        id: 0,
        isRead: 0,
      ),
      NotificationItemModel(
        title: "Credit Card Connected!",
        body: "Credit card has been linked.",
        imgPath: '',
        createdAt: DateTime(2023, 6, 7),
        id: 0,
        isRead: 0,
      ),
      NotificationItemModel(
        title: "Credit Card Connected!",
        body: "Credit card has been linked.",
        imgPath: '',
        createdAt: DateTime(2023, 6, 7),
        id: 0,
        isRead: 0,
      ),
    ];

    final grouped = getIt<NotificationBloc>().groupNotificationsByDate(
      notifications,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderForMore(
              title: AppStrings.notifications,
              hasLogo: true,
              logoSvg: Assets.projectIconBell,
              onBack: () {
                // it makes all notifications are read
                /*                context.read<NotificationBloc>()
                  ..add(ReadAllNotificationEvent());*/
              },
              logoOnPress: () {
                RouteManager.rPushNamed(
                  context: context,
                  rName: AppRoutesNames.rNotificationManagerScreen,
                );
              },
            ),

            Spacing.spaceHS10,
            Expanded(
              child: /*BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state.allNotifications.isEmpty) {
                    if (state.notificationStates == RequestStates.loaded) {
                      return const EmptyListWidgets(
                        message: AppStrings.noNotificationsNow,
                      );
                    }
                    if (state.notificationStates == RequestStates.error) {
                      return ErrorWidget(state.notificationMessage);
                    } else {
                      return const LoadingShimmerList();
                    }
                  } else {
                    return*/ NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  /*if (notification.metrics.pixels ==
                                notification.metrics.maxScrollExtent &&
                            notification is ScrollUpdateNotification &&
                            !state.isLastPage) {
                          BlocProvider.of<NotificationBloc>(context).add(
                            GetAllNotificationEvent(
                              pageNumber: BlocProvider.of<NotificationBloc>(
                                context,
                              ).nextPage,
                            ),
                          );
                        } */
                  return true;
                },
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      NotificationList(groupedNotifications: grouped),
                      Spacing.spaceHS24,
                      /*if (state.notificationStates ==
                                RequestStates.loading)
                      ...[
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 3),
                            color: context.colors.primary0,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: context.colors.primary3,
                              ),
                            ),
                          ),
                        ),
                      ], */
                    ],
                  ),
                ),
              ) /*;
                  }
                },
              ),*/,
            ),
          ],
        ),
      ).paddingBody(),
    );
  }
}

class NotificationList extends StatelessWidget {
  final Map<String, List<NotificationItemEntity>> groupedNotifications;

  const NotificationList({super.key, required this.groupedNotifications});

  @override
  Widget build(BuildContext context) {
    final items = groupedNotifications.entries.toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(AppConstants.appPaddingR20),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final sectionTitle = items[index].key;
        final sectionItems = items[index].value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sectionTitle, style: context.typography.titleLarge),
            Spacing.spaceHS10,
            ...sectionItems.map((n) => _NotificationItem(model: n)),
            Spacing.spaceHS16,
          ],
        );
      },
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final NotificationItemEntity model;

  const _NotificationItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.appPaddingR10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.projectIconBellDuotone,
            height: Spacing.iconSizeS20,
            width: Spacing.iconSizeS20,
          ),
          Spacing.spaceSW10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: context.typography.bodyLarge),
                Spacing.spaceHS5,
                Text(
                  model.body,
                  style: context.typography.caption.copyWith(
                    color: context.colors.primary5,
                  ),
                ),
                Spacing.spaceHS10,
                Divider(color: context.colors.primary1, height: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
