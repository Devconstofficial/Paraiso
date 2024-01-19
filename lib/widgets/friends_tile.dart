import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class FriendsTile extends StatelessWidget {
  final String friendName;
  final String sentFoodImage;
  final String sentTo;
  final String location;
  final String time;
  final String friendImage;

  const FriendsTile(
      {Key? key,
      required this.friendName,
      required this.sentFoodImage,
      required this.sentTo,
      required this.location,
      required this.time,
      required this.friendImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 15.h),
      padding: EdgeInsets.fromLTRB(20.w, 18.h, 27.w, 18.h),
      decoration: BoxDecoration(
        color: softBlack,
        borderRadius: BorderRadius.circular(22.r),
      ),
      width: context.screenWidth,
      child: HStack(alignment: MainAxisAlignment.start, [
        Image.asset(
          "assets/images/$friendImage",
          width: 73.w,
          height: 73.h,
        ),
        14.horizontalSpace,
        VStack(alignment: MainAxisAlignment.center, [
          VxTextBuilder(
            friendName,
          )
              .textStyle(
                Theme.of(context).textTheme.titleMedium!,
              )
              .bold
              .color(white)
              .make(),
          4.verticalSpace,
          // friendName.text. .make(),

          SizedBox(
            width: 200.w,
            // Theme(
            // data: ThemeData(
            //   textTheme: TextTheme(
            //     titleSmall: TextStyle(fontSize: 20.sp, color: white),
            //   ),
            // ),
            child: DefaultTextStyle.merge(
              style: TextStyle(color: white, fontSize: 13.sp),
              child: Wrap(
                children: [
                  Text(
                    "Sent",
                    maxLines: 2,
                  ),
                  Baseline(
                    baseline: 20.h,
                    baselineType: TextBaseline.alphabetic,
                    child: Image.asset(
                      "assets/images/$sentFoodImage",
                      width: 27.w,
                      height: 27.h,
                    ),
                  ),

                  Text(
                    "to ",
                    maxLines: 2,
                  ),
                  Text(
                    sentTo,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700, color: primaryColor),
                    maxLines: 2,
                  ),
                  //at
                  Text(
                    " at ",
                    maxLines: 2,
                  ),
                  Text(
                    location,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w700, color: white),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ]),
        const Spacer(),
        time.text.color(onNeutralColor).make(),
      ]),
    );
  }
}
