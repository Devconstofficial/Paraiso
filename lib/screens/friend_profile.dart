import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paraiso/routes/router.dart';
import 'package:paraiso/screens/send_gifts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../util/theme/theme_constants.dart';
import '../widgets/profile_res_tile.dart';

class FriendProfile extends StatelessWidget {
  const FriendProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutralColor,
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
        title: Center(
          child: Text(
            'Kristi',
            style: TextStyle(
              color: Color(0xFFE4E4E4),
              fontSize: 25.sp,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          44.horizontalSpace,
        ],
      ),
      body: ListView(
        children: [
          18.verticalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: const AssetImage('assets/images/7.png'),
              ),
              17.horizontalSpace,
              VStack([
                Text(
                  'Kristi Jhons',
                  style: TextStyle(
                    color: const Color(0xFFE4E4E4),
                    fontSize: 20.sp,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                5.verticalSpace,
                Text(
                  'Mason High School',
                  style: TextStyle(
                    color: const Color(0xFFE4E4E4),
                    fontSize: 18.sp,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                15.verticalSpace,
                GestureDetector(
                  onTap: () {
                    AppRouter.rootNavigatorKey.currentState!.push(
                      MaterialPageRoute(
                        builder: (context) => const SendGifts(),
                      ),
                    );
                  },
                  child: Container(
                    width: 136,
                    height: 35.32,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFFF6154)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'See Rewards',
                          style: TextStyle(
                            color: Color(0xFFFF6154),
                            fontSize: 13,
                            fontFamily: 'Recoleta',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        5.horizontalSpace,
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFFFF6154),
                          size: 13,
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ).pLTRB(25.w, 0.h, 25.w, 25.h),
          17.verticalSpace,
          Divider(
            color: softGray,
            thickness: .5.h,
            // indent: 25,
            // endIndent: 25,
          ),
          22.verticalSpace,

          //   2nd row
          Container(
            margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 0.h),
            padding: EdgeInsets.all(25.w),
            width: 380.w,
            decoration: BoxDecoration(
              color: softBlack,
              borderRadius: BorderRadius.circular(22.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Paraiso',
                    style: TextStyle(
                      color: const Color(0xFFE4E4E4),
                      fontSize: 24.sp,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Total Coconuts',
                    style: TextStyle(
                      color: const Color(0xFFBDBDBD),
                      fontSize: 15.sp,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  13.verticalSpace,
                ]),
                Row(children: [
                  Text(
                    '20',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFFE4E4E4),
                      fontSize: 20.sp,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  7.horizontalSpace,
                  SvgPicture.asset(
                    'assets/images/Food Filter_OBJECTS_458_13901.svg',
                    width: 37.w,
                  )
                ])
              ],
            ),
          ),
          25.verticalSpace,
          //   3rd row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Restaurant Rewards',
                style: TextStyle(
                  color: const Color(0xFFE4E4E4),
                  fontSize: 23.sp,
                  fontFamily: 'Recoleta',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'See All',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFFBDBDBD),
                  fontSize: 16.sp,
                  fontFamily: 'Recoleta',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ).pLTRB(25.w, 0.h, 25.w, 0.h),
          10.verticalSpace,
          //   restaurant  card 1
          ProfileResTile(
            image: 'starbucks.png',
            title: 'Starbucks',
            amount: 10,
          ),
          //   restaurant  card 2
          10.verticalSpace,
          ProfileResTile(
            image: 'mcdonald.png',
            title: 'McDonalds',
            amount: 10,
          ),
        ],
      ),
    );
  }
}
