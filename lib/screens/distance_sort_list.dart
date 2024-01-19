import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paraiso/controllers/categories_controller.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/custom_chip.dart';
import 'package:paraiso/widgets/restaurant_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class DistanceSortList extends StatefulWidget {
  const DistanceSortList({Key? key}) : super(key: key);

  @override
  State<DistanceSortList> createState() => _DistanceSortListState();
}

class _DistanceSortListState extends State<DistanceSortList> {
  CategoriesController myController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return VxBlock(
      children: [
        HStack(alignment: MainAxisAlignment.spaceBetween, [
          Text(
            'Categories',
            style: TextStyle(
              color: const Color(0xFFE4E4E4),
              fontSize: 20.sp,
              fontFamily: 'Recoleta',
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFFBDBDBD),
                fontSize: 16.sp,
                fontFamily: 'Recoleta',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ]).pLTRB(36, 21, 26, 0),
        HStack(alignment: MainAxisAlignment.spaceBetween, [
          const SortByDistanceChip(index: 0, name: "Drinks"),
          9.horizontalSpace,
          const SortByDistanceChip(index: 1, name: "Fast Food"),
          9.horizontalSpace,
          const SortByDistanceChip(index: 2, name: "Cafe"),
          9.horizontalSpace,
          const SortByDistanceChip(index: 3, name: "Cafe"),
        ]).scrollHorizontal().pLTRB(30, 0, 26, 7),
        //   divider
        //   divider
        Divider(
          color: softBlack,
          thickness: 1,
        ),
        7.verticalSpace,
        const RestaurantTile(
          restaurantName: 'McDonalds',
          restaurantDescription: "Fast Food",
          distance: '.5 km',
          image: 'mcdonald.png',
        ),
        const RestaurantTile(
          restaurantName: 'Starbucks',
          restaurantDescription: "Cafe",
          distance: '1.0 km',
          image: 'starbucks.png',
        ),
        const RestaurantTile(
          restaurantName: 'Cannabis Shop',
          restaurantDescription: 'Drinks',
          distance: '1.2 km',
          image: 'cannabis.png',
        ),
      ],
    );
  }
}
