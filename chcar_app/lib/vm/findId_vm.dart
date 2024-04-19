import 'package:get/get.dart';

class FindIdVm extends GetxController {
  String phoneSelect = '010';
  String phonenewvalue = '';
  String emailSelect = 'naver.com';
  String emailnewvalue = '';

  changePhone() {
    phoneSelect = phonenewvalue;
    update();
  }

  changeEmail() {
    emailSelect = emailnewvalue;
    update();
  }
}
