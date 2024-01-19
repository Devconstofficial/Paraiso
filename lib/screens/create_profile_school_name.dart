import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paraiso/routes/routes_constants.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/normal_appbar.dart';
import 'package:paraiso/widgets/primary_button.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:velocity_x/velocity_x.dart';

import '../util/theme/theme.dart';
import '../widgets/svgtextfield.dart';

class CreateProfileSchoolName extends StatefulWidget {
  const CreateProfileSchoolName({Key? key}) : super(key: key);

  @override
  State<CreateProfileSchoolName> createState() =>
      _CreateProfileSchoolNameState();
}

class _CreateProfileSchoolNameState extends State<CreateProfileSchoolName> {
  TextEditingController schoolNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    schoolNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppbar(),
      body: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState!.validate();
        },
        child: SafeArea(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              34.verticalSpace,
              ProgressBar(
                width: 1.sw,
                value: 1,
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
                    "Just one last step. Let us know about your school",
                    textAlign: TextAlign.center,
                    style: context.headlineLarge!.copyWith(
                      fontWeight: bold,
                      color: onPrimaryColor,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              31.verticalSpace,
              const Center(
                child: SizedBox(
                  width: 293,
                  height: 55,
                  child: Text(
                    "Please, enter your school name",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                  ),
                ),
              ),
              34.verticalSpace,
              Center(
                child: SvgTextField(
                  hintText: "Enter your school name",
                  prefixIcon:
                      "assets/images/Create Account(school name)_Building_248_3828.svg",
                  controller: schoolNameController,
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return "Please enter your school name";
                    // }
                    return null;
                  },
                ),
              ),
              40.verticalSpace,
              Center(
                child: PrimaryButton(
                  onPressed: () {
                    // if (schoolNameController.text.isNotEmpty) {
                    //   // Save the school name and navigate to the next screen
                    //    TODO: use push to allow to go back else -> go
                    context.go(AppRouteConstants.homeRoute);
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text("Please enter your school name"),
                    //     ),
                    //   );
                    // }
                  },
                  text: 'Continue',
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
