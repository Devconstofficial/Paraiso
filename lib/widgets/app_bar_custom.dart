import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paraiso/screens/user_profile.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => Size.fromHeight(78.h);
}

class _AppBarCustomState extends State<AppBarCustom> {
  // AppBarItem

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.h),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // elevation: 0.0,
        leadingWidth: 100.w,
        leading: CircleAvatar(
          radius: 50.r,
          backgroundColor: softBlack,
          child: Image.asset(
            width: 70.w,
            height: 70.h,
            'assets/images/Customer Dashboard_Ellipse 3_126_1707.png',
            // width: 73.w,
          ),
        ).onTap(
          () {
            //user_profile
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserProfile()));
          },
        ),

        // Container(
        //   width: 1.sw,
        //   height: 150.h,
        //   margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //
        //
        //       //   TITLE
        //
        //
        //       //   ACTIONS
        //
        //     ],
        //   ),

        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/paraiso_logo.svg',
              width: 37.w,
              height: 30.h,
            ),
            10.horizontalSpace,
            const Text(
              'Paraiso',
              style: TextStyle(
                color: Color(0xFFE4E4E4),
                fontSize: 25,
                fontFamily: 'Recoleta',
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/images/notification bell.svg',
                  ),
                  onPressed: () {},
                ).wh(53.w, 53.h),
                //   a red dot on top right
                Positioned(
                  top: 10.h,
                  right: 10.h,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ).box.color(softBlack).roundedFull.make(),
          ),
        ],
      ),
    );
  }
}
