import 'package:get/get.dart';

class FindIdVm extends GetxController {
  String phoneSelecet = '010';
  String phonenewvalue = '';
  String emailSelecet = 'naver.com';
  String emailnewvalue = '';

  changePhone() {
    phoneSelecet = phonenewvalue;
    update();
  }

  changeEmail() {
    emailSelecet = emailnewvalue;
    update();
  }
}
