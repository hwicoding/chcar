import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

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
  late TextEditingController address1Controller;
  late TextEditingController address2Controller;
  late TextEditingController address3Controller;
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
    address1Controller = TextEditingController();
    address2Controller = TextEditingController();
    address3Controller = TextEditingController();
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
                      controller: address1Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                    ),
                  ),
                ),
                SizedBox(
                  width: 170,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: TextField(
                      controller: address2Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text('주소찾기'))
              ],
            ),
          ),
          SizedBox(
            width: 400,
            height: 50,
            child: TextField(
                controller: address3Controller,
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
                      child: Center(
                        child: DropdownButton(
                          underline: SizedBox(),
                          value: phoneSelect,
                          items: phone.map((String phone) {
                            return DropdownMenuItem(
                                value: phone,
                                child: Text(phone,
                                    style: TextStyle(fontSize: 15)));
                          }).toList(),
                          onChanged: (newvalue) {
                            phoneSelect = newvalue!;
                            setState(() {});
                          },
                        ),
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
                    width: 150,
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
                Container(
                  width: 130,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 89, 89, 89)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: emailSelect,
                      items: email.map((String email) {
                        return DropdownMenuItem(
                          value: email,
                          child: Text(
                            email,
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (newvalue) {
                        emailSelect = newvalue!;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(onPressed: () {}, child: Text('인증하기')),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 280,
                  height: 50,
                  child: TextField(
                    controller: emailCheckController,
                    decoration: InputDecoration(
                      labelText: '이메일 인증번호를 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(onPressed: () {}, child: Text('인증확인')),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  insertUserInfo();
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
              Get.back();
            },
            child: Text('확인'),
          )
        ]);
  }

  insertUserInfo() async {
    String id = idController.text;
    String pw = pwController.text;
    String name = nameController.text;
    String nickname = nicknameController.text;
    String address = address1Controller.text +
        address2Controller.text +
        address3Controller.text;
    String phone = phoneSelect + phone1Controller.text + phone2Controller.text;
    String email = emailController.text + '@' + emailSelect;

    // HTTP POST 요청을 보내기 위해 http.post를 사용합니다.
    var url = Uri.parse('http://localhost:8080/Chcar/InsertUser.jsp');
    var response = await http.post(
      url,
      body: {
        'id': id,
        'pw': pw,
        'name': name,
        'nickname': nickname,
        'address': address,
        'phone': phone,
        'email': email,
      },
    );
    // 서버로부터 받은 응답을 JSON으로 디코딩합니다.
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];
    print(result);
  }
}
