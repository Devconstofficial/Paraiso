import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  // final hiddenNavBarRoutes = <String>[].obs;
  final RxString _navBarLastActive = "".obs;
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;
  String get getNavBarLastActive => _navBarLastActive.value;

// METHODS
  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  void setNavBarLastActive(String path) {
    _navBarLastActive.value = path;
  }













}