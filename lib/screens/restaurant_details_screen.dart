import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paraiso/controllers/res_categories_controller.dart';
import 'package:paraiso/screens/place_order.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/app_bar_custom.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final String restaurantName;
  final String image;

  const RestaurantDetailsScreen(
      {Key? key, required this.restaurantName, required this.image})
      : super(key: key);

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  String restaurantAddress = "Brookylyn, 8th Ave";
  ResCategoriesController resCategoriesController =
      Get.put(ResCategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: SafeArea(
        child: ListView(
          // remove the bounce effect
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            // FIRST ROW
            HStack(crossAlignment: CrossAxisAlignment.start, [
              Image.asset(
                // could load a less rounded variant by appending rounded_rect to
                // the img and then name the restaurants acc
                // then remove the scaling,
                "assets/images/${widget.image}",
                width: 100.h,
                height: 100.h,
              ).scale(scaleValue: 1.5).cornerRadius(22.h),
              18.horizontalSpace,
              VStack([
                Text(
                  widget.restaurantName,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: onPrimaryColor,
                      ),
                ),
                4.verticalSpace,
                HStack([
                  SvgPicture.asset(
                    "assets/images/restaurant location.svg",
                    color: primaryColor,
                    width: 18.w,
                  ),
                  4.horizontalSpace,
                  Text(
                    restaurantAddress,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: onNeutralColor,
                        ),
                  )
                ])
              ])
            ]).pLTRB(25.w, 25.h, 25.w, 0),
            // SECOND ROW
            HStack([
              Container(
                decoration: BoxDecoration(
                  color: softBlack,
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.h),
                    child: ZStack([
                      // FractionallySizedBox(
                      //   widthFactor: 1,
                      //   heightFactor: 1.7,
                      //   child:
                      Positioned(
                        top: -45.h,
                        child: SvgPicture.asset(
                          "assets/images/wave_3.svg",
                          // ),
                        ).w(380.w),
                      ),
                      Positioned(
                        top: 10.h,
                        left: 25.w,
                        right: 27.w,
                        child:
                            VStack(alignment: MainAxisAlignment.spaceBetween, [
                          HStack(alignment: MainAxisAlignment.spaceBetween, [
                            Text(
                              "Rewards",
                              style: TextStyle(
                                fontFamily: "Recoleta",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffe5e5e5),
                                height: 30 / 22,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Owned  ',
                                    style: TextStyle(
                                      color: Color(0xFFE4E4E4),
                                      fontSize: 16,
                                      fontFamily: 'Recoleta',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '10',
                                    style: TextStyle(
                                      color: Color(0xFFE4E4E4),
                                      fontSize: 16,
                                      fontFamily: 'Recoleta',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            4.horizontalSpace,
                            SvgPicture.asset(
                              "assets/images/Food Filter_OBJECTS_458_13901.svg",
                              width: 20.w,
                            ),
                          ]).w(380.w),
                          HStack(alignment: MainAxisAlignment.spaceBetween, [
                            Text("1 Free Regular Black Tea",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                            HStack([
                              Text(
                                "10",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: onPrimaryColor),
                              ),
                              4.horizontalSpace,
                              SvgPicture.asset(
                                "assets/images/Food Filter_OBJECTS_458_13901.svg",
                                width: 20.w,
                              ),
                            ]),
                          ]).w(380.w), // to stretch bottom row full width
                        ]).wh(380.w, 125.h),
                      ),
                    ])
                    // .scale(
                    //   scaleValue: 1.2,
                    // ),
                    ),
              ).wh(380.w, 150.h),
            ]).wFull(context).marginAll(25.w).onInkTap(() {}),
            // THIRD ROW
            HStack([
              //   btn 1
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 147.w,
                  maxWidth: 165.w,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: onPrimaryColor,
                      width: .5,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                    borderRadius: BorderRadius.circular(15.h),
                  ),
                  child: VStack([
                    HStack([
                      //   icon
                      SvgPicture.asset(
                        "assets/images/moon.svg",
                        color: primaryColor,
                        width: 16.w,
                      ),
                      4.horizontalSpace,
                      Text(
                        "Closed",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: onPrimaryColor,
                                ),
                      )
                    ]),
                    4.verticalSpace,
                    Text(
                      "1:00am - 7:00pm",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: onPrimaryColor,
                          ),
                    )
                  ]),
                ).onTap(() {}),
              ),
              14.horizontalSpace,
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 147.w,
                  maxWidth: 165.w,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: onPrimaryColor,
                      width: .5,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                    borderRadius: BorderRadius.circular(15.h),
                  ),
                  child: VStack([
                    HStack([
                      //   icon
                      SvgPicture.asset(
                        "assets/images/clock.svg",
                        color: primaryColor,
                        width: 16.w,
                      ),
                      4.horizontalSpace,
                      Text(
                        "0 - 3 mins",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: onPrimaryColor,
                                ),
                      )
                    ]),
                    4.verticalSpace,
                    Text(
                      "est. pickup time ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: onPrimaryColor,
                          ),
                    )
                  ]),
                ).onTap(() {}),
              ),
              //   btn 2
            ]).marginSymmetric(horizontal: 25.w),

            // FOURTH ROW
            HStack(alignment: MainAxisAlignment.spaceBetween, [
              Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: onPrimaryColor,
                    ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: onNeutralColor,
                        ),
                  ))
            ]).pLTRB(25, 21, 26, 0),
            // FIFTH ROW
            HStack([
              const ResChip(index: 0, name: "Drinks"),
              14.horizontalSpace,
              const ResChip(index: 1, name: "Fast Food"),
              14.horizontalSpace,
              const ResChip(index: 2, name: "Sweets"),
            ]).scrollHorizontal().w(360.w).pLTRB(25, 0, 26, 0),
            // SIXTH ROW
            HStack(alignment: MainAxisAlignment.spaceBetween, [
              Text(
                "Drinks",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: onPrimaryColor,
                    ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: onNeutralColor,
                        ),
                  ))
            ]).pLTRB(25, 21, 26, 0),
            // SEVENTH ROW
            ResFoodTile(
                foodName: "Mint Juice",
                image: "Restaurant_Rectangle 8_490_4700.png",
                category: "Drinks",
                price: 21.00),
            ResFoodTile(
                foodName: "Beef Burger",
                image: "Restaurant sort by Discount_Rectangle 8_458_13269.png",
                category: "Fast Food",
                price: 32.00),
          ],
        ),
      ),
    );
  }
}

class ResChip extends StatelessWidget {
  final int index;
  final String name;

  const ResChip({Key? key, required this.index, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: () {
          switch (index) {
            case 0:
              Get.find<ResCategoriesController>().setActiveChip(index);
              break;
            case 1:
              Get.find<ResCategoriesController>().setActiveChip(index);
              break;
            case 2:
              Get.find<ResCategoriesController>().setActiveChip(index);
              break;
            default:
              Get.find<ResCategoriesController>().setActiveChip(index);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Get.find<ResCategoriesController>().activeChip.value == index
                  ? primaryColor
                  : softBlack,
          foregroundColor: onNeutralColor,
          disabledBackgroundColor: softBlack,
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          // side: BorderSide(
          //   color: Get.find<ResCategoriesController>().activeChip.value == index
          //       ? primaryColor
          //       : Colors.transparent,
          //   width: 1,
          // ),
          shape: const StadiumBorder(),
          minimumSize: Size(100.w, 60.h),
        ),
        child: Text(name),
      ),
    );
  }
}

class ResFoodTile extends StatelessWidget {
  final String foodName;
  final String image;
  final String category;
  final double price;

  ResFoodTile(
      {Key? key,
      required this.foodName,
      required this.image,
      required this.category,
      required this.price})
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
                  image: AssetImage("assets/images/$image"),
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
                    Theme.of(context).textTheme.titleLarge!,
                  )
                  .bold
                  .make(),
              3.verticalSpace,
              Text(
                category,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: onPrimaryColor,
                    ),
              ),
              //SECOND ROW
              HStack(
                  alignment: MainAxisAlignment.start,
                  axisSize: MainAxisSize.max,
                  [
                    Baseline(
                      baseline: 10.h,
                      baselineType: TextBaseline.alphabetic,
                      child: Text("\$",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: onPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                    ),
                    Text(
                      "${price.toString()}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: onPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    13.horizontalSpace,
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          // vertical: 9.h,
                        ),
                        backgroundColor: Colors.transparent,
                        foregroundColor: onPrimaryColor,
                        side: BorderSide(
                          color: onPrimaryColor,
                          width: .5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        ),
                        // minimumSize: Size(100.w, 60.h),
                      ),
                      onPressed: () {},
                      child: HStack([
                        const Text("+1 "),
                        4.horizontalSpace,
                        SvgPicture.asset(
                          "assets/images/Food Filter_OBJECTS_458_13901.svg",
                          width: 16.w,
                        ),
                      ]),
                    )
                  ]).wh(210.w, 40.h),
              10.verticalSpace,
              // 2nd column LAST ROW
              const HStack([]),
            ]).scrollVertical(),
          ]).w(350.w),
    ).w(1.sw).hPCT(context: context, heightPCT: 16).onTap(() {
      context.push((context) => const PlaceOrder());
    });
  }
}

// class StackedWavesPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..shader = LinearGradient(colors: [
//         primaryColor,
//         primaryColor,
//       ]).createShader(Offset.zero & size);
//
//     final double waveWidth = size.width / 2;
//     final double waveHeight = size.height / 1.85;
//
//     final path = Path()
//       ..moveTo(0, waveHeight * 2)
//       ..quadraticBezierTo(waveWidth / 3.2, waveHeight - waveHeight / 3.5,
//           waveWidth, waveHeight * 1.5)
//       ..quadraticBezierTo(waveWidth * 1.5, waveHeight + waveHeight,
//           waveWidth * 2, waveHeight * 1.2)
//       ..lineTo(-size.width, -size.height * 10)
//       // ..lineTo(0, size.height)
//       ..close();
//
//     canvas.save();
//     canvas.drawPath(path, paint);
//     canvas.restore();
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//
// class StackedWavesPainter2 extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..shader = LinearGradient(colors: [
//         primaryColor,
//         primaryColor,
//       ]).createShader(Offset.zero & size);
//
//     final double waveWidth = size.width / 2;
//     final double waveHeight = size.height / 1.55;
//
//     final path = Path()
//       ..moveTo(0, waveHeight * 2)
//       ..quadraticBezierTo(waveWidth / 3.2, waveHeight - waveHeight / 3.5,
//           waveWidth, waveHeight * 1.5)
//       ..quadraticBezierTo(waveWidth * 1.5, waveHeight + waveHeight,
//           waveWidth * 2, waveHeight * 1.2)
//       ..lineTo(-size.width, -size.height * 10)
//       // ..lineTo(0, size.height)
//       ..close();
//
//     canvas.save();
//     canvas.drawPath(path, paint);
//     canvas.restore();
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
//
// // @override
// // void paint(Canvas canvas, Size size) {
// //   final paint = Paint()
// //     ..shader = LinearGradient(colors: [
// //       Colors.green,
// //       Colors.lightGreenAccent,
// //     ]).createShader(Offset.zero & size);
// //   final double side = 80;
// //   final double radius = 80;
// //
// //   final path = Path()
// //     ..moveTo(0, size.height / 2 + side)
// //     ..arcToPoint(Offset(side, size.height / 2),
// //         radius: Radius.circular(radius))
// //     ..lineTo(size.width - side, size.height / 2)
// //     ..arcToPoint(Offset(size.width, size.height / 2 - side),
// //         radius: Radius.circular(radius), clockwise: false)
// //     ..lineTo(size.width, size.height)
// //     ..lineTo(0, size.height)
// //     ..close();
// //
// //   canvas.save();
// //   canvas.drawPath(path, paint);
// //   canvas.restore();
// //
// //   canvas.save();
// //   canvas.translate(0, 100);
// //   canvas.drawPath(path, Paint()..color = Colors.white);
// //   canvas.restore();
// // }
// //
// // @override
// // bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
