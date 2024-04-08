import 'package:flutter/material.dart';
import 'package:mg/utils/base_equatable.dart';

abstract class LoginEvent extends BaseEquatable {}

class LoginInitialEvent extends LoginEvent {
  BuildContext? context;
  dynamic arguments;
  LoginInitialEvent({this.context});
}

class LoginUserEvent extends LoginEvent {
  LoginUserEvent({this.context, this.arguments});
  BuildContext? context;
  dynamic arguments;
}
