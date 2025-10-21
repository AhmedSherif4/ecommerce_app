import 'dart:async';

import 'package:dartz/dartz.dart' hide State;
import 'package:ecommerce_app/my_app/screen_protector_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../config/base_repository/base_repository.dart';
import '../../../core/api/end_points.dart';
import '../../../core/enum/enum_generation.dart';
import '../../../core/failure/failure.dart';
import '../../../core/usecase/base_usecase.dart';

part 'data/model/simulated_plans_model.dart';
part 'data/remote/simulated_plans_remote_data_source.dart';
part 'data/repository/simulated_plans_repository.dart';
part 'domain/entity/simulated_plans_entity.dart';
part 'domain/repository/repository.dart';
part 'domain/usecase/get_simulated_plans_usecase.dart';
part 'presentation/view/simulated_categories_screen.dart';
part 'presentation/view/simulated_plans_exams_question_screen.dart';
part 'presentation/view/simulated_plans_exams_screen.dart';
part 'presentation/view/simulated_plans_model_answer_screen.dart';
part 'presentation/view/simulated_plans_screen.dart';
part 'presentation/view/simulated_plans_subject_screen.dart';
part 'presentation/view_model/simulated_plans_bloc.dart';
part 'presentation/view_model/simulated_plans_event.dart';
part 'presentation/view_model/simulated_plans_state.dart';
