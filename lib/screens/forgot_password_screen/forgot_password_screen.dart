import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/forgot_password_screen/forgot_password_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ForgotPasswordBloc bloc;

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ForgotPasswordBloc>(context);
  }

  loginUser(ForgotPasswordBloc bloc) async {
    final Map<String, dynamic> data = {
      "email": emailController.text.trim().toString(),
    };
    // bloc.add(SignUpUserEvent(context: context, arguments: data));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
