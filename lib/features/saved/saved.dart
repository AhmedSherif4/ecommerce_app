import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/responsive_manager/responsive_extensions.dart';
import 'package:ecommerce_app/core/shared_widget/empty_list_widget.dart';
import 'package:ecommerce_app/core/shared_widget/loading_shimmer_list.dart';
import 'package:ecommerce_app/features/shared_features/header_for_more.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';
import '../../dummy_data.dart';
import '../home/home.dart';

part 'data/saved_data_source/saved_local_data_source.dart';
part 'data/saved_data_source/saved_remote_data_source.dart';
part 'data/saved_models/saved_entity.dart';
part 'data/saved_models/saved_model.dart';
part 'data/saved_repository/saved_repository.dart';
part 'logic/saved_cubit.dart';
part 'logic/saved_state.dart';
part 'ui/saved_screen/saved_screen.dart';
part 'ui/saved_widgets/saved_widgets.dart';
