import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paraiso/controllers/auth_controller.dart';
import 'package:paraiso/routes/router.dart';
import 'package:paraiso/setup.dart';
import 'package:paraiso/util/theme/theme.dart';

void main() async {
  await initializePreConfig();
  runApp(const MyApp());
}

// class MyAppRouterDelegate extends GoRouterDelegate {
//   MyAppRouterDelegate({
//     required List<GoRoute> routes,
//     required GoRoute notFound,
//   }) : super(
//           routes: routes,
//           notFound: notFound,
//         );
// }
//
// class MyAppRouteInformationParser extends GoRouteInformationParser {
//   MyAppRouteInformationParser({required super.configuration, required super.onParserException});
//
//   @override
//   Future<RouteMatchList> parseRouteInformation(RouteInformation routeInformation) {
//     // Implement your custom route parsing logic here
//     // Return a GoRouteInformation object based on the routeInformation
//     return super.parseRouteInformation(routeInformation);
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final routerDelegate = MyAppRouterDelegate(routes: , notFound: myNotFound);
  // final routeInformationParser = MyAppRouteInformationParser(
  //   configuration: RouteConfiguration(
  //     location: AppRouteConstants.homeRoute,
  //     path: AppRouteConstants.homeRoute,
  //   ),
  //   onParserException: myOnParserException,
  // );
  // @override

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    //TODO: for testing purposes for making screens
    // return MaterialApp(
    //   home: CreateProfileName(),
    // );

    // return ScreenUtilInit(
    //   designSize: const Size(430, 932),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   builder: (ctx, child) {

    return MaterialApp.router(
        title: 'Paraiso',
        // theme: darkTheme,
        // darkTheme: darkTheme,
        // themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: true,
        routerConfig: AppRouter.router,
        builder: (ctx, child) {
          ScreenUtil.init(ctx,
              designSize: const Size(430, 932),
              minTextAdapt: true,
              splitScreenMode: true);
          return Theme(
            data: darkTheme,
            child: child!,
          );
        });
  }
}
