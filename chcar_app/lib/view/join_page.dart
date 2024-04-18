import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  late TextEditingController idController;
  late TextEditingController pwController;
  late TextEditingController pwCheckController;
  late TextEditingController nameController;
  late TextEditingController nicknameController;
  late TextEditingController addressController;
  late TextEditingController phone1Controller;
  late TextEditingController phone2Controller;
  late TextEditingController emailController;
  late TextEditingController emailCheckController;
  var phone = ['010', '011', '012'];
  String phoneSelect = '010';
  var email = ['naver.com', 'gmail.com', 'daum.net', 'yahoo.com'];
  String emailSelect = 'naver.com';

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
    emailCheckController = TextEditingController();
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: TextField(
                      controller: idController,
                      decoration: InputDecoration(
                        labelText: '아이디를 입력하세요',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('중복확인'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 400,
              height: 50,
              child: TextField(
                controller: pwController,
                decoration: InputDecoration(
                  labelText: '비밀번호를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 400,
              height: 50,
              child: TextField(
                controller: pwCheckController,
                decoration: InputDecoration(
                  labelText: '비밀번호를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 400,
              height: 50,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: '이름를 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: TextField(
                      controller: nicknameController,
                      decoration: InputDecoration(
                        labelText: '닉네임을 입력하세요',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('중복확인'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 130,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('주소 찾기'))
              ],
            ),
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: TextField(
                decoration: InputDecoration(
              labelText: '상세 주소를 입력하세요',
              border: OutlineInputBorder(),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 89, 89, 89)),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        value: phoneSelect,
                        items: phone.map((String phone) {
                          return DropdownMenuItem(
                              value: phone,
                              child:
                                  Text(phone, style: TextStyle(fontSize: 20)));
                        }).toList(),
                        onChanged: (newvalue) {
                          phoneSelect = newvalue!;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    width: 140,
                    height: 50,
                    child: TextField(
                      controller: phone1Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    width: 140,
                    height: 50,
                    child: TextField(
                      controller: phone2Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: '이메일을 입력하세요',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                DropdownButton(
                  value: emailSelect,
                  items: email.map((String email) {
                    return DropdownMenuItem(
                      value: email,
                      child: Text(
                        email,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  onChanged: (newvalue) {
                    emailSelect = newvalue!;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                    controller: emailCheckController,
                    decoration: InputDecoration(
                      labelText: '이메일 인증번호를 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('인증 확인'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  joinComplete();
                },
                child: Text('회원가입')),
          )
        ],
      )),
    );
  }

  joinComplete() {
    Get.defaultDialog(
        title: '회원가입 완료',
        middleText: 'CHCAR의 회원이 되신것을 축하합니다!',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('확인'),
          )
        ]);
  }
}
