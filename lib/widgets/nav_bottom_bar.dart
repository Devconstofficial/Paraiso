import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:paraiso/routes/routes_constants.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

// class _BottomNavBarState extends State<BottomNavBar> implements PreferredSizeWidget {
class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  // @override
  // Size get preferredSize => Size.fromHeight(60.h);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        32.horizontalSpace,
        Expanded(
          child: GestureDetector(
            onTap: () {
              // set state
              setState(() {
                selectedIndex = 0;
              });

              context.go("/home/0");
            },
            child: customIcon(
                icon: "assets/icons/home.svg", activeIndex: 0, size: 25.w),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
              context.go(AppRouteConstants.restaurantsRoute);
            },
            child: customIcon(
                icon: "assets/icons/restaurants.svg", activeIndex: 1),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
              context.go(AppRouteConstants.profileRoute);
            },
            child: customIcon(icon: "assets/icons/friends.svg", activeIndex: 2),
          ),
        ),
        Expanded(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                context.go(AppRouteConstants.settingsRoute);
              },
              child: customIcon(
                  icon: "assets/icons/settings.svg", activeIndex: 3)),
        ),
        32.horizontalSpace,
      ],
    )
        .box
        .color(softBlack)
        .customRounded(BorderRadius.all(Radius.circular(50)))
        .make()
        .wh(385.w, 100.h)
        // .pSymmetric(h: 20.w, v: 10.h)
        .marginSymmetric(
          horizontal: 25.w,
          vertical: 25.h,
        );
  }

  Widget customIcon(
      {required String icon, required int activeIndex, double? size}) {
    return SvgPicture.asset(
      icon,
      color: activeIndex == selectedIndex ? Colors.red : Colors.grey,
      width: size ?? 28.w,
    );
  }
}
