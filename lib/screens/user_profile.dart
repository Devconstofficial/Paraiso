import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/profile_res_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

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
              color: const Color(0xFFE4E4E4),
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
                  'Alexa Jhons',
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
                )
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
                  Container(
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
                  ).onTap(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              // show content outside of dialog
                              clipBehavior: Clip.none,

                              // insetPadding: EdgeInsets.all(20),
                              contentPadding: EdgeInsets.all(0),
                              backgroundColor: softBlack,
                              content: Stack(
                                children: [
                                  // logo
                                  Positioned(
                                      // center of stack
                                      top: -35.h,
                                      left: 100.w,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/starbucks.png',
                                            width: 81.w,
                                          ),
                                          12.verticalSpace,
                                          Text(
                                            'Starbucks',
                                            style: TextStyle(
                                              fontSize: 25.sp,
                                              fontFamily: 'Recoleta',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      )),
                                  Positioned(
                                    top: 96.h,
                                    left: 25.w,
                                    child: Column(
                                      children: [
                                        DialogTile(
                                            number: 10,
                                            text: "1 free drink",
                                            image:
                                                "assets/images/Send Gifts_pizza 1_346_11093.png"),
                                        DialogTile(
                                            number: 20,
                                            text: "1 free burger",
                                            image:
                                                "assets/images/Paraiso Rewards_burger 1_325_7037.png"),
                                        DialogTile(
                                            number: 30,
                                            text: "1 free menu",
                                            image:
                                                "assets/images/Paraiso Rewards_buritto 1_325_7038.png"),
                                      ],
                                    ),
                                  )
                                ],
                              ).wh(356.w, 333.h),
                            ));
                  }),
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
          ).onTap(() {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      // show content outside of dialog
                      clipBehavior: Clip.none,

                      // insetPadding: EdgeInsets.all(20),
                      contentPadding: EdgeInsets.all(0),
                      backgroundColor: softBlack,
                      content: Stack(
                        children: [
                          // logo
                          Positioned(
                              // center of stack
                              top: -35.h,
                              left: 100.w,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/starbucks.png',
                                    width: 81.w,
                                  ),
                                  12.verticalSpace,
                                  Text(
                                    'Starbucks',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontFamily: 'Recoleta',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )),
                          Positioned(
                            top: 96.h,
                            left: 25.w,
                            child: Column(
                              children: [
                                DialogTile(
                                    number: 10,
                                    text: "1 free drink",
                                    image:
                                        "assets/images/Send Gifts_pizza 1_346_11093.png"),
                                DialogTile(
                                    number: 20,
                                    text: "1 free burger",
                                    image:
                                        "assets/images/Paraiso Rewards_burger 1_325_7037.png"),
                                DialogTile(
                                    number: 30,
                                    text: "1 free menu",
                                    image:
                                        "assets/images/Paraiso Rewards_buritto 1_325_7038.png"),
                              ],
                            ),
                          )
                        ],
                      ).wh(356.w, 333.h),
                    ));
          }),
          //   restaurant  card 2
          10.verticalSpace,
          ProfileResTile(
            image: 'mcdonald.png',
            title: 'McDonalds',
            amount: 10,
          ).onTap(() {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      // show content outside of dialog
                      clipBehavior: Clip.none,

                      // insetPadding: EdgeInsets.all(20),
                      contentPadding: EdgeInsets.all(0),
                      backgroundColor: softBlack,
                      content: Stack(
                        children: [
                          // logo
                          Positioned(
                              // center of stack
                              top: -35.h,
                              left: 100.w,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/starbucks.png',
                                    width: 81.w,
                                  ),
                                  12.verticalSpace,
                                  Text(
                                    'Starbucks',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontFamily: 'Recoleta',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )),
                          Positioned(
                            top: 96.h,
                            left: 25.w,
                            child: Column(
                              children: [
                                DialogTile(
                                    number: 10,
                                    text: "1 free drink",
                                    image:
                                        "assets/images/Send Gifts_pizza 1_346_11093.png"),
                                DialogTile(
                                    number: 20,
                                    text: "1 free burger",
                                    image:
                                        "assets/images/Paraiso Rewards_burger 1_325_7037.png"),
                                DialogTile(
                                    number: 30,
                                    text: "1 free menu",
                                    image:
                                        "assets/images/Paraiso Rewards_buritto 1_325_7038.png"),
                              ],
                            ),
                          )
                        ],
                      ).wh(356.w, 333.h),
                    ));
          }),
          25.verticalSpace,
          Text(
            'Daily Rewards',
            style: TextStyle(
              color: const Color(0xFFE4E4E4),
              fontSize: 23.sp,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w400,
            ),
          ).pLTRB(25.w, 0.h, 25.w, 0.h),
          22.verticalSpace,
          //   Last row
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
                // btn
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/gift box.svg',
                      width: 81.w,
                    ),
                  ],
                ).wPCT(context: context, widthPCT: 28),

                Column(children: [
                  Text(
                    'Rewards Available',
                    style: TextStyle(
                      color: const Color(0xFFE4E4E4),
                      fontSize: 18.sp,
                      fontFamily: 'Recoleta',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  13.verticalSpace,
                  Container(
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
                        Text(
                          'Get Rewards',
                          style: TextStyle(
                            color: const Color(0xFFFF6154),
                            fontSize: 13.sp,
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
                  ).onTap(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              backgroundColor: softBlack,
                              content: VStack(
                                  crossAlignment: CrossAxisAlignment.center,
                                  [
                                    12.verticalSpace,
                                    Stack(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/confetti.svg",
                                          width: 287.w,
                                          height: 176.h,
                                        ),
                                        Positioned(
                                          top: 62,
                                          right: 79,
                                          child: SvgPicture.asset(
                                            "assets/images/gift_wrap.svg",
                                            width: 128.w,
                                          ),
                                        )
                                      ],
                                    ).h(233.h),
                                    30.verticalSpace,
                                    Text(
                                      'Congratulations!',
                                      style: TextStyle(
                                        color: white,
                                        fontSize: 30.sp,
                                        fontFamily: 'Recoleta',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'You have won',
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 20,
                                                  fontFamily: 'Recoleta',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '   ',
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontFamily: 'Recoleta',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '10',
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontFamily: 'Recoleta',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Image.asset(
                                            "assets/images/Send Gifts_pizza 1_346_11093.png",
                                            width: 50.w)
                                      ],
                                    )
                                  ]),
                              actions: [
                                Center(
                                  child: Container(
                                    width: 136.w,
                                    height: 45.h,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 0.50,
                                            color: Color(0xFFFF6154)),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Claim Reward',
                                        style: TextStyle(
                                          color: const Color(0xFFFF6154),
                                          fontSize: 13.sp,
                                          fontFamily: 'Recoleta',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ).onTap(() {
                                    context.pop();
                                  }),
                                )
                              ],
                            ));
                  }),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DialogTile extends StatelessWidget {
  final int number;
  final String image;
  final String text;

  const DialogTile(
      {super.key,
      required this.number,
      required this.text,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image, width: 50.w),
                Text(
                  number.toString(),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'Recoleta',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).w(40.w),
            Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'Recoleta',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        8.verticalSpace,
        Divider(
          color: softGray,
          thickness: .5.h,
        ).w(282.w),
      ],
    ).wh(292.w, 75);
  }
}
