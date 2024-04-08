import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mg/screens/login_page/model/LoginResponseModel.dart';
import 'package:mg/utils/singleton.dart';
import 'package:mg/base/base_state.dart';
import 'package:mg/screens/login_page/login_bloc.dart';
import '../../router.dart';
import '../../utils/base_equatable.dart';
import '../../utils/contants.dart';
import '../../utils/preference_helpher.dart';
import 'login_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/utils/color_resources.dart';
import 'package:mg/utils/image_resource.dart';
import 'package:flutter/gestures.dart';

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
  bool checkBoxValue = false;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LoginBloc>(context);
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
                      context, AppRoutes.profilePage);
                }
              }
            }
            return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return SafeArea(
                    child: Scaffold(
                      backgroundColor: Color(0xff0FFA53C),
                      body: Stack(
                        children: [
                          Container(
                            child: Image.asset(
                              ImageResource.banner,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 250.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontFamily:
                                              FontResousrce.DMSans_SEMIBOLD),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 15,
                                        top: 15,
                                        right: 15,
                                        bottom: 10),
                                    child: Text(
                                      "Hello!👋",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily:
                                              FontResousrce.DMSans_SEMIBOLD),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        floatingLabelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        label: Text(
                                          'User Name',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontResousrce.DMSans_REGULAR,
                                              fontSize: 14),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: ColorResource.primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        floatingLabelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        label: const Text(
                                          'Password',
                                          style: TextStyle(
                                              fontFamily:
                                                  FontResousrce.DMSans_REGULAR,
                                              fontSize: 14),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: ColorResource.primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          new Checkbox(
                                              value: checkBoxValue,
                                              activeColor: Colors.orange,
                                              onChanged: (bool? newValue) {
                                                setState(() {
                                                  checkBoxValue = newValue!;
                                                });
                                              }),
                                          Text(
                                            'Remember me',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(right: 20.w),
                                          alignment: Alignment.centerRight,
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                text: '  Forgot Password?',
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: FontResousrce
                                                        .DMSans_REGULAR,
                                                    color: Color(0xffeb5e3b)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator
                                                            .pushReplacementNamed(
                                                                context,
                                                                AppRoutes
                                                                    .forgetPage);
                                                      }),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Center(
                                      child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(310.w, 50.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      backgroundColor: Colors.orange,
                                    ),
                                  )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Center(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text: 'Dont have an account?',
                                        style: TextStyle(
                                          height: 2,
                                          fontSize: 13.sp,
                                          fontFamily:
                                              FontResousrce.DMSans_REGULAR,
                                          color: Colors.black54,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '  SignUp ',
                                            style: TextStyle(
                                                height: 1.2,
                                                fontSize: 13.sp,
                                                fontFamily: FontResousrce
                                                    .DMSans_REGULAR,
                                                color: Color(0xffeb5e3b)),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushReplacementNamed(
                                                    context,
                                                    AppRoutes.signUpScreen);
                                              },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      '  Continue as Guest?',
                                      style: TextStyle(
                                          height: 1.2,
                                          fontSize: 13.sp,
                                          fontFamily:
                                              FontResousrce.DMSans_REGULAR,
                                          color: Color(0xffeb5e3b)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
