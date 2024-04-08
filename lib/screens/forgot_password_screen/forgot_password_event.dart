<<<<<<< HEAD
import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ForgotPasswordEvent {}

class ForgetInitialEvent extends ForgotPasswordEvent {
  BuildContext? context;
  dynamic arguments;

  ForgetInitialEvent({this.context});
}
=======
part of 'forgot_password_bloc.dart';

@immutable
abstract class ForgotPasswordEvent {}
>>>>>>> origin/main
