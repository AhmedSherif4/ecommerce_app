library home_layout;

import 'package:ecommerce_app/app_assets/app_assets.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/shared_widget/custom_inkwell.dart';
import 'package:ecommerce_app/core/shared_widget/dialogs/exit_dialog.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/account/account.dart';
import 'package:ecommerce_app/features/cart/cart.dart';
import 'package:ecommerce_app/features/home/home.dart';
import 'package:ecommerce_app/features/home_layout/domain/entity/subscribe_child_entity.dart';
import 'package:ecommerce_app/features/saved/saved.dart';
import 'package:ecommerce_app/features/search/search.dart';
import 'package:ecommerce_app/my_app/notification/i_notification_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';

import '../../core/enum/enum_generation.dart';
import '../../my_app/app_reference.dart';
import 'domain/usecase/check_chils_is_subscribe_use_usecase.dart';

part 'view/home_layout_view.dart';
part 'view_model/home_layout_bloc.dart';
part 'view_model/home_layout_event.dart';
part 'view_model/home_layout_state.dart';
part 'widgets/bottom_nav_bar_item.dart';
part 'widgets/custom_bottom_nav_bar.dart';
