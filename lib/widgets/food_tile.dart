import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class FoodTile extends StatelessWidget {
  final String foodName;
  final String foodImage;
  final String restaurantName;
  final String restaurantImage;
  final double restaurantDistance;
  final String discountPercentage;
  final int othersOrdered;
  final String? imgOthers1;
  final String? imgOthers2;
  final String? imgOthers3;

  const FoodTile(
      {Key? key,
      required this.foodName,
      required this.restaurantName,
      required this.restaurantDistance,
      required this.discountPercentage,
      required this.othersOrdered,
      required this.restaurantImage,
      this.imgOthers1,
      this.imgOthers2,
      this.imgOthers3,
      required this.foodImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 13.h, 36.w, 13.h),
      margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 15.h),
      decoration: BoxDecoration(
        color: softBlack,
        borderRadius: BorderRadius.circular(22.h),
      ),
      child: HStack(
          alignment: MainAxisAlignment.start,
          axisSize: MainAxisSize.max,
          [
            Container(
              width: 97.h,
              height: 97.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$foodImage"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(22.h),
              ),
            ),
            18.horizontalSpace,
            VStack([
              // FIRST ROW
              foodName.text
                  .textStyle(
                    Theme.of(context).textTheme.titleMedium!,
                  )
                  .bold
                  .make(),
              3.verticalSpace,
              //SECOND ROW
              HStack(
                  alignment: MainAxisAlignment.spaceBetween,
                  axisSize: MainAxisSize.max,
                  [
                    Image.asset(
                      "assets/images/$restaurantImage",
                      width: 33.h,
                      height: 33.h,
                    ),
                    9.horizontalSpace,
                    // 2 COLUMN 2nd ROW
                    VStack([
                      Text(
                        restaurantName,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: onPrimaryColor,
                            ),
                      ),
                      Text(
                        "${restaurantDistance.toString()} km",
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: onPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: discountPercentage.text
                          .textStyle(
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: const Color(0xff4CE480),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          )
                          .make(),
                    )
                  ]).wh(210.w, 40.h),
              10.verticalSpace,
              // 2nd column LAST ROW
              HStack([
                // OTHERS IMAGES
                ZStack([
                  Image.asset(
                    "assets/images/$imgOthers1",
                    width: 19.w,
                    height: 19.w,
                  ),
                  Positioned(
                    left: 9.w,
                    child: Image.asset(
                      "assets/images/$imgOthers2",
                      width: 19.w,
                      height: 19.w,
                    ),
                  ),
                  Positioned(
                    left: 18.w,
                    child: Image.asset(
                      "assets/images/$imgOthers3",
                      width: 19.w,
                      height: 19.w,
                    ),
                  ),
                ]).w(40.w),
                6.5.horizontalSpace,
                Text(
                  "$othersOrdered",
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: onPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " others have ordered this item",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: onPrimaryColor,
                      ),
                ),
              ]),
            ]).scrollVertical(),
          ]).w(350.w),
    ).w(1.sw).hPCT(context: context, heightPCT: 16).onTap(() {
      // context.go(AppRouteConstants.foodDetailsRoute);
    });
    //   123
  }
}
