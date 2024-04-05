import 'dart:async';
import 'dart:convert';

import 'package:dynamic_themes/dynamic_themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/authentication/bloc/authentication_bloc.dart';
import 'package:mg/bloc.dart';
import 'package:mg/router.dart';
import 'package:mg/screens/login_page/login_bloc.dart';
import 'package:mg/screens/login_page/login_screen.dart';
import 'package:mg/screens/splash_screen/splash_screen.dart';
import 'package:mg/screens/theme/theme_bloc.dart';
import 'package:mg/screens/theme/theme_state.dart';
import 'package:mg/utils/app_themes.dart';
import 'package:mg/utils/color_resources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = EchoBlocDelegate();
  runApp(
    //const MyApp()
      BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) {
          return AuthenticationBloc()..add(AppStarted(context: context));
        },
        child: const MyApp(),
      ),
      );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc? bloc;
  Timer? _timer;



  @override
  void initState() {
   bloc = BlocProvider.of<AuthenticationBloc>(context);

   super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorResource.colorE22C24,
    ));
    return DynamicTheme(
      themeCollection: AppThemes().getThemeCollections(),
      builder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'Inovate',
          theme: theme,
          onGenerateRoute: getRoute,
          debugShowCheckedModeBanner: false,
          home: addAuthBloc(
            context,
            const SplashScreen(),
          ),
        );
      },
    );
  }
}
