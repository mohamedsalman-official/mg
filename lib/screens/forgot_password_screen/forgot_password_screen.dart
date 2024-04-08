import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mg/screens/forgot_password_screen/forgot_password_bloc.dart';
import 'package:mg/screens/forgot_password_screen/forgot_password_event.dart';

import '../../base/base_state.dart';
import '../../utils/color_resources.dart';
import '../../utils/image_resource.dart';

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
    bloc.add(ForgotPasswordAPIEvent(context: context, arguments: data));
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
                child: Text('Loadingggggg'),
              );
            } else {
              return ScreenUtilInit(builder: (_, child) {
                return SafeArea(
                  child: Scaffold(
                    backgroundColor: ColorResource.primaryColor,
                    body: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20.h),
                          child: Image.asset(
                            ImageResource.banner,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 200.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25.h),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15.w,
                                      top: 15.h,
                                      right: 15.w,
                                      bottom: 10.h),
                                  child: Text(
                                    "Please enter registered email id to reset password",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontFamily:
                                            FontResousrce.DMSans_SEMIBOLD),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      floatingLabelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Email ID *',
                                        style: TextStyle(
                                            fontFamily:
                                                FontResousrce.DMSans_REGULAR,
                                            fontSize: 14.sp),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ColorResource.primaryColor,
                                          width: 2.w,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 2.w,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.w,
                                      top: 10.h,
                                      right: 15.w,
                                      bottom: 10.h),
                                  child: Container(
                                    height: 50.h,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Center(
                                        child: Text(
                                          "Send Reset  Link",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontFamily:
                                                  FontResousrce.DMSans_MEDIUM),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorResource.primaryColor),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 170.h),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.w,
                                      top: 10.h,
                                      right: 15.w,
                                      bottom: 10.h),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Back to Login",
                                        style: TextStyle(
                                            color: ColorResource.primaryColor,
                                            fontFamily:
                                                FontResousrce.DMSans_MEDIUM,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            }
          }),
    );
  }
}
