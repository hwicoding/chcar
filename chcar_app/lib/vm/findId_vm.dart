import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FindIdVm extends GetxController {
  String phoneSelect = '010';
  String phonenewvalue = '';
  String emailSelect = 'naver.com';
  String emailnewvalue = '';
  String id = '';
  String name = '';
  String phone = '';
  String email = '';

  changePhone() {
    phoneSelect = phonenewvalue;
    update();
  }

  changeEmail() async {
    emailSelect = emailnewvalue;
    update();
  }

  findUserId() async {
    // HTTP POST 요청을 보내기 위해 http.post를 사용합니다.
    var url = Uri.parse('http://localhost:8080/Chcar/findId.jsp');
    var response = await http.post(
      url,
      body: {
        'name': name,
        'phone': phone,
        'email': email,
      },
    );
    // 서버로부터 받은 응답을 JSON으로 디코딩합니다.
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];
    print(result);

    if (result != '') {
      Get.defaultDialog(
        title: '회원님의 아이디는.',
        middleText: '$result 입니다.',
        actions: [TextButton(onPressed: () => Get.back(), child: Text('확인'))],
      );
    } else {
      Get.defaultDialog(
        title: '회원정보를 찾을 수 없습니다.',
        middleText: '회원정보를 다시 입력해주세요',
        actions: [TextButton(onPressed: () => Get.back(), child: Text('확인'))],
      );
    }
  }
}
