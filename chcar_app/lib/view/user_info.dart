import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../vm/user_info_controller.dart';

class Userinfoupdate extends StatefulWidget {
  Userinfoupdate({super.key});

  @override
  State<Userinfoupdate> createState() => _UserinfoupdateState();
  final UserinfoController controller = Get.put(UserinfoController());
}

class _UserinfoupdateState extends State<Userinfoupdate> {
  // 텍스트 필드 사용을 위해 작성
  late List<Map<String, dynamic>> data;
  late TextEditingController idController;
  late TextEditingController pwController;
  late TextEditingController pwCheckController;
  late TextEditingController nameController;
  late TextEditingController nicknameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late GlobalKey<ScaffoldState> _scaffoldKey; // GlobalKey 추가

  // 드롭다운을 위해 작성
  var phone = ['010', '011', '012'];
  String phoneSelect = '010';
  var email = ['naver.com', 'gmail.com', 'daum.net', 'yahoo.com'];
  String emailSelect = 'naver.com';

  // 주소찾기 API 사용을 위해 작성
  late GlobalKey<FormState> _formKey;
  Map<String, String> formData = {};

  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
    pwCheckController = TextEditingController();
    nameController = TextEditingController();
    nicknameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    data = [];
  }

  // getJsonData() async {
  //   var url =
  //       Uri.parse('http://localhost:8080/flutter/jsp/userinfo_update.jsp');
  //   var response = await http.get(url);
  //   var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
  //   List result = dataConvertedJson['results'];
  //   data.addAll(result);
  //   setState(() {});
  // }

  getJsonData() async {
    var url = Uri.parse('http://localhost:8080/Chcar/JSP/userinfo.jsp');
    var response = await http.get(url);
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List<Map<String, dynamic>> result =
        List<Map<String, dynamic>>.from(dataConvertedJson['results']);
    data.clear();
    data.addAll(result);
  }

  @override
  Widget build(BuildContext context) {
    final login = GetStorage();
    //final UserinfoController controller1 = Get.put(UserinfoController());
    // print('실행되고 있음? : $controller1');
    // controller1.getJSONData();

    return Scaffold(
      key: _scaffoldKey,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              GetBuilder<UserinfoController>(
                builder: (controller) {
                  return Center(
                    child: controller.data.isEmpty
                        ? const CircularProgressIndicator()
                        : Column(
                            children: controller.data.map((idData) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ID: ',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '이름: ',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 30),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${login.read('userid')}',
                                          style: TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                        Text(
                                          idData['user_name'],
                                          style: TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                  );
                },
              ),
              const Divider(),
              GetBuilder<UserinfoController>(
                // 디테일 컨트롤러 GetBuilder
                builder: (controller) {
                  // 빌더 함수
                  return SizedBox(
                    height: 500,
                    child: Center(
                      // 중앙 정렬
                      child: controller.data.isEmpty // 조건부 빌더
                          ? const CircularProgressIndicator() // 조건이 참일 때: 로딩 중 표시
                          : ListView.builder(
                              shrinkWrap: true,
                              // 리스트뷰 빌더 사용
                              itemCount: controller.data.length, // 아이템 개수
                              itemBuilder: (context, index) {
                                // 아이템 빌더
                                var colorData =
                                    controller.data[index]; // 현재 인덱스의 데이터
                                return SizedBox(
                                  child: Column(
                                    // 컬럼 위젯
                                    children: [
                                      buildTextFieldRow(
                                          'pw: ', colorData['user_pw'], 140),
                                      buildTextFieldRow(
                                          'pw확인: ', colorData['user_pw'], 140),
                                      buildTextFieldRow('닉네임: ',
                                          colorData['user_nickname'], 140),
                                      buildTextFieldRow('전화번호: ',
                                          colorData['user_phone'], 140),
                                      buildTextFieldRow('주소: ',
                                          colorData['user_address'], 140),
                                      buildTextFieldRow('이메일: ',
                                          colorData['user_email'], 140),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      updateComplete();
                    },
                    child: Text('수정'),
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center, // 버튼 가운데 정렬
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  updateComplete() {
    Get.defaultDialog(
        title: '수정완료',
        middleText: '확인을 누르시면 메인화면으로 돌아갑니다.',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
              Get.back();
            },
            child: Text('확인'),
          )
        ]);
  }

  // updateComplete() async {
  //   String password = pwController.text;
  //   String nickname = nicknameController.text;
  //   String phone = phoneController.text;
  //   String address = addressController.text;
  //   String email = emailController.text;

  //   var url = Uri.parse('http://localhost:8080/Chcar/InsertUser.jsp');
  //   var response = await http.post(
  //     url,
  //     body: {
  //       'password': password,
  //       'nickname': nickname,
  //       'phone': phone,
  //       'address': address,
  //       'email': email,
  //     },
  //   );

  //   var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
  //   var result = dataConvertedJson['result'];
  //   print(result);
  // }

  Widget buildTextFieldRow(
      String labelText, String initialValue, double textFieldWidth) {
    bool obscureText = labelText.contains('pw');
    late TextEditingController textEditingController;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$labelText ',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            width: labelText == '전화번호: ' || labelText == '이메일: '
                ? double.infinity // 전화번호와 이메일의 경우 가로로 늘립니다.
                : textFieldWidth,
            child: TextField(
              controller: TextEditingController(
                text: initialValue,
              ), // 초기값 설정
              textAlign: TextAlign.left,
              onChanged: (value) {
                // 값이 변경되었을 때
                // 여기에 변경된 값 처리 로직을 추가할 수 있습니다.
              },
              obscureText: obscureText,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsets.all(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
