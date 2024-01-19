import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paraiso/routes/routes_constants.dart';
import 'package:paraiso/widgets/app_specific/paraiso_logo.dart';
import 'package:paraiso/widgets/primary_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLogo(
              height: 126.h,
              width: 101.w,
            ),
            93.5.verticalSpace,
            Text(
              "Paraiso",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            37.verticalSpace,
            SizedBox(
              width: 270.w,
              child: AutoSizeText(
                "Get ready to tantalize your taste buds!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      height: 1.2.h,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            83.verticalSpace,

            PrimaryButton(
              onPressed: () {
                // context.go(AppRouteConstants.homeRoute);
                context.push(AppRouteConstants.loginRoute);
              },
              text: 'Get Started',
              icon: Icons.arrow_forward_ios_outlined,
              enabled: true,
            ),
            20.verticalSpace,
            // logout button
            // ElevatedButton(
            //     onPressed: () {
            //       // method 2 see definition in auth_controller.dart
            //       FirebaseAuth.instance.signOut();
            //       context.pushReplacement(AppRouteConstants.homeRoute);
            //     },
            //     child: const Text("Logout"))
          ],
        ),
      )),
    );
  }
}
