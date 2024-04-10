import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/dashboard/dashboard_event.dart';
import 'package:mg/screens/dashboard/dashboard_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, BaseState> {
  DashboardBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is IntroDashboardEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
