import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/forgot_password_screen/forgot_password_event.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, BaseState> {
  ForgotPasswordBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgetInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
