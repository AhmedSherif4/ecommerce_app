import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/config/routes/routes_names.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/shared_features/header_for_more.dart';
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

part 'data/account_data_source/account_local_data_source.dart';
part 'data/account_data_source/account_remote_data_source.dart';
part 'data/account_models/account_entity.dart';
part 'data/account_models/account_model.dart';
part 'data/account_repository/account_repository.dart';
part 'logic/account_cubit.dart';
part 'logic/account_state.dart';
part 'ui/account_screen/account_screen.dart';
part 'ui/account_widgets/account_widgets.dart';
