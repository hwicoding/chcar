import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../vm/detail_page_controller.dart';
import 'predict_page.dart';

// ignore: use_key_in_widget_constructors
class SalePage extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());
  final picker = ImagePicker(); // picker 변수 선언 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        // 제목
        title: Image.asset(
          'images/logo.png',
          width: 150,
        ),
        // 배경색
        backgroundColor: const Color.fromARGB(255, 79, 139, 116),
        // 아이콘 테마 설정
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // GetX - 일반 위젯
            GetBuilder<DetailController>(
              // 디테일 컨트롤러 GetBuilder
              builder: (controller) {
                // 빌더 함수
                return SizedBox(
                  height: 680,
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
                            return Padding(
                              // fromLTRB(left, top, right, bottom)
                              padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // 컬럼 위젯
                                  children: [
                                    // 자식 위젯 리스트
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.center,
                                      children: [
                                        buildTextFieldRow(
                                            '브랜드', colorData['brand']),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        buildTextFieldRow(
                                            '모델', colorData['model']),
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
                                            '판매자', colorData['year']),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        buildTextFieldRow(
                                            '주행거리(km)',
                                            double.parse(colorData['km'])
                                                .toStringAsFixed(0)),
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
                                            '연도', colorData['year']),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        buildTextFieldRow(
                                            '색상', colorData['color']),
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
                                            '연료유형', colorData['fuel']),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        buildTextFieldRow(
                                            '변속기유형', colorData['transmission']),
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
                                            colorData['efficiency']),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        buildTextFieldRow(
                                            '차량마력(kW)', colorData['power_ps']),
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
                                        Text(
                                          '사진 추가',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '(사진은 최대 3장 첨부 가능)',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
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
                                      child: OutlinedButton(
                                        onPressed: () {
                                          getImageFromDevice(
                                              ImageSource.gallery);
                                        },
                                        child: const Text('사진 추가하기'),
                                      ),
                                    ),
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
        // 드로어
        child: ListView(
          // 리스트 뷰
          children: const [
            // 자식 위젯 리스트
            ListTile(
              // 리스트 타일
              leading: Icon(Icons.home), // 아이콘 설정
              title: Text('Home'), // 텍스트 설정
            ),
            ListTile(
              // 리스트 타일
              leading: Icon(Icons.home), // 아이콘 설정
              title: Text('내 차 시세 예측'), // 텍스트 설정
            ),
            ListTile(
              // 리스트 타일
              leading: Icon(Icons.home), // 아이콘 설정
              title: Text('예측 기록 보기'), // 텍스트 설정
            ),
            ListTile(
              // 리스트 타일
              leading: Icon(Icons.home), // 아이콘 설정
              title: Text('내 차 판매 글'), // 텍스트 설정
            ),
            ListTile(
              // 리스트 타일
              leading: Icon(Icons.home), // 아이콘 설정
              title: Text('공지사항'), // 텍스트 설정
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 플로팅 액션 버튼
        backgroundColor: Color.fromARGB(255, 79, 139, 116), // 배경색 설정
        onPressed: () {
          // 클릭 이벤트 핸들러
          Get.to(const PredictPage()); // 예측 페이지로 이동
        },
        child: Center(
          // 중앙 정렬
          child: Icon(
            // 아이콘
            Icons.add, // 추가 아이콘
            color: Colors.white, // 아이콘 색상 설정
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  Widget buildTextFieldRow(String labelText, String initialValue) {
    // 주행 거리, 마력, 연비 부분만 따로 처리
    if (labelText == '주행거리(km)') {
      initialValue = _addCommasToNumber(initialValue);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$labelText ',
                // textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            width: 100,
            child: TextField(
              controller: TextEditingController(
                text: initialValue,
              ), // 초기값 설정
              onChanged: (value) {},
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0, -20, 0, 0)),
              textAlignVertical: TextAlignVertical.top,
              style: const TextStyle(
                fontSize: 16,
              ),

              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }

  // 천 단위 쉼표를 추가하는 함수
  String _addCommasToNumber(String value) {
    if (value.length <= 3) return value;

    return value.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  void getImageFromDevice(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      // DetailController의 getImageFromDevice 메서드 호출
      controller.getImageFromDevice(imageSource);

      // 이미지 파일 업데이트
      controller.imageFile.value = pickedFile;
    }
  }
} // end
