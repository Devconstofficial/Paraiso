import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantTile extends StatelessWidget {
  final String restaurantName;
  final String restaurantDescription;
  final String distance;
  final String image;

  const RestaurantTile(
      {Key? key,
      required this.restaurantName,
      required this.restaurantDescription,
      required this.distance,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(Uri(path: '/restaurantDetails', queryParameters: {
          "restaurantName": restaurantName,
          "restaurantDescription": restaurantDescription,
          "distance": distance,
          "image": image
        }).toString());
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 15.h),
        padding: EdgeInsets.fromLTRB(20.w, 18.h, 27.w, 18.h),
        decoration: BoxDecoration(
          color: softBlack,
          borderRadius: BorderRadius.circular(22.r),
        ),
        width: context.screenWidth,
        child: HStack(alignment: MainAxisAlignment.start, [
          Image.asset(
            "assets/images/$image",
            width: 73.w,
            height: 73.h,
          ),
          14.horizontalSpace,
          VStack(alignment: MainAxisAlignment.center, [
            VxTextBuilder(
              restaurantName,
            )
                .textStyle(
                  Theme.of(context).textTheme.titleMedium!,
                )
                .bold
                .make(),
            4.verticalSpace,
            // restaurantName.text. .make(),

            SizedBox(
              width: 190.w,
              child: AutoSizeText(
                restaurantDescription,
                maxLines: 2,
              ),
            )
          ]),
          const Spacer(),
          distance.text.color(onNeutralColor).make(),
        ]),
      ),
    );
    ListTile(
      title: restaurantName.text.make(),
      subtitle: restaurantDescription.text.color(onNeutralColor).make(),
      leading: CircleAvatar(child: Image.asset("assets/images/$image")),
      trailing: distance.text.color(onNeutralColor).make(),
    )
        .box
        .color(softBlack)
        .roundedLg
        .margin(
          const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
        )
        .make()
        .wh(
          context.screenWidth,
          context.percentHeight * 0.10515,
        );
  }
}
