import 'package:mg/utils/base_equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DashboardEvent extends BaseEquatable {}

class IntroDashboardEvent extends DashboardEvent {
  BuildContext? context;
  dynamic arguments;

  IntroDashboardEvent({this.context});
}
