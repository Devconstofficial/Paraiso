import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paraiso/widgets/food_tile.dart';

class DiscountSortList extends StatelessWidget {
  const DiscountSortList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        31.verticalSpace,
        FoodTile(
          foodName: "Black Coffee",
          foodImage: "Restaurant sort by Discount_Rectangle 8_221_2830.png",
          restaurantName: "Starbucks",
          restaurantDistance: 1,
          discountPercentage: "-70%",
          othersOrdered: 12,
          restaurantImage: "starbucks.png",
          imgOthers2: "Restaurant sort by Discount_img-2_378_11538.png",
          imgOthers1: "Restaurant sort by Discount_img-3_378_11539.png",
          imgOthers3: "Restaurant sort by Discount_bg_378_11540.png",
        ),
        FoodTile(
          foodName: "Beef Burger",
          foodImage: "Restaurant sort by Discount_Rectangle 8_458_13269.png",
          restaurantName: "McDonalds",
          restaurantDistance: 0.5,
          discountPercentage: "-50%",
          othersOrdered: 12,
          restaurantImage: "mcdonald.png",
          imgOthers2: "Restaurant sort by Discount_img-2_378_11538.png",
          imgOthers1: "Restaurant sort by Discount_img-3_378_11539.png",
          imgOthers3: "Restaurant sort by Discount_bg_378_11540.png",
        ),
      ],
    );
  }
}
