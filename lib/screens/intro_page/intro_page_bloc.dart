import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/intro_page/intro_page_event.dart';
import 'package:mg/screens/intro_page/intro_page_bloc.dart';

class IntroPageBloc extends Bloc<IntroPageEvent, BaseState> {
  IntroPageBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    IntroPageEvent event,
  ) async* {
    if (event is IntroInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    }
  }
}
