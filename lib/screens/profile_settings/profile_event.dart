import 'package:flutter/cupertino.dart';
import '../../utils/base_equatable.dart';

abstract class ProfileEvent extends BaseEquatable {}

class ProfileInitialEvent extends ProfileEvent {
  BuildContext? context;
  dynamic arguments;

  ProfileInitialEvent({this.context});
}

class GetProfileEvent extends ProfileEvent {
  BuildContext? context;
  dynamic arguments;

  GetProfileEvent({this.context, this.arguments});
}
