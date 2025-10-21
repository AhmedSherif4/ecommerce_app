library login;

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/config/base_remote_data_source/base_remote_data_source.dart';
import 'package:ecommerce_app/config/base_repository/base_repository.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/config/storages/secure_storage.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/features/shared_features/get_social_data/domain/entity/social_login_data_entity.dart';
import 'package:ecommerce_app/my_app/notification/i_notification_service.dart';
// import 'package:dartz/flutter pub add dartz.dart' hide State;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/shared_models/user/data/user_local_data_source/user_local_data_source.dart';
import '../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../../../core/api/network_info.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/shared_models/user/user_model/user_model.dart';
import '../../../core/usecase/base_usecase.dart';
import 'domain/login_usecases/social_login_use_case.dart';

part 'data/login_data_source/login_remote_data_source.dart';
part 'data/login_repository/login_repository.dart';
part 'domain/login_base_repository/login_base_repository.dart';
part 'domain/login_usecases/login_usecase.dart';
// part 'presentation/login_screen/login_screen.dart';

part 'presentation/login_view_model/login_bloc.dart';
part 'presentation/login_view_model/login_event.dart';
part 'presentation/login_view_model/login_state.dart';

// part 'presentation/widgets/widgets.dart';
