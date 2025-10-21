library forget_password;

import 'package:dartz/dartz.dart' hide State;
import 'package:ecommerce_app/config/base_repository/base_repository.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/base_widgets/loading_widget.dart';
import 'package:ecommerce_app/core/base_widgets/snackbar_widget.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/responsive_manager/app_padding.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/shared_widget/app_input_field/phone_filed.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../config/resources/app_strings.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../core/shared_widget/buttons/back_button_widget.dart';
import '../../../core/shared_widget/buttons/button_widget.dart';

part 'data/forget_password_data_source/forget_password_remote_data_source.dart';
part 'data/forget_password_repository/forget_password_repository.dart';
part 'domain/forget_password_base_repository/forget_password_base_repository.dart';
part 'domain/forget_password_usecases/forget_password_usecase.dart';
part 'presentation/forget_password_screen/forget_password_screen.dart';
part 'presentation/forget_password_view_model/forget_password_bloc.dart';
part 'presentation/forget_password_view_model/forget_password_event.dart';
part 'presentation/forget_password_view_model/forget_password_state.dart';
