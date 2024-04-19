import 'package:chcar_app/view/findId.dart';
import 'package:chcar_app/view/findPw.dart';
import 'package:chcar_app/view/join_page.dart';
import 'package:chcar_app/view/main_page.dart';
import 'package:chcar_app/vm/findPw_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

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
                onPressed: () => Get.to(MainPage()), child: Text('로그인')),
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
}
