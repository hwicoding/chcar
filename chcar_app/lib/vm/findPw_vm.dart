import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class FindPwVm extends ChangeNotifier {
  String _phoneSelect = '010';
  String _emailSelect = 'naver.com';
  String id = '';
  String name = '';
  String phone = '';
  String email = '';

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

  findUserPw() async {
    // HTTP POST 요청을 보내기 위해 http.post를 사용합니다.
    var url = Uri.parse('http://localhost:8080/Chcar/findPw.jsp');
    var response = await http.post(
      url,
      body: {
        'id': id,
        'name': name,
        'phone': phone,
        'email': email,
      },
    );
    // 서버로부터 받은 응답을 JSON으로 디코딩합니다.
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];

    if (result != '') {
      Get.defaultDialog(
        title: '회원님의 비밀번호는.',
        middleText: '$result 입니다.',
        actions: [TextButton(onPressed: () => Get.back(), child: Text('확인'))],
      );
    } else {
      Get.defaultDialog(
        title: '회원 정보를 찾을 수 없습니다.',
        middleText: '회원정보를 다시 입력해주세요',
        actions: [TextButton(onPressed: () => Get.back(), child: Text('확인'))],
      );
    }
  }
}
