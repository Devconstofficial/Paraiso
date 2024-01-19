import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

/*
Run this command if you don't already have firebase_options.dart
flutterfire configure
Docs: https://firebase.flutter.dev/docs/cli/
*/
import 'firebase_options.dart';

Future initializePreConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetStorage();
  await firebaseSetup();
  await screenUtilSetup();
  spinnerSetup();
}

void setupGetStorage() {
  GetStorage.init();
}

void spinnerSetup() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    // ..backgroundColor = Colors.green
    // ..indicatorColor = Colors.yellow
    // ..textColor = Colors.yellow
    // ..maskColor = Colors.blue.withOpacity(0.5)
    // ..userInteractions = true
    ..dismissOnTap = false;
}

Future screenUtilSetup() async {
  // to support font adaptation in the textTheme of app theme
  await ScreenUtil.ensureScreenSize();
}

firebaseSetup() async {
  if (Platform.isWindows) return;

  await Firebase.initializeApp(
    //run > flutterfire configure
    //and import DefaultFirebaseOptions!
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.wait();
}

extension FirebaseAuthExtension on FirebaseAuth {
  wait() async {
    bool ready = false;
    FirebaseAuth.instance.authStateChanges().listen((event) {
      ready = true;
    });

    while (ready == false) {
      await Future.delayed(const Duration(milliseconds: 250));
    }
  }
}
