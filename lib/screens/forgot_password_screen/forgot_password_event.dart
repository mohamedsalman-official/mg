import 'package:flutter/material.dart';
import 'package:mg/utils/base_equatable.dart';

abstract class ForgotPasswordEvent extends BaseEquatable {}

class ForgetInitialEvent extends ForgotPasswordEvent {
  BuildContext? context;
  dynamic arguments;

  ForgetInitialEvent({this.context});
}

class ForgotPasswordAPIEvent extends ForgotPasswordEvent {
  ForgotPasswordAPIEvent({this.context, this.arguments});
  BuildContext? context;
  dynamic arguments;
}
