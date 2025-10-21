import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';

part 'data/saved_data_source/saved_local_data_source.dart';
part 'data/saved_data_source/saved_remote_data_source.dart';
part 'data/saved_models/saved_entity.dart';
part 'data/saved_models/saved_model.dart';
part 'data/saved_repository/saved_repository.dart';
part 'logic/saved_cubit.dart';
part 'logic/saved_state.dart';
part 'ui/saved_screen/saved_screen.dart';
part 'ui/saved_widgets/saved_widgets.dart';
