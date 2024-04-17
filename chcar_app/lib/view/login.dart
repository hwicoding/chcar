import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  late TextEditingController idController = TextEditingController();
  late TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            ElevatedButton(onPressed: () {}, child: Text('로그인'))
          ],
        ),
      ),
    );
  }
}
