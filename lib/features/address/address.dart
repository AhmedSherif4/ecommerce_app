import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
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
import '../../core/shared_widget/buttons/button_widget.dart';
import '../shared_features/header_for_more.dart';

part 'data/address_data_source/address_local_data_source.dart';
part 'data/address_data_source/address_remote_data_source.dart';
part 'data/address_models/address_entity.dart';
part 'data/address_models/address_model.dart';
part 'data/address_repository/address_repository.dart';
part 'logic/address_cubit/address_cubit.dart';
part 'logic/address_cubit/address_state.dart';
part 'ui/address_screen/address_screen.dart';
part 'ui/address_screen/new_address_screen.dart';
part 'ui/address_widgets/address_widgets.dart';
