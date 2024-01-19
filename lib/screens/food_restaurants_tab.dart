import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paraiso/screens/discount_sort_list.dart';
import 'package:paraiso/screens/distance_sort_list.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:velocity_x/velocity_x.dart';

class FoodRestaurantsTab extends StatefulWidget {
  const FoodRestaurantsTab({super.key});

  @override
  State<FoodRestaurantsTab> createState() => _FoodRestaurantsTabState();
}

class _FoodRestaurantsTabState extends State<FoodRestaurantsTab> {
  int foodIndex = 0;

  // bool _isActive = false;
  //
  // void _toggleSwitch() {
  //   setState(() {
  //     _isActive = !_isActive;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(physics: const ClampingScrollPhysics(), children: [
        // children of listview take full width so wrap in center to restore width and center
        ToggleSwitch(
          minWidth: 150.w,
          minHeight: 55.h,
          cornerRadius: 50.0,
          activeBgColors: [
            [primaryColor],
            [primaryColor]
          ],
          activeFgColor: onNeutralColor,
          inactiveBgColor: softBlack,
          inactiveFgColor: onNeutralColor,
          initialLabelIndex: foodIndex,
          totalSwitches: 2,
          labels: const ['Distance', 'Discount'],
          customTextStyles: [
            TextStyle(
              fontSize: 16.sp,
              color: onPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
            TextStyle(
              fontSize: 16.sp,
              color: onPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ],
          radiusStyle: true,
          onToggle: (index) {
            print('switched to: $index');
            setState(() {
              foodIndex = index!;
            });
          },
        )
            .w(
              308.w,
            )
            .centered(),
        IndexedStack(
          index: foodIndex,
          children: [
            DistanceSortList(),
            DiscountSortList(),
          ],
        ),
      ]),
    );

    // return GestureDetector(
    //   onTap: _toggleSwitch,
    //   child: Container(
    //     width: 70,
    //     height: 35,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       color: _isActive ? Colors.blue : Colors.grey,
    //     ),
    //     child: AnimatedContainer(
    //       duration: Duration(milliseconds: 200),
    //       curve: Curves.easeInOut,
    //       margin: EdgeInsets.only(left: _isActive ? 35 : 0),
    //       width: 30,
    //       height: 30,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(15),
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // );
  }
}
