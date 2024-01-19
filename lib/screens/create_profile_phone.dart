import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:paraiso/routes/routes_constants.dart';
import 'package:paraiso/util/theme/theme.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/primary_button.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../widgets/svgtextfield.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    final formattedText = StringBuffer();

    if (text.isNotEmpty) {
      formattedText.write('+');
      if (text.length >= 1) {
        formattedText.write(text.substring(0, 1));
        formattedText.write(' ');
      }

      if (text.length >= 4) {
        formattedText.write(text.substring(1, 4));
        formattedText.write('-');
      } else if (text.length > 1) {
        formattedText.write(text.substring(1));
      }

      if (text.length >= 7) {
        formattedText.write(text.substring(4, 7));
        formattedText.write('-');
      } else if (text.length > 4) {
        formattedText.write(text.substring(4));
      }

      if (text.length > 7) {
        formattedText.write(text.substring(7, text.length));
      }
    }
    // print(formattedText.toString());
    return TextEditingValue(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class CreateProfilePhone extends StatefulWidget {
  const CreateProfilePhone({Key? key}) : super(key: key);

  @override
  State<CreateProfilePhone> createState() => _CreateProfilePhoneState();
}

class _CreateProfilePhoneState extends State<CreateProfilePhone> {
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Container(
              height: 53.h,
              width: 53.h,
              decoration: BoxDecoration(
                  color: softBlack, borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.only(left: 10.w),
              child: const Icon(Icons.arrow_back_ios)),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState!.validate();
        },
        child: SafeArea(
          child: ListView(
            children: [
              34.verticalSpace,
              ProgressBar(
                width: 1.sw,
                value: 4 / 5,
                height: 5.h,
                backgroundColor: onNeutralColor,
                color: primaryColor,
              ),
              93.verticalSpace,
              Center(
                child: SizedBox(
                  width: 326,
                  height: 68,
                  child: AutoSizeText(
                    "Gotcha! Next what's your phone number?",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineLarge!.copyWith(
                      fontWeight: bold,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              31.verticalSpace,
              Center(
                child: SizedBox(
                  width: 293.w,
                  height: 55.h,
                  child: AutoSizeText(
                    "This is so you can verify your account",
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium,
                    maxLines: 2,
                  ),
                ),
              ),
              31.verticalSpace,
              Center(
                child: SvgTextField(
                  hintText: "+1 555-555-5555",
                  controller: phoneController,
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return "Please enter your email";
                    // }
                    return null;
                  },
                  textInputFormatter: [
                    LengthLimitingTextInputFormatter(17),
                    PhoneInputFormatter()
                  ],
                  prefixIcon:
                      "assets/images/Create Account(phone num)_Call_248_3459.svg",
                  textInputType: TextInputType.phone,
                ),
              ),
              40.verticalSpace,
              Center(
                child: PrimaryButton(
                  onPressed: () {
                    // if (emailController.text.isNotEmpty) {
                    //   Get.find<ProfileController>().name = emailController.text;
                    context.push(AppRouteConstants.createProfileSchoolName);
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text("Please enter your name"),
                    //     ),
                    //   );
                    // }
                  },
                  text: "Continue",
                  icon: Icons.arrow_forward_ios_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
