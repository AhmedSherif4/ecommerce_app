import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/config/resources/app_animations.dart';
import 'package:ecommerce_app/config/resources/app_shadow.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/shared_widget/buttons/button_widget.dart';
import 'package:ecommerce_app/core/shared_widget/nullable_network_image.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/shared_features/header_for_more.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';
import '../../app_assets/app_assets.dart';
import '../../core/responsive_manager/spacing_facade.dart';
import '../../core/shared_models/product/product_model.dart';
import '../../core/shared_widget/custom_inkwell.dart';
import '../../core/shared_widget/responsive_widget.dart';
import '../saved/saved.dart';

part 'data/details_product_data_source/details_product_local_data_source.dart';
part 'data/details_product_data_source/details_product_remote_data_source.dart';
part 'data/details_product_models/details_product_entity.dart';
part 'data/details_product_models/details_product_model.dart';
part 'data/details_product_repository/details_product_repository.dart';
part 'logic/details_product_cubit/details_product_cubit.dart';
part 'logic/details_product_cubit/details_product_state.dart';
part 'ui/details_product_screen/details_product_screen.dart';
part 'ui/details_product_widgets/details_product_widgets.dart';
