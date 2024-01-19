import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paraiso/widgets/home_chips_row.dart';
import 'package:paraiso/widgets/nav_bottom_bar.dart';

import '../widgets/app_bar_custom.dart';

class ScaffoldWithNav extends StatefulWidget {
  final Widget child;

  const ScaffoldWithNav({Key? key, required this.child}) : super(key: key);

  @override
  State<ScaffoldWithNav> createState() => _ScaffoldWithNavState();
}

class _ScaffoldWithNavState extends State<ScaffoldWithNav> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // put any controllers inside scaffold with nav that need
    // to be accessed cross routes
    HomeChipsController myHomeChipsController = Get.put(HomeChipsController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: widget.child,
      // CustomScrollView(
      //   slivers: [
      //     SliverPersistentHeader(
      //       delegate: CustomAppBarDelegate(
      //         minHeight: 137,
      //         maxHeight: 200,
      //         child: AppBarCustom(),
      //       ),
      //       pinned: true,
      //     ),

      // SliverToBoxAdapter(
      //     child: ConstrainedBox(
      //         constraints: BoxConstraints(maxHeight: 1.sh),
      //         child: widget.child)),
      // SliverList(
      //   delegate: SliverChildBuilderDelegate(
      //         (BuildContext context, int index) {
      //       return ListTile(title: Text('Item $index'));
      //     },
      //     childCount: 50,
      //   ),
      // ),
      // ],
      // ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(CustomAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
