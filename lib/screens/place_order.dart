import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paraiso/screens/order_status.dart';
import 'package:paraiso/widgets/icon_text_field.dart';
import 'package:paraiso/widgets/order_appbar.dart';
import 'package:paraiso/widgets/primary_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../util/theme/theme_constants.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  PlaceOrderCategoriesController placeOrderCategoriesController =
      Get.put(PlaceOrderCategoriesController());
  int number = 1;
  DateTime? _selectedDate = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrderAppBar(),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          //   image
          // Container(
          //         width: 380.w,
          //         padding: EdgeInsets.all(25.r),
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage("assets/images/place order.png"),
          //             fit: BoxFit.cover,
          //           ),
          //           borderRadius: BorderRadius.circular(50.r),
          //         ),
          //         child: Text(""))
          //     .marginAll(25.w)
          //     .hPCT(context: context, heightPCT: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(22.r),
            child: Image.asset(
              "assets/images/place order.png",
              fit: BoxFit.cover,
            ),
          ).hPCT(context: context, heightPCT: 32).marginAll(25.w),
          //about Food,

          Text(
            "About Food",
            style: context.titleLarge
                ?.copyWith(color: onPrimaryColor, fontWeight: FontWeight.bold),
          ).pLTRB(25.w, 0.h, 25.h, 25.h),

          //description
          AutoSizeText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: onPrimaryColor,
                      ),
                  maxLines: 2)
              .pLTRB(25.w, 0.h, 25.h, 25.h),
          //choose size
          HStack(
            alignment: MainAxisAlignment.spaceBetween,
            [
              Text(
                "Size",
                style: context.titleLarge?.copyWith(
                    color: onPrimaryColor, fontWeight: FontWeight.bold),
              ),
              4.horizontalSpace,
              //  choice chips flutter material 3 multiple
              HStack([
                const PlaceOrderChip(index: 0, name: "Small"),
                10.horizontalSpace,
                const PlaceOrderChip(index: 1, name: "Medium"),
                10.horizontalSpace,
                const PlaceOrderChip(index: 2, name: "Large"),
              ])
            ],
          ).pLTRB(25.w, 0.h, 25.w, 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity",
                style: context.titleLarge?.copyWith(
                    color: onPrimaryColor, fontWeight: FontWeight.bold),
              ),
              //  choice chips flutter material 3 multiple
              HStack([
                //   minus btn
                ElevatedButton(
                    // no content padding style
                    style: ElevatedButton.styleFrom(
                      primary: softBlack,
                      foregroundColor: onPrimaryColor,
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      setState(() {
                        if (number > 1) {
                          number--;
                        }
                      });
                    },
                    child: const Icon(Icons.remove)),
                8.horizontalSpace,
                //   nmbr
                Text(
                  "$number",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                8.horizontalSpace,
                //  plus button
                ElevatedButton(
                    // no content padding style
                    style: ElevatedButton.styleFrom(
                      primary: softBlack,
                      foregroundColor: onPrimaryColor,
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      setState(() {
                        number++;
                      });
                    },
                    child: const Icon(Icons.add)),
              ])
            ],
          ).pLTRB(25.w, 0.h, 10.h, 25.h),
          //promo code
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Promo Code",
                style: context.titleLarge?.copyWith(
                    color: onPrimaryColor, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: softBlack,
                    foregroundColor: onPrimaryColor,
                    padding: EdgeInsets.zero,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    //dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Theme(
                          data: Theme.of(context)
                              .copyWith(dialogBackgroundColor: Colors.orange),
                          child: AlertDialog(
                            title:
                                const Center(child: Text("Enter Promo Code")),
                            content: const CustomTextField(
                              hintText: "Enter Promo Code",
                            ),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: softBlack,
                                    foregroundColor: onPrimaryColor,
                                    // minimumSize: Size(112.w, 60.h),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                    foregroundColor: onPrimaryColor,
                                    // minimumSize: Size(112.w, 60.h),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Submit")),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text("Use")),
            ],
          ).pLTRB(25.w, 0.h, 25.h, 25.h),
          // https://stackoverflow.com/questions/63714939/date-picker-with-spinner-design-in-flutter
          // CupertinoPicker(
          //   magnification: 1.5,
          //   itemExtent: 50,
          //   looping: true,
          //   onSelectedItemChanged: (int value) {},
          //   children: [Text("asdas")],
          // ),
          //food pickup time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Food Pickup Time",
                style: context.titleLarge?.copyWith(
                    color: onPrimaryColor, fontWeight: FontWeight.bold),
              ),
              //  choice chips flutter material 3 multiple
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: neutralColor,
                            title: const Center(child: Text("Select Time")),
                            content: Container(
                              height: 200.h,
                              width: 300.w,
                              color: softBlack,
                              child:
//                               DatePickerWidget(
//                                 looping: false,
//                                 // default is not looping
//                                 firstDate: DateTime.now(),
//                                 //DateTime(1960),
//                                 //  lastDate: DateTime(2002, 1, 1),
// //              initialDate: DateTime.now(),// DateTime(1994),
//                                 dateFormat:
//                                     // "MM-dd(E)",
//                                     // "dd/MMMM/yyyy",
//                                     //hours/minutes/seconds and am/pm
//                                     "hh:mm:ss a",
//                                 // locale: DatePicker.localeFromString('th'),
//                                 onChange: (DateTime newDate, _) {
//                                   setState(() {
//                                     _selectedDate = newDate;
//                                   });
//                                   print(_selectedDate);
//                                 },
//                                 pickerTheme: DateTimePickerTheme(
//                                   backgroundColor: softBlack,
//                                   itemTextStyle: TextStyle(
//                                       color: Colors.white, fontSize: 19),
//                                   dividerColor: softGray,
//                                 ),
//                               ),

                                  CupertinoDatePicker(
                                backgroundColor: Colors.transparent,
                                mode: CupertinoDatePickerMode.time,
                                initialDateTime: DateTime.now(),
                                onDateTimeChanged: (DateTime newDateTime) {
                                  print(newDateTime);
                                },
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: softBlack,
                                    foregroundColor: onPrimaryColor,
                                    // minimumSize: Size(112.w, 60.h),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                    foregroundColor: onPrimaryColor,
                                    // minimumSize: Size(112.w, 60.h),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Submit")),
                            ],
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: softBlack,
                    foregroundColor: onPrimaryColor,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("Select Time"))
            ],
          ).pLTRB(25.w, 0.h, 25.h, 25.h),
          //total price row section place order button
          Container(
            height: 150.h,
            width: 380.w,
            padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 40.h),
            decoration: BoxDecoration(
              color: softBlack,
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VStack(alignment: MainAxisAlignment.center, [
                  Row(
                    children: [
                      Baseline(
                        baseline: 10.h,
                        baselineType: TextBaseline.alphabetic,
                        child: Text("\$", style: context.headlineMedium),
                      ),
                      Text("12.00", style: context.headlineLarge),
                    ],
                  ),
                  Text("Total Price", style: context.titleSmall).px(14.w),
                ]),
                PrimaryButton(
                  text: "Place Order",
                  onPressed: () {
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
                                    SvgPicture.asset(
                                        "assets/images/order placed.svg"),
                                    30.verticalSpace,
                                    Text("Order Placed",
                                        style: context.headlineSmall?.copyWith(
                                          color: onPrimaryColor,
                                        )),
                                    Text(
                                        "Your order has been placed successfully",
                                        textAlign: TextAlign.center,
                                        style: context.titleLarge)
                                  ]),
                              actions: [
                                PrimaryButton(
                                    icon: Icons.arrow_forward_ios,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderStatus()));
                                    },
                                    text: "Order Status"),
                              ],
                            ));
                  },
                ).wh(164.w, 60.h)
              ],
            ),
          ).marginOnly(
            bottom: 25.h,
            left: 25.w,
            right: 25.w,
          ),
        ],
      ),
    );
  }
}

class PlaceOrderCategoriesController extends GetxController {
  RxInt activeChip = 0.obs;

  void setActiveChip(int index) {
    activeChip.value = index;
  }
}

class PlaceOrderChip extends StatelessWidget {
  final int index;
  final String name;

  const PlaceOrderChip({Key? key, required this.index, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: () {
          switch (index) {
            case 0:
              Get.find<PlaceOrderCategoriesController>().setActiveChip(index);
              break;
            case 1:
              Get.find<PlaceOrderCategoriesController>().setActiveChip(index);
              break;
            case 2:
              Get.find<PlaceOrderCategoriesController>().setActiveChip(index);
              break;
            default:
              Get.find<PlaceOrderCategoriesController>().setActiveChip(index);
          }
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          backgroundColor:
              Get.find<PlaceOrderCategoriesController>().activeChip.value ==
                      index
                  ? primaryColor
                  : softBlack,
          foregroundColor: onNeutralColor,
          disabledBackgroundColor: softBlack,
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          // side: BorderSide(
          //   color: Get.find<PlaceOrderCategoriesController>().activeChip.value == index
          //       ? primaryColor
          //       : Colors.transparent,
          //   width: 1,
          // ),
          shape: const StadiumBorder(),
          maximumSize: Size(115.w, 55.h),
        ),
        child: AutoSizeText(
          name,
          maxLines: 1,
        ),
      ),
    );
  }
}
