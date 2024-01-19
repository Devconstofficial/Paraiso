import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          30.verticalSpace,
          const OrderStatusTile(
              icon: "restaurant location",
              title: "Pickup Location",
              subtitle: "1500 Broadway, New York, NY 10036"),
          const OrderStatusTile(
              icon: "Order Status_Timer_412_5964",
              title: "Preparing Delay",
              subtitle: "45 minutes"),
          const OrderStatusTile(
              icon: "clock", title: "Working Hours", subtitle: "2.0 Hours"),
          50.verticalSpace,
          Text(
            "Order Progress",
            style: context.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).pLTRB(25.w, 0.h, 0.w, 0.h),
          27.verticalSpace,
          Row(
            children: [
              //   checkmar svg
              SvgPicture.asset(
                'assets/images/order placed.svg',
                height: 42.h,
                width: 42.h,
              ),
              13.horizontalSpace,
              Text("Order Accepted", style: context.bodyLarge),
            ],
          ).pOnly(left: 42.w),
          4.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 4.w,
              height: 40.h,
              color: context.primaryColor,
            ).pOnly(left: 55.w),
          ),
          4.verticalSpace,
          Row(
            children: [
              //   checkmar svg
              SvgPicture.asset(
                'assets/images/order placed.svg',
                height: 42.h,
                width: 42.h,
              ),
              13.horizontalSpace,
              Text("Order Prepared", style: context.bodyLarge),
            ],
          ).pOnly(left: 42.w),
          4.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 4.w,
              height: 40.h,
              color: softBlack,
            ).pOnly(left: 55.w),
          ),
          4.verticalSpace,
          Row(
            children: [
              // grey circle with whitish checkmark in center
              Center(
                child: Container(
                  width: 42.h,
                  height: 42.h,
                  decoration: BoxDecoration(
                    color: softGray,
                    borderRadius: BorderRadius.circular(50.h),
                  ),
                  child: Icon(
                    Icons.check,
                    color: softGray,
                    size: 25,
                  ),
                ),
              ),
              13.horizontalSpace,
              Text("Ready for Pickup", style: context.bodyLarge),
            ],
          ).pOnly(left: 42.w),
        ],
      ),
    );
  }
}

class OrderStatusTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const OrderStatusTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.list,
      tileColor: softBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.h),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      leading: SvgPicture.asset(
        'assets/images/$icon.svg',
        width: 30.w,
      ),
      title: Text(
        title,
        style: context.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle, style: context.bodyLarge),
    ).w(380.w).marginSymmetric(horizontal: 25.w, vertical: 10.h);
  }
}
