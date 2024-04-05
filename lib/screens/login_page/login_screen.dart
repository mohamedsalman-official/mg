import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/login_page/model/LoginResponseModel.dart';
import 'package:mg/utils/singleton.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/login_page/login_bloc.dart';
import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc bloc;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoggedIn = false;

  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
  }

  loginUser(LoginBloc bloc) async {
    final Map<String, dynamic> data = {
      "email": emailController.text.trim().toString(),
      "password": passwordController.text.trim().toString(),
    };
    bloc.add(LoginUserEvent(context: context, arguments: data));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, BaseState state) async {},
      child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, BaseState state) {
            if (state is InitialState) {
              return const Center(
                child: Text('New DAT888888888888888888888A'),
              );
            } else if (state is SuccessState) {
              if (state.successResponse is LoginResponse) {
                final LoginResponse response = state.successResponse;
                if (response.status == Constants.success) {
                  PreferenceHelper.setBearer(response.userToken);
                  FlashSingleton.instance.bearerToken = response.userToken;
                  print('bearr ${FlashSingleton.instance.bearerToken}');
                  showToast('Login Successfully');
                  print("ressssssss-----------------${LoginResponse}");
                  PreferenceHelper.setUserName(response.email);
                  PreferenceHelper.setId(response.sId);
                  PreferenceHelper.setLoginStatus(true);
                  print(
                      "ressssssss-----------------${PreferenceHelper.getId()}");

                  Navigator.pushReplacementNamed(
                      context, AppRoutes.profilepage);
                }
              }
            }
            return SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xff090a5f1),
                body: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 80, bottom: 10),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.login,
                            size: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.white,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 300,
                            height: 50,
                            child: FloatingActionButton(
                              backgroundColor: Color(0xff051609b),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (emailController.text.trim().isNotEmpty &&
                                    passwordController.text.trim().isNotEmpty) {
                                  loginUser(bloc);
                                } else if (emailController.text
                                        .trim()
                                        .isEmpty &&
                                    passwordController.text.trim().isNotEmpty) {
                                  showToast("Please enter a valid email");
                                } else if (emailController.text
                                        .trim()
                                        .isNotEmpty &&
                                    passwordController.text.trim().isEmpty) {
                                  // Scenario: Password is empty or contains only whitespace
                                  showToast("Please enter a valid password");
                                } else {
                                  // Scenario: Both username and password are empty or contain only whitespace
                                  showToast(
                                      "Please enter a valid email and password");
                                }
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 300,
                            height: 50,
                            child: TextButton(
                              child: Text("Forget Your Password?",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5))),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dont have an account?",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                                TextButton(
                                  child: Text("Create one",
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
