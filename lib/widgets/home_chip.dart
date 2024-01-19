import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paraiso/util/theme/theme_constants.dart';
import 'package:paraiso/widgets/home_chips_row.dart';

class HomeChip extends StatelessWidget {
  final String name;
  final int index;

  const HomeChip({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
          onPressed: () {
            //   set root get controller and home tab = ""
            // Get.find<HomeTabsController>().setHomeTab(index);
            switch (index) {
              case 0:
                Get.find<HomeChipsController>().setActiveChip(index);
                break;
              case 1:
                Get.find<HomeChipsController>().setActiveChip(index);
                break;
              case 2:
                Get.find<HomeChipsController>().setActiveChip(index);
                break;
              default:
                Get.find<HomeChipsController>().setActiveChip(index);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: softBlack,
            foregroundColor: onNeutralColor,
            disabledBackgroundColor: softBlack,
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            side: BorderSide(
              color: Get.find<HomeChipsController>().activeChip.value == index
                  ? primaryColor
                  : softBlack,
              width: 1,
            ),
            shape: const StadiumBorder(),
            minimumSize: Size(100.w, 60.h),
          ),
          child: AutoSizeText(name)),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => ChoiceChip(
//         label: AutoSizeText(name),
//         labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//         selected: Get.find<HomeChipsController>().activeChip.value == index,
//         onSelected: (bool selected) {
//           switch (index) {
//             case 0:
//               Get.find<HomeChipsController>().setActiveChip(index);
//               break;
//             case 1:
//               Get.find<HomeChipsController>().setActiveChip(index);
//               break;
//             case 2:
//               Get.find<HomeChipsController>().setActiveChip(index);
//               break;
//           }
//         },
//         showCheckmark: false,
//         backgroundColor: softBlack,
//         selectedColor: softBlack,
//         labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
//               fontWeight: FontWeight.w700,
//               color: Get.find<HomeChipsController>().activeChip.value == index
//                   ? onNeutralColor
//                   : null,
//             ),
//         shape: StadiumBorder(
//           side: BorderSide(
//             color: Get.find<HomeChipsController>().activeChip.value == index
//                 ? primaryColor
//                 : Colors.transparent,
//             width: Get.find<HomeChipsController>().activeChip.value == index
//                 ? 5
//                 : 0,
//           ),
//         ),
//       ),
//     );
//   }
}
