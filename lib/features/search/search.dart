import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';

part 'data/search_data_source/search_local_data_source.dart';
part 'data/search_data_source/search_remote_data_source.dart';
part 'data/search_models/search_entity.dart';
part 'data/search_models/search_model.dart';
part 'data/search_repository/search_repository.dart';
part 'logic/search_cubit.dart';
part 'logic/search_state.dart';
part 'ui/search_screen/search_screen.dart';
part 'ui/search_widgets/search_widgets.dart';
