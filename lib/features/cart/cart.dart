import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';

part 'data/cart_data_source/cart_local_data_source.dart';
part 'data/cart_data_source/cart_remote_data_source.dart';
part 'data/cart_models/cart_entity.dart';
part 'data/cart_models/cart_model.dart';
part 'data/cart_repository/cart_repository.dart';
part 'logic/cart_cubit.dart';
part 'logic/cart_state.dart';
part 'ui/cart_screen/cart_screen.dart';
part 'ui/cart_widgets/cart_widgets.dart';
