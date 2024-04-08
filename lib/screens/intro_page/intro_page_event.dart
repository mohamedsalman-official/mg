import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class IntroPageEvent extends BaseEquatable {}

class IntroInitialEvent extends IntroPageEvent {
  BuildContext? context;
  dynamic arguments;

  IntroInitialEvent({this.context});
}
