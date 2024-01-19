import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paraiso/screens/friends_list.dart';
import 'package:paraiso/screens/home_all_list.dart';
import 'package:paraiso/screens/home_restaurants_list.dart';
import 'package:paraiso/widgets/home_chips_row.dart';

class HomeTabView extends StatefulWidget {
  // final Widget child;
  // final String path;

  const HomeTabView({
    super.key,
    // required this.child,
    // required this.path
  });

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final myHomeChipsController = Get.find<HomeChipsController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(physics: const ClampingScrollPhysics(), children: [
        const HomeChipsRow(),
        21.verticalSpace,
        Obx(
          () => IndexedStack(
            index: myHomeChipsController.activeChip.value,
            children: [
              // const HomeRestaurantsTab(),
              const HomeRestaurantsList(),
              const HomeFriendsList(),
              const HomeAllList(),
            ],
          ),
        ),
      ]),
    );
  }
}
