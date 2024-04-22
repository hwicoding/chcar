import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:remedi_kopo/remedi_kopo.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  final _key = GlobalKey<FormState>();

  late String _verificationId;

  // 텍스트 필드 사용을 위해 작성
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
  late TextEditingController phoneCheckController;
  late TextEditingController emailController;

  // 드롭다운을 위해 작성
  var phone = ['010', '011', '012'];
  String phoneSelect = '010';
  var email = ['naver.com', 'gmail.com', 'daum.net', 'yahoo.com'];
  String emailSelect = 'naver.com';

  // 주소찾기 API 사용을 위해 작성
  late GlobalKey<FormState> _formKey;
  Map<String, String> formData = {};

  // 비밀번호 확인용
  late String passwordCheck;
  late Color passwordColor;

  // 회원가입 절차 확인용
  late bool useridCheck;
  late bool pwCheck;
  late bool usernicknameCheck;
  late bool userphoneCheck;

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
    phoneCheckController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    passwordCheck = '확인용 비밀번호를 입력해주세요';
    passwordColor = Colors.black45;

    useridCheck = false;
    pwCheck = false;
    usernicknameCheck = false;
    userphoneCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          width: 150,
        ),
        backgroundColor: const Color.fromARGB(255, 79, 139, 116),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextField(
                        controller: idController,
                        decoration: InputDecoration(
                          labelText: '아이디를 입력하세요',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        idCheck();
                      },
                      child: const Text('중복확인'))
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
                  onChanged: (value) {
                    if (pwController.text != pwCheckController.text) {
                      passwordCheck = '입력하신 비밀번호가 다릅니다. 다시 입력해주세요';
                      passwordColor = const Color.fromARGB(255, 255, 17, 0);
                    } else {
                      passwordCheck = '비밀번호가 정상적으로 입력되었습니다.';
                      passwordColor = Color.fromARGB(255, 0, 107, 4);
                      pwCheck = true;
                    }
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: '비밀번호를 한번 더 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Text(
              passwordCheck,
              style: TextStyle(color: passwordColor),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 400,
                height: 50,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: '이름을 입력하세요',
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
                  ElevatedButton(
                      onPressed: () {
                        nicknameCheck();
                      },
                      child: Text('중복확인'))
                ],
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: TextField(
                                controller: address1Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 12, 12, 12),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: TextField(
                                maxLines: 20,
                                controller: address2Controller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12, 12, 12, 12),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: SizedBox(
                            width: 280,
                            height: 50,
                            child: TextField(
                                controller: address3Controller,
                                decoration: InputDecoration(
                                  labelText: '상세 주소를 입력하세요',
                                  border: OutlineInputBorder(),
                                )),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _searchAddress(context);
                            },
                            child: Text('주소찾기'))
                      ],
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: SizedBox(
                      width: 200,
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
                    width: 180,
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
                ],
              ),
            ),
            Form(
                key: _key,
                child: Column(
                  children: [
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
                      child: ElevatedButton(
                          onPressed: () {
                            phoneCheck();
                          },
                          child: Text('인증번호 전송')),
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
                              controller: phoneCheckController,
                              decoration: InputDecoration(
                                labelText: '인증번호를 입력하세요',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: ElevatedButton(
                                onPressed: () {
                                  phoneCheckverify();
                                },
                                child: Text('인증확인')),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                  onPressed: () {
                    joinComplete();
                  },
                  child: Text('회원가입')),
            )
          ],
        )),
      ),
    );
  }

  joinComplete() {
    if (useridCheck &&
        pwCheck &&
        usernicknameCheck &&
        userphoneCheck &&
        nameController.text.isNotEmpty &&
        address1Controller.text.isNotEmpty &&
        address2Controller.text.isNotEmpty &&
        address3Controller.text.isNotEmpty &&
        phone1Controller.text.isNotEmpty &&
        phone2Controller.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      insertUserInfo();
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
    } else if (useridCheck == false || usernicknameCheck == false) {
      Get.snackbar('회원가입에 실패했습니다.', '중복 체크를 진행해 주세요.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } else if (userphoneCheck == false) {
      Get.snackbar('회원가입에 실패했습니다.', '전화번호 인증을 진행해 주세요.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('회원가입에 실패했습니다.', '입력하지 않은 항목이 있는지 확인해주세요.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
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

  _searchAddress(BuildContext context) async {
    KopoModel? model = await Get.to(RemediKopo());

    if (model != null) {
      final postcode = model.zonecode ?? '';
      address1Controller.value = TextEditingValue(
        text: postcode,
      );
      formData['postcode'] = postcode;

      final address = model.address ?? '';
      address2Controller.value = TextEditingValue(
        text: address,
      );
      formData['address'] = address;

      final buildingName = model.buildingName ?? '';
      address3Controller.value = TextEditingValue(
        text: buildingName,
      );
      formData['address_detail'] = buildingName;
    }
  }

  idCheck() async {
    String id = idController.text;
    // HTTP POST 요청을 보내기 위해 http.post를 사용합니다.
    var url = Uri.parse('http://localhost:8080/Chcar/IdCheck.jsp');
    var response = await http.post(
      url,
      body: {
        'id': id,
      },
    );
    // 서버로부터 받은 응답을 JSON으로 디코딩합니다.
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];

    if (result == '1') {
      Get.snackbar('중복된 아이디가 존재합니다.', '다른 아이디를 입력하세요',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('사용 가능한 아이디 입니다.', '회원가입을 진행해주세요.',
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      useridCheck = true;
    }
  }

  nicknameCheck() async {
    String nickname = nicknameController.text;
    // HTTP POST 요청을 보내기 위해 http.post를 사용합니다.
    var url = Uri.parse('http://localhost:8080/Chcar/nicknameCheck.jsp');
    var response = await http.post(
      url,
      body: {
        'nickname': nickname,
      },
    );
    // 서버로부터 받은 응답을 JSON으로 디코딩합니다.
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];

    if (result == '1') {
      Get.snackbar('중복된 닉네임이 존재합니다.', '다른 닉네임을 입력하세요',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('사용 가능한 닉네임 입니다.', '회원가입을 진행해주세요.',
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      usernicknameCheck = true;
    }
  }

  phoneCheck() async {
    if (_key.currentState!.validate()) {
      FirebaseAuth auth = FirebaseAuth.instance;

      await auth.verifyPhoneNumber(
        phoneNumber:
            '+82' + phoneSelect + phone1Controller.text + phone2Controller.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Android only

          await auth
              .signInWithCredential(credential)
              .then((_) => Navigator.pushNamed(context, "/"));
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('전화번호 인증이 실패하였습니다.', '전화번호를 다시 입력해주세요.',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM);
          }
        },
        codeSent: (String verificationId, forceResendingToken) async {
          setState(() {
            _verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) {
          Get.snackbar('전화번호 인증이 실패하였습니다.', '전화번호 인증을 다시 해주세요.',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        },
      );
    }
  }

  phoneCheckverify() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: phoneCheckController.text);

    await auth.signInWithCredential(credential).then((_) {
      Get.snackbar('전화번호 인증이 완료되었습니다.', '회원가입을 진행해주세요.',
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      userphoneCheck = true;
    }).catchError((error) {
      Get.snackbar('전화번호 인증이 실패하였습니다.', '전화번호 인증을 다시 해주세요.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
