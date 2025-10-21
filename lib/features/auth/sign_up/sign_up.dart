library sign_up;

import 'package:dartz/dartz.dart' hide State;
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/features/shared_features/get_social_data/domain/entity/social_login_data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/base_repository/base_repository.dart';
import '../../../../../../core/failure/failure.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../core/shared_models/user/user_entity/user_entity.dart';
import '../login/domain/login_usecases/social_login_use_case.dart';

part 'data/sign_up_data_source/sign_up_remote_data_source.dart';
part 'data/sign_up_repository/sign_up_repository.dart';
part 'domain/sign_up_base_repository/sign_up_base_repository.dart';
part 'domain/sign_up_usecases/sign_up_usecase.dart';
part 'presentation/sign_up_view_model/sign_up_bloc.dart';
part 'presentation/sign_up_view_model/sign_up_event.dart';
part 'presentation/sign_up_view_model/sign_up_state.dart';
