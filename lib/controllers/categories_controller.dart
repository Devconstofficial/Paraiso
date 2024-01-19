import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var activeChip = 10.obs;

  void setActiveChip(int index) {
    activeChip.value = index;
  }
}
