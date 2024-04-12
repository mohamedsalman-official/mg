import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/signup_screen/model/SignUpModel.dart';
import 'package:mg/screens/signup_screen/signup_event.dart';

import '../../http/api_repository.dart';
import '../../http/httpurls.dart';
import '../../utils/contants.dart';

class SignUpBloc extends Bloc<SignupEvent, BaseState> {
  SignUpBloc() : super(InitialState());

  @override
  Stream<BaseState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignUpInitialEvent) {
      yield LoadingState();
      yield SuccessState(successResponse: 'success');
    } else if (event is SignUpUserEvent) {
      dynamic response;
      yield LoadingState();

      print(event.arguments);
      final dynamic returnableValues = await APIRepository().dynamicRequest(
          HttpUrl.signup,
          userArguments: jsonEncode(event.arguments),
          method: ApiRequestMethod.post,
          isBearerTokenNeed: false,
          context: event.context);
      response = SignUpModel.fromJson(returnableValues);

      yield SuccessState(successResponse: response);
    }
  }
}
