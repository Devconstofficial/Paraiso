import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paraiso/routes/router.dart';
import 'package:paraiso/screens/friend_profile.dart';
import 'package:paraiso/screens/invite_screen.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // invite
        Container(
          margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 0.h),
          padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 25.h),
          width: 380.w,
          decoration: BoxDecoration(
            color: softBlack,
            borderRadius: BorderRadius.circular(22.h),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/images/Friends_Users_280_6467.svg",
                fit: BoxFit.contain,
                width: 45.5.w,
              ),
              GestureDetector(
                onTap: () {
                  // push a material page route
                  AppRouter.rootNavigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => InviteScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Invite Friends',
                      style: TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 20.sp,
                        fontFamily: 'Recoleta',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    14.horizontalSpace,
                    Icon(
                      Icons.arrow_forward_ios,
                      color: softGray,
                      size: 25.sp,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        34.verticalSpace,

        //friends list
        Text(
          'Friends list',
          style: TextStyle(
            color: Color(0xFFE4E4E4),
            fontSize: 23.sp,
            fontFamily: 'Recoleta',
            fontWeight: FontWeight.w700,
          ),
        ).px(33.w),

        20.verticalSpace,

        //   friends tiles
        FriendTile(name: "Alex Costa", image: "10.png"),
        10.verticalSpace,
        FriendTile(name: "Kristi Jhons", image: "11.png"),
        10.verticalSpace,
        FriendTile(name: "Harry Bale", image: "12.png"),
        10.verticalSpace,
        FriendTile(name: "Nina James", image: "13.png"),
      ],
    );
  }
}

class FriendTile extends StatelessWidget {
  final String name;
  final String image;

  // final bool isOnline;

  const FriendTile({
    Key? key,
    required this.name,
    required this.image,
    // required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 15.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      width: 380.w,
      // height: 90.h,
      decoration: BoxDecoration(
        color: softBlack,
        borderRadius: BorderRadius.circular(22.h),
      ),
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage('assets/images/$image'),
              ),
              14.horizontalSpace,
              Text(
                name,
                style: TextStyle(
                  color: Color(0xFFE4E4E4),
                  fontSize: 18.sp,
                  fontFamily: 'Recoleta',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          // isOnline
          //     ? Container(
          //         width: 10.w,
          //         height: 10.h,
          //         decoration: BoxDecoration(
          //           color: Color(0xFF00FF00),
          //           borderRadius: BorderRadius.circular(50.h),
          //         ),
          //       )
          //     : Container(
          //         width: 10.w,
          //         height: 10.h,
          //         decoration: BoxDecoration(
          //           color: Color(0xFFBDBDBD),
          //           borderRadius: BorderRadius.circular(50.h),
          //         ),
          //       ),
        ],
      ),
    ).onTap(() {
      // push a material page route
      AppRouter.rootNavigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => FriendProfile(),
        ),
      );
    });
  }
}
