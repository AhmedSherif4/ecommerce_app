import 'package:ecommerce_app/app_assets/app_assets.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/home/home.dart';
import 'package:ecommerce_app/features/shared_features/header_for_more.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';

part 'data/faqs_data_source/faqs_local_data_source.dart';
part 'data/faqs_data_source/faqs_remote_data_source.dart';
part 'data/faqs_models/faqs_entity.dart';
part 'data/faqs_models/faqs_model.dart';
part 'data/faqs_repository/faqs_repository.dart';
part 'logic/faqs_cubit/faqs_cubit.dart';
part 'logic/faqs_cubit/faqs_state.dart';
part 'ui/faqs_screen/faqs_screen.dart';
part 'ui/faqs_widgets/faqs_widgets.dart';
