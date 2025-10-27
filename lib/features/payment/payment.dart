import 'dart:convert';

import 'package:dartz/dartz.dart' hide State;
import 'package:dio/dio.dart';
import 'package:ecommerce_app/config/extensions/log_extension.dart';
import 'package:ecommerce_app/config/resources/app_strings.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/api/network_info.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/exceptions/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/usecase/base_usecase.dart';
import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/base_repository/base_repository.dart';
import '../../../../core/failure/failure.dart';
import '../../config/storages/secure_storage.dart';
import '../../core/services/services_locator.dart';

part 'data/payment_data_source/payment_remote_data_source.dart';
part 'data/payment_models/create_order_entity.dart';
part 'data/payment_models/get_user_orders_models.dart';
part 'data/payment_models/initiate_payment_entity.dart';
part 'data/payment_models/order_entity.dart';
part 'data/payment_models/order_models.dart';
part 'data/payment_models/payment_entity.dart';
part 'data/payment_models/payment_models.dart';
part 'data/payment_repository/payment_repository.dart';
part 'logic/payment_bloc/payment_bloc.dart';
part 'logic/payment_bloc/payment_event.dart';
part 'logic/payment_bloc/payment_state.dart';
part 'logic/usecase/payment_usecase.dart';
part 'ui/payment_widgets/payment_widgets.dart';
