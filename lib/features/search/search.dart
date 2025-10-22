import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/shared_widget/empty_list_widget.dart';
import 'package:ecommerce_app/core/shared_widget/nullable_network_image.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/features/shared_features/header_for_more.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';
import '../../config/resources/app_constants.dart';
import '../../config/resources/app_strings.dart';
import '../../core/responsive_manager/spacing_facade.dart';
import '../../my_app/app_reference.dart';
import '../home/home.dart';

part 'data/search_data_source/search_local_data_source.dart';
part 'data/search_data_source/search_remote_data_source.dart';
part 'data/search_models/search_entity.dart';
part 'data/search_models/search_model.dart';
part 'data/search_repository/search_repository.dart';
part 'logic/search_cubit.dart';
part 'logic/search_state.dart';
part 'ui/search_screen/search_screen.dart';
part 'ui/search_widgets/search_widgets.dart';
