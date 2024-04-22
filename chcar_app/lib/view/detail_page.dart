import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX
import '../vm/detail_page_controller.dart';
import 'detail_page_image_slider.dart';
import 'predict_page.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DetailController Instance 생성 및 GetX에 등록
    final DetailController controller = Get.put(DetailController());

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
      body: Center(
        child: Column(
          children: [
            // GetX - 상태 관리를 위한 위젯
            Obx(
              // wirteList 비어있다? 아니다?
              () => controller.writeList.isEmpty
                  // 비어있으면 로딩 중 표시
                  ? const CircularProgressIndicator()
                  // 아니면 이미지 슬라이더 및 화살표 버튼 표시
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 슬라이더 페이지 실행
                        Padding(
                          // fromLTRB(left, top, right, bottom)
                          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // GetX controller에서 이전버튼 실행
                              IconButton(
                                onPressed: () {
                                  controller.previousImage();
                                },
                                icon: const Icon(Icons.arrow_back_ios),
                              ),
                              DetailPageImageSlider(
                                // 이미지 리스트 설정
                                images: controller.writeList
                                    // Write 리스트에 이미지를 매핑.
                                    .map((write) => write.img)
                                    // 매핑된 것을 리스트로 변환
                                    .toList(),
                                // 현재 이미지 Index
                                currentIndex: controller.currentIndex.value,
                                // 다음 이미지 함수 호출
                                onNext: () => controller.nextImage(),
                                // 이전 이미지 함수 호출
                                onPrevious: () => controller.previousImage(),
                              ),
                              // GetX controller에서 다음버튼 실행
                              IconButton(
                                onPressed: () {
                                  controller.nextImage();
                                },
                                icon: const Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            // GetX - 일반 위젯
            GetBuilder<DetailController>(
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
                                    // 자식 위젯 리스트
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.center,
                                      children: [
                                        buildTextFieldRow(
                                            '브랜드', colorData['brand']),
                                        buildTextFieldRow(
                                            '모델', colorData['model']),
                                      ],
                                    ),
                                    buildTextFieldRow('연도', colorData['year']),
                                    buildTextFieldRow('색상', colorData['color']),
                                    buildTextFieldRow('주행거리', colorData['km']),
                                    buildTextFieldRow(
                                        '연료유형', colorData['fuel']),
                                    buildTextFieldRow(
                                        '변속기유형', colorData['transmission']),
                                    buildTextFieldRow(
                                        '차량연비', colorData['efficiency']),
                                    buildTextFieldRow(
                                        '차량마력', colorData['power_ps']),
                                  ],
                                ),
                              );
                            },
                          ),
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

  Widget buildTextFieldRow(String labelText, String initialValue) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$labelText ',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // SizedBox(
            //   width: 75,
            // )
          ],
        ),
        SizedBox(
          height: 100,
          width: 140,
          child: TextField(
            controller: TextEditingController(
              text: initialValue,
            ), // 초기값 설정
            onChanged: (value) {
              // 값이 변경되었을 때
              // 여기에 변경된 값 처리 로직을 추가할 수 있습니다.
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: EdgeInsets.all(1.0)),

            readOnly: true,
          ),
        ),
      ],
    );
  }
}
