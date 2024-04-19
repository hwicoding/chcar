import 'package:flutter/material.dart';

class FindPwVm extends ChangeNotifier {
  String _phoneSelect = '010';
  String _emailSelect = 'naver.com';

  String get phoneSelect => _phoneSelect;
  String get emailSelect => _emailSelect;

  changePhone(newvalue) {
    _phoneSelect = newvalue;
    notifyListeners();
  }

  changeEmail(newvalue) {
    _emailSelect = newvalue;
    notifyListeners();
  }
}
