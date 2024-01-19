import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString _name = ''.obs;
  RxString _email = ''.obs;
  RxString _password = ''.obs;
  RxString _confirmPassword = ''.obs;
  RxString _phone = ''.obs;
  RxString _schoolName = ''.obs;

  // GETTERS
  String get name => _name.value;

  String get email => _email.value;

  String get password => _password.value;

  String get confirmPassword => _confirmPassword.value;

  String get phone => _phone.value;

  String get schoolName => _schoolName.value;

  // SETTERS
  set name(String value) => _name.value = value;

  set email(String value) => _email.value = value;

  set password(String value) => _password.value = value;

  set confirmPassword(String value) => _confirmPassword.value = value;

  set phone(String value) => _phone.value = value;

  set schoolName(String value) => _schoolName.value = value;
}
