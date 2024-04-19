import 'package:flutter/material.dart';

class Userinfoupdate extends StatefulWidget {
  const Userinfoupdate({super.key});

  @override
  State<Userinfoupdate> createState() => _UserinfoupdateState();
}

class _UserinfoupdateState extends State<Userinfoupdate> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late TextEditingController pwCheckController;
  late TextEditingController nameController;
  late TextEditingController nicknameController;
  late TextEditingController addressController;
  late TextEditingController phone1Controller;
  late TextEditingController phone2Controller;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    pwCheckController = TextEditingController();
    nameController = TextEditingController();
    nicknameController = TextEditingController();
    addressController = TextEditingController();
    phone1Controller = TextEditingController();
    phone2Controller = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          width: 150,
        ),
        backgroundColor: Color.fromARGB(255, 79, 139, 116),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 100,
              child: TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: '아이디를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: pwController,
                decoration: InputDecoration(
                  labelText: '비밀번호를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: '이름을 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: nicknameController,
                decoration: InputDecoration(
                  labelText: '닉네임을 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: '주소를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: phone1Controller,
                decoration: InputDecoration(
                  labelText: '번호를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '이메일을 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
              }, 
              child: Text('수정'),
              )
          ],
        ),
      ),
    );
  }
}
