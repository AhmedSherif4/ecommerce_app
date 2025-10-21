import 'package:ecommerce_app/features/shared_features/notification/domain/entity/notification_entity.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context)
  // {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           const HeaderForMore(title: AppStrings.notificationsTitle),
  //           //AppSize.s20.sizedBoxHeight,
  //
  //           Expanded(
  //             child: BlocBuilder<NotificationBloc, NotificationState>(
  //               builder: (context, state) {
  //                 if (state.allNotifications.isEmpty) {
  //                   if (state.notificationStates == RequestStates.loaded) {
  //                     return const EmptyListWidgets(message: 'لا يوجد إشعارات الآن');
  //                   }
  //                   if (state.notificationStates == RequestStates.error) {
  //                     return ErrorWidget(state.notificationMessage);
  //                   } else {
  //                     return const LoadingShimmerList();
  //                   }
  //                 } else {
  //                   return NotificationListener<ScrollNotification>(
  //                     onNotification: (notification) {
  //                       if (notification.metrics.pixels ==
  //                           notification.metrics.maxScrollExtent &&
  //                           notification is ScrollUpdateNotification &&
  //                           !state.isLastPage) {
  //                         BlocProvider.of<NotificationBloc>(context).add(
  //                           GetAllNotificationEvent(
  //                               pageNumber:
  //                               BlocProvider.of<NotificationBloc>(context)
  //                                   .nextPage),
  //                         );
  //                       }
  //                       return true;
  //                     },
  //                     child: SingleChildScrollView(
  //                       child: Stack(
  //                         children: [
  //                           OrientationItem(
  //                             portraitWidget: ListView.separated(
  //                               shrinkWrap: true,
  //                               physics: const NeverScrollableScrollPhysics(),
  //                               itemCount: state.allNotifications.length,
  //                               separatorBuilder: (context, index) =>
  //                               AppSize.s10.sizedBoxHeight,
  //                               itemBuilder: (context, index) {
  //                                 return CustomInkWell(
  //                                   onTap: () {
  //                                     showDialog(context: context, builder: (context) => AlertDialog(
  //                                       title: Text( state.allNotifications[index].title,style: AppTextStyle.titleMedium20,),
  //                                       content: Text( state.allNotifications[index].body,style: AppTextStyle.bodyMedium14,),
  //                                     ));
  //                                   },
  //                                   child: NotificationItem(
  //                                       notificationItemEntity:
  //                                       state.allNotifications[index]),
  //                                 );
  //                               },
  //                             ),
  //                             landscapeWidget: GridView.builder(
  //                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                                 crossAxisCount: 2,
  //                                 crossAxisSpacing: AppSize.s10.responsiveSize,
  //                                 mainAxisSpacing: AppSize.s10.responsiveSize,
  //                                 childAspectRatio: AppReference.deviceHeight(context)/AppReference.deviceWidth(context)*5,
  //                               ),
  //                               shrinkWrap: true,
  //                               physics: const NeverScrollableScrollPhysics(),
  //                               itemCount: state.allNotifications.length,
  //                               itemBuilder: (context, index) {
  //                                 return CustomInkWell(
  //                                   onTap:  () {
  //                                     showDialog(context: context, builder: (context) => AlertDialog(
  //                                       title: Text( state.allNotifications[index].title,style: AppTextStyle.titleMedium20,),
  //                                       content: Text( state.allNotifications[index].body,style: AppTextStyle.bodyMedium14,),
  //                                     ));
  //                                   },
  //                                   child: NotificationItem(
  //                                       notificationItemEntity:
  //                                       state.allNotifications[index]),
  //                                 );
  //                               },
  //                             ),
  //                           ),
  //                           AppSize.s20.sizedBoxHeight,
  //                           if (state.notificationStates ==
  //                               RequestStates.loading) ...[
  //                             Positioned(
  //                                 bottom: 0,
  //                                 left: 0,
  //                                 right: 0,
  //                                 child: Container(
  //                                     color: AppColors.white,
  //                                     child: const Center(
  //                                         child: CircularProgressIndicator(
  //                                           color: AppColors.primaryColorBlue,
  //                                         )))),
  //                             AppSize.s20.sizedBoxHeight,
  //                           ]
  //                         ],
  //                       ),
  //                     ),
  //                   );
  //                 }
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ).paddingBody(),
  //   );
  // }
  {
    return SizedBox();
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationItemEntity notificationItemEntity;

  const NotificationItem({super.key, required this.notificationItemEntity});

  @override
  Widget build(BuildContext context)
  // {
  //   return Stack(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.all(AppPadding.p10.responsiveSize),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(AppSize.s14),
  //           color: AppColors.textColor6,
  //         ),
  //         padding: EdgeInsets.all(AppPadding.p8.responsiveSize),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               flex: 2,
  //               child: ClipRRect(
  //                 borderRadius:
  //                 BorderRadius.circular(AppConstants.appBorderRadiusR15),
  //                 child: NullableNetworkImage(
  //                   imagePath: notificationItemEntity.imgPath,
  //                   notHaveImage: notificationItemEntity.imgPath.isEmpty,
  //                   height: AppReference.deviceHeight(context) * 0.12,
  //                   fit: BoxFit.contain,
  //                 ),
  //               ),
  //             ),
  //             AppSize.s14.sizedBoxWidth,
  //             Expanded(
  //               flex: 5,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     notificationItemEntity.title,
  //                     style: const AppTextStyle().s14.titleSmall18,
  //                     maxLines: 2,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                   AppSize.s10.sizedBoxWidth,
  //                   Text(
  //                     notificationItemEntity.body,
  //                     style: AppTextStyle.bodySmall12,
  //                     maxLines: 4,
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       if (notificationItemEntity.isRead == 0)
  //         PositionedDirectional(
  //           top: 0,
  //           end: 0,
  //           child: Icon(
  //             Icons.circle,
  //             size: ResponsiveManager.calculateSize(15, 15),
  //             color: AppColors.failColor,
  //           ),
  //         ),
  //     ],
  //   );
  // }
  {
    return SizedBox();
  }
}
