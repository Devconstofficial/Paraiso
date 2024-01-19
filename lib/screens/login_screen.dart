import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:paraiso/util/theme/theme.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/app_specific/paraiso_logo.dart';
import 'package:paraiso/widgets/primary_button.dart';
import 'package:paraiso/widgets/sized_icons.dart';
import 'package:velocity_x/velocity_x.dart';

import '../routes/routes_constants.dart';
import '../widgets/svgtextfield.dart';

class LoginFormController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool emailValid = false.obs;

  bool get isEmailValid => emailValid.value;
  RxBool rememberMe = true.obs;

  void toggleRememberMe() {
    rememberMe.toggle();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      emailValid.value = false;
      return 'Please enter an email';
    }

    if (!GetUtils.isEmail(value)) {
      emailValid.value = false;
      return 'Please enter a valid email';
    }
    // Add additional email validation logic
    emailValid.value = true;
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty || value == null) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    // Add additional password validation logic
    return null;
  }

  void submitForm() {
    //TODO uncomment this
    // if (formKey.currentState!.validate()) {
    //   // Validation successful, proceed with form submission
    //   _emailController.clear();
    //   _passwordController.clear();
    // } else {
    //   // Validation failed, handle invalid form data
    // }
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginFormController loginFormController =
      Get.put(LoginFormController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signInAnonymously(Function callback) {
    FirebaseAuth.instance.signInAnonymously().then((value) {
      print("User ID: ${value.user!.uid}");
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    // return HeadlineDisplay();
    // print(ScreenUtil().scaleWidth);
    // screen width:
    // print(ScreenUtil().screenWidth);

    // print("Am I logged in: " +
    //     Get.find<AuthController>().getIsLoggedIn.toString());

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState!.validate();
          },
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: context.height,
                    width: context.width * .8767,
                    child: ListView(children: [
                      128.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppLogo(
                            height: 66.5.h,
                            width: 53.35.w,
                          ),
                          9.horizontalSpace,
                          Text(
                            "Paraiso",
                            style: context.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      88.verticalSpace,
                      SizedBox(
                        width: 208,
                        height: 39,
                        child: Text(
                          'Welcome back',
                          textAlign: TextAlign.center,
                          style: context.titleLarge!.copyWith(
                            fontWeight: bold,
                            color: white,
                          ),
                        ),
                      ),
                      4.verticalSpace,
                      SizedBox(
                        width: 273.w,
                        height: 55.h,
                        child: AutoSizeText(
                          'Use your credentials below and login to your account',
                          textAlign: TextAlign.center,
                          style: context.titleSmall,
                          maxLines: 2,
                        ),
                      ),
                      38.verticalSpace,
                      Obx(() {
                        return SvgTextField(
                          hintText: "Enter your email",
                          validator: loginFormController.emailValidator,
                          prefixIcon: "assets/images/email_icon.svg",
                          suffixIcon: loginFormController.isEmailValid
                              ? SizedIcons(
                                  svgPath: "assets/images/icon_checkmark.svg",
                                  scale: .4,
                                )
                              : null,
                          textInputType: TextInputType.emailAddress,
                        );
                      }),
                      18.verticalSpace,
                      SvgTextField(
                        hintText: "Enter your password",
                        validator: loginFormController.passwordValidator,
                        prefixIcon:
                            "assets/images/Customer Login_Lock_I126_1815;71_2129.svg",
                        isPasswordField: true,
                        textInputType: TextInputType.emailAddress,
                      ),
                      15.verticalSpace,
                      SizedBox(
                        width: context.width * .8767,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(mainAxisSize: MainAxisSize.min, children: [
                                Obx(() => Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      value:
                                          loginFormController.rememberMe.value,
                                      onChanged: (bool? value) {
                                        //Do Something When Value Changes to True Or False
                                        loginFormController.toggleRememberMe();
                                      },
                                      checkColor: Colors.red,
                                      activeColor: softBlack,
                                    )),
                                14.w.horizontalSpace,
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: Color(0xFFE4E4E4),
                                    fontSize: 15.sp,
                                    fontFamily: 'Recoleta',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                              //   forgot password
                              GestureDetector(
                                  onTap: () {
                                    //   forgot password
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFE4E4E4),
                                      fontSize: 15.sp,
                                      fontFamily: 'Recoleta',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ]),
                      ),
                      53.verticalSpace,
                      Center(
                        child: PrimaryButton(
                          onPressed: () {
                            // context.push(AppRouteConstants.createProfileName);
                            // check if empty, show snackbar

                            // TODO: uncomment this
                            // if (loginFormController._emailController.text.isEmpty ||
                            //     loginFormController
                            //         ._passwordController.text.isEmpty) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text(
                            //         "Please fill in all fields",
                            //         style: context.textTheme.titleMedium,
                            //       ),
                            //       // backgroundColor: dangerColor,
                            //     ),
                            //   );
                            // } else {
                            loginFormController.submitForm();
                            context.go(AppRouteConstants.homeRoute);
                            // }
                          },
                          text: "Log into your account",
                        ),
                      ),
                      //check if height of viewport 1.vh is smaller than 500
                      ScreenUtil().scaleHeight < 1
                          ? 83.h.verticalSpace
                          : 163.h.verticalSpace,

                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyle(
                                color: Color(0xFFE4E4E4),
                                fontSize: 15,
                                fontFamily: 'Recoleta',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up here',
                              style: TextStyle(
                                color: Color(0xFFFF6154),
                                fontSize: 15,
                                fontFamily: 'Recoleta',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ).onTap(
                        () {
                          context.go(AppRouteConstants.createProfileName);
                        },
                      ).paddingOnly(bottom: 5.h),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
