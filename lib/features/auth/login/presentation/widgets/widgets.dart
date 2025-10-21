import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/shared_widget/custom_inkwell.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/shared_features/contact_us/presentations/view_model/contact_us_bloc.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../app_assets/app_assets.dart';
import '../../../../../config/resources/app_strings.dart';
import '../../../../../core/base_widgets/loading_shimmer_widget.dart';
import '../../../../../core/enum/enum_generation.dart';

class ContactUsWidgetInLoginScreen extends StatelessWidget {
  const ContactUsWidgetInLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      builder: (context, state) {
        switch (state.getContactUsStates) {
          case RequestStates.loading:
            return LoadingShimmerStructure(
              width: double.infinity,
              height: Spacing.s32.h,
            );
          case RequestStates.loaded:
            List<Map<String, dynamic>> data = [
              {
                'type': 'Email',
                'typeUrl': state.getContactUsData!.email.isNotEmpty
                    ? state.getContactUsData!.email
                    : null,
                'iconUrl': Assets.iconsMailUs,
              },
              {
                'type': 'FaceBook',
                'typeUrl': state.getContactUsData!.facebook.isNotEmpty
                    ? state.getContactUsData!.facebook
                    : null,
                'iconUrl': Assets.iconsFacebook,
              },
              {
                'type': 'Whats App',
                'typeUrl': state.getContactUsData!.whatsapp.isNotEmpty
                    ? state.getContactUsData!.whatsapp
                    : null,
                'iconUrl': Assets.iconsWhatsapp,
              },
              {
                'type': 'Telegram',
                'typeUrl': state.getContactUsData!.telegram!.isNotEmpty
                    ? state.getContactUsData!.telegram
                    : null,
                'iconUrl': Assets.iconsTelegram,
              },
              {
                'type': 'Instagram',
                'typeUrl': state.getContactUsData!.instagram!.isNotEmpty
                    ? state.getContactUsData!.instagram
                    : null,
                'iconUrl': Assets.iconsInstagram,
              },
              {
                'type': 'LinkedIn',
                'typeUrl': state.getContactUsData!.linkedIn!.isNotEmpty
                    ? state.getContactUsData!.linkedIn
                    : null,
                'iconUrl': Assets.iconsLinkedin,
              },

              {
                'type': 'Youtube',
                'typeUrl': state.getContactUsData!.youtube!.isNotEmpty
                    ? state.getContactUsData!.youtube
                    : null,
                'iconUrl': Assets.iconsYoutube,
              },
            ];
            return CustomInkWell(
              onTap: () async {
                showModalBottomSheet(
                  backgroundColor: context.colors.primary1,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SizedBox(
                    height: AppReference.deviceHeight(context) / 2,
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.iconsMessages,
                                    height: 90.h,
                                    width: 90.w,
                                  ),
                                  Text(
                                    AppStrings.contactWithUs,
                                    style: context.typography.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 20.r),
                          sliver: SliverList.separated(
                            itemBuilder: (context, index) {
                              if (data[index]['typeUrl'] != null) {
                                return ContactUsLoginItem(
                                  type: data[index]['type'],
                                  url: data[index]['typeUrl'],
                                  svgImagePath: data[index]['iconUrl'],
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                            separatorBuilder: (context, index) {
                              if (data[index]['typeUrl'] != null) {
                                return Spacing.spaceHS32;
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                            itemCount: data.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text.rich(
                TextSpan(
                  text: AppStrings.ifHaveProblemContactWithOwner,
                  style: context.typography.bodyMedium,
                  children: [
                    TextSpan(
                      text: AppStrings.contactWithUs,
                      style: context.typography.bodyLarge.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            );
          case RequestStates.error:
            return Text(
              state.getContactUsMessage,
              style: context.typography.bodySmall.copyWith(
                color: context.colors.red,
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class ContactUsLoginItem extends StatelessWidget {
  final String type;
  final String url;
  final String svgImagePath;

  const ContactUsLoginItem({
    super.key,
    required this.type,
    required this.url,
    required this.svgImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppReference.deviceHeight(context) * 0.06,
      child: CustomInkWell(
        onTap: () {
          _launcherUrl(url: url, type: type);
        },
        child: Container(
          padding: EdgeInsets.all(10.r),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: 30.w, child: SvgPicture.asset(svgImagePath)),
              Spacing.spaceHS10,
              Expanded(
                child: Text(
                  type,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: context.typography.labelLarge,
                ),
              ),
              Spacing.spaceHS10,
              Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20.r),
              Spacing.spaceHS10,
            ],
          ),
        ),
      ),
    );
  }

  _launcherUrl({required url, String? type}) async {
    if (type == 'Email') {
      final Uri emailLaunchUri = Uri(scheme: 'mailto', path: url);
      await launchUrl(emailLaunchUri);
    } else {
      final lanUrl = Uri.parse(url);
      await launchUrl(lanUrl);
    }
  }
}
