import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/enum/enum_generation.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../config/base_repository/base_repository.dart';
import '../../../config/resources/app_constants.dart';

import '../../../config/storages/keys.dart';
import '../../../core/api/end_points.dart';
import '../../../core/failure/failure.dart';
import 'domain/entity/terms_and_conditions_entity.dart';


part 'presentation/view_model/terms_and_conditions_bloc.dart';
part 'presentation/view_model/terms_and_conditions_event.dart';
part 'presentation/view_model/terms_and_conditions_state.dart';
part 'presentation/view/terms_and_conditions_screen.dart';
part 'domain/terms_and_conditions_usecases/terms_and_conditinos_usecase.dart';
part 'domain/terms_and_conditions_base_repository/terms_and_conditions_base_repository.dart';
part 'data/terms_and_conditions_data_source/terms_and_conditions_remote_data_source.dart';
part 'data/terms_and_conditions_data_source/get_terms_and_conditions_local_data_sourcec.dart';
part 'data/terms_and_conditions_repository/terms_and_conditinos_repository.dart';
part 'data/model/terms_and_contitions_model.dart';