import 'package:ecommerce_app/app_assets/app_assets.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';
import '../../core/shared_widget/header_for_more.dart';

part 'data/help_center_data_source/help_center_local_data_source.dart';
part 'data/help_center_data_source/help_center_remote_data_source.dart';
part 'data/help_center_models/help_center_entity.dart';
part 'data/help_center_models/help_center_model.dart';
part 'data/help_center_repository/help_center_repository.dart';
part 'logic/help_center_cubit/help_center_cubit.dart';
part 'logic/help_center_cubit/help_center_state.dart';
part 'ui/help_center_screen/help_center_screen.dart';
part 'ui/help_center_widgets/help_center_widgets.dart';
