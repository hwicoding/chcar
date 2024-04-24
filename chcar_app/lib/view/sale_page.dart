import 'dart:io';

import 'package:chcar_app/vm/sale_page_controller.dart';
import 'package:flutter/material.dart'; // 플러터 UI 관련 라이브러리 임포트
import 'package:get/get.dart'; // GetX 상태 관리 라이브러리 임포트
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart'; // 이미지 피커 라이브러리 임포트대 경로로 디테일 페이지 컨트롤러 임포트

// ignore: use_key_in_widget_constructors
class SalePage extends StatelessWidget {
  // 판매 페이지 위젯 정의
  final SaleController controller =
      Get.put(SaleController()); // 디테일 컨트롤러를 가져와서 사용
  final picker = ImagePicker(); // 이미지 피커 인스턴스 생성
  final login = GetStorage();

  @override
  Widget build(BuildContext context) {
    // 위젯 빌드 함수
    return Scaffold(
      // 스캐폴드 위젯으로 전체 레이아웃 구성
      appBar: AppBar(
        // 앱 바 정의
        title: Image.asset(
          // 이미지 로고 표시
          'images/logo.png',
          width: 150,
        ),
        backgroundColor: const Color.fromARGB(255, 79, 139, 116), // 배경색 설정
        iconTheme: const IconThemeData(color: Colors.white), // 아이콘 테마 설정
      ),
      body: SingleChildScrollView(
        // 스크롤 가능한 뷰
        child: Column(
          // 컬럼으로 자식 위젯 배치
          children: [
            // 자식 위젯 목록
            GetBuilder<SaleController>(
              // GetX 상태 관리를 위한 빌더
              builder: (controller) {
                // 빌더 함수
                return SizedBox(
                  // 크기 조절 가능한 박스 위젯
                  height: 800, // 높이 설정
                  child: controller.savedValues.isEmpty // 데이터가 비어있으면
                      ? const CircularProgressIndicator() // 로딩 중 표시
                      : ListView.builder(
                          // 리스트 뷰 빌더로 아이템 표시
                          shrinkWrap: true,
                          itemCount: 1, // 아이템 개수 설정
                          // itemCount: controller.savedValues.length, // 아이템 개수 설정
                          itemBuilder: (context, index) {
                            return Padding(
                              // 위젯 간격을 주기 위해 패딩 추가
                              padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                              child: SizedBox(
                                // 크기 조절 가능한 박스 위젯
                                child: Column(
                                  // 컬럼으로 자식 위젯 배치
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      // 가로로 자식 위젯 배치
                                      children: [
                                        buildTextFieldRow(
                                            '브랜드', controller.savedValues[0]),
                                        const SizedBox(width: 80), // 가로 간격 설정
                                        buildTextFieldRow(
                                            '모델', controller.savedValues[1]),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 500,
                                      child: Divider(
                                        height: 5,
                                        // indent: 40,
                                        endIndent: 40,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        buildTextFieldRow(
                                            '판매자', login.read("usernickname")),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        buildTextFieldRow('주행거리(km)',
                                            controller.savedValues[6]),
                                        // buildTextFieldRow(
                                        //     '주행거리(km)',
                                        //     int.parse(carData[7])
                                        //         .toStringAsFixed(0)),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 500,
                                      child: Divider(
                                        height: 5,
                                        // indent: 40,
                                        endIndent: 40,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        buildTextFieldRow(
                                            '연도', controller.savedValues[3]),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        buildTextFieldRow(
                                            '색상', controller.savedValues[2]),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 500,
                                      child: Divider(
                                        height: 5,
                                        // indent: 40,
                                        endIndent: 40,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        buildTextFieldRow(
                                            '연료유형', controller.savedValues[7]),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        buildTextFieldRow(
                                            '변속기유형', controller.savedValues[8]),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 500,
                                      child: Divider(
                                        height: 5,
                                        // indent: 40,
                                        endIndent: 40,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        buildTextFieldRow('차량연비(L/100km)',
                                            controller.savedValues[5]),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        buildTextFieldRow('차량마력(kW)',
                                            controller.savedValues[4]),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 500,
                                      child: Divider(
                                        height: 5,
                                        // indent: 40,
                                        endIndent: 40,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 0, 20),
                                      child: Text(
                                        '차량 설명',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 220,
                                      width: 360,
                                      child: TextField(
                                        controller:
                                            TextEditingController(), // 초기값 설정
                                        onChanged: (value) {
                                          // 값이 변경되었을 때
                                          // 여기에 변경된 값 처리 로직을 추가할 수 있습니다.
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          // contentPadding: EdgeInsets.symmetric(
                                          //     vertical: 20.0),
                                        ),
                                        keyboardType: TextInputType
                                            .multiline, // 여러 줄 입력을 허용
                                        maxLines: 20,
                                      ),
                                    ),
                                    const Divider(
                                      height: 50,
                                      endIndent: 40,
                                    ),
                                    const Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 15),
                                          child: Text(
                                            '사진 추가',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        // Text(
                                        //   '(사진은 최대 3장 첨부 가능)',
                                        //   style: TextStyle(
                                        //     fontSize: 16,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 188, 186, 186),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Obx(() {
                                        return SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3 *
                                              2,
                                          height: 150,
                                          child: controller.imageFile.value ==
                                                  null
                                              ? Center(
                                                  child: Text(
                                                    '이미지를 선택해 주세요!',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimaryContainer,
                                                    ),
                                                  ),
                                                )
                                              : Image.file(File(controller
                                                  .imageFile.value!.path)),
                                        );
                                      }),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 15),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 20, 0, 15),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.getImageFromDevice(
                                                ImageSource.gallery);
                                          },
                                          child: const Text('사진 추가하기'),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          //
                                        },
                                        child: Text('등록하기')),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // 드로어 메뉴
        child: ListView(
          // 리스트 뷰로 아이템 배치
          children: const [
            // 자식 위젯 목록
            ListTile(leading: Icon(Icons.home), title: Text('Home')), // 홈 아이템
            ListTile(
                leading: Icon(Icons.home),
                title: Text('내 차 시세 예측')), // 내 차 시세 예측 아이템
            ListTile(
                leading: Icon(Icons.home),
                title: Text('예측 기록 보기')), // 예측 기록 보기 아이템
            ListTile(
                leading: Icon(Icons.home),
                title: Text('내 차 판매 글')), // 내 차 판매 글 아이템
            ListTile(
                leading: Icon(Icons.home), title: Text('공지사항')), // 공지사항 아이템
          ],
        ),
      ),
    );
  }

  // --- Functions ---

  // 텍스트 필드 빌드하는 함수
  Widget buildTextFieldRow(String labelText, String initialValue) {
    if (labelText == '주행거리(km)') {
      // 주행거리 텍스트 필드에는 쉼표 추가
      initialValue = _addCommasToNumber(initialValue);
    }
    return Padding(
      // 위젯 간격을 주기 위해 패딩 추가
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        // 컬럼으로 자식 위젯 배치
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // 가로로 자식 위젯 배치
            children: [
              Text(
                // 라벨 텍스트
                '$labelText ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            // 크기 조절 가능한 박스 위젯
            height: 40,
            width: 100,
            child: TextField(
              // 텍스트 필드 위젯
              controller: TextEditingController(text: initialValue), // 초기값 설정
              onChanged: (value) {}, // 값 변경 이벤트 처리
              decoration: const InputDecoration(
                  // 입력 필드 스타일 설정
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0, -20, 0, 0)),
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(fontSize: 16),
              readOnly: true, // 읽기 전용 설정
            ),
          ),
        ],
      ),
    );
  }

  // 천 단위 쉼표를 추가하는 함수
  String _addCommasToNumber(String value) {
    if (value.length <= 3) return value; // 값의 길이가 3보다 작으면 그대로 반환

    return value.replaceAllMapped(
      // 정규 표현식으로 천 단위 쉼표 추가
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  // // 장치에서 이미지 가져오는 함수
  // void getImageFromDevice(ImageSource imageSource) async {
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: imageSource); // 이미지 선택 대화상자 열기
  //   if (pickedFile != null) {
  //     // 이미지 선택되면
  //     controller.getImageFromDevice(imageSource); // 이미지를 가져와서 처리
  //     controller.imageFile.value = pickedFile; // 이미지 파일 업데이트
  //   }
  // }
}
