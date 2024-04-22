import 'dart:convert';
import 'package:chcar_app/view/findId.dart';
import 'package:chcar_app/view/findPw.dart';
import 'package:chcar_app/view/join_page.dart';
import 'package:chcar_app/view/main_page.dart';
import 'package:chcar_app/vm/findPw_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final login = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset(
                'images/logo_green.png',
                width: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: '아이디를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: pwController,
                decoration: InputDecoration(
                  labelText: '비밀번호를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  blankCheck();
                },
                child: Text('로그인')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => Get.to(Join()), child: Text('회원가입')),
                Text('|'),
                TextButton(
                    onPressed: () => Get.to(FindId()), child: Text('아이디 찾기')),
                Text('|'),
                TextButton(
                    onPressed: () => Get.to(ChangeNotifierProvider(
                        create: (context) => FindPwVm(), child: FindPw())),
                    child: Text('비밀번호 찾기')),
              ],
            )
          ],
        ),
      ),
    );
  }

  blankCheck() {
    if (idController.text.isEmpty && pwController.text.isEmpty) {
      Get.snackbar('로그인 오류.', '아이디 또는 비밀번호를 입력하세요',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      loginCheck();
    }
  }

  loginCheck() async {
    String id = idController.text;
    String pw = pwController.text;

    // HTTP POST 요청을 보내기 위해 http.post를 사용합니다.
    var url = Uri.parse('http://localhost:8080/Chcar/LoginCheck.jsp');
    var response = await http.post(
      url,
      body: {
        'id': id,
        'pw': pw,
      },
    );
    // 서버로부터 받은 응답을 JSON으로 디코딩합니다.
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];

    if (result == '1') {
      // GetStorage에 저장
      login.write('userid', id);
      Get.to(const MainPage());
    } else {
      Get.snackbar('로그인 오류.', '아이디 또는 비밀번호를 확인하세요',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
