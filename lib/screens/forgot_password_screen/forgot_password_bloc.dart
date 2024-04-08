import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
<<<<<<< HEAD
import 'package:mg/screens/forgot_password_screen/forgot_password_event.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/forgot_password_screen/forgot_password_bloc.dart';

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
=======

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
>>>>>>> origin/main
  }
}
