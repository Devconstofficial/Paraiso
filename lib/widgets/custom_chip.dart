import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paraiso/controllers/categories_controller.dart';
import 'package:paraiso/util/theme/theme_constants.dart';

class SortByDistanceChip extends StatelessWidget {
  final int index;
  final String name;

  const SortByDistanceChip({Key? key, required this.index, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: () {
          switch (index) {
            case 0:
              Get.find<CategoriesController>().setActiveChip(index);
              break;
            case 1:
              Get.find<CategoriesController>().setActiveChip(index);
              break;
            case 2:
              Get.find<CategoriesController>().setActiveChip(index);
              break;
            default:
              Get.find<CategoriesController>().setActiveChip(index);
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
            color: Get.find<CategoriesController>().activeChip.value == index
                ? primaryColor
                : softBlack,
            width: 1,
          ),
          shape: const StadiumBorder(),
          minimumSize: Size(100.w, 60.h),
        ),
        child: AutoSizeText(name),
      ),
    );
  }
}
