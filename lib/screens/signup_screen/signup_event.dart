import 'package:flutter/material.dart';
import 'package:mg/utils/base_equatable.dart';

@immutable
abstract class SignupEvent extends BaseEquatable {}

class SignUpInitialEvent extends SignupEvent {
  BuildContext? context;
  dynamic arguments;
  SignUpInitialEvent({this.context});
}

class SignUpUserEvent extends SignupEvent {
  SignUpUserEvent({this.context, this.arguments});
  BuildContext? context;
  dynamic arguments;
}
