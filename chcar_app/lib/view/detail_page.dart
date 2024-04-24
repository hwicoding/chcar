import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../vm/detail_page_controller.dart';

// ignore: use_key_in_widget_constructors
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                Container(
                                  color: Colors.amber,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Swiper(
                                    index: 0,
                                    controller: SwiperController(),
                                    autoplay: true,
                                    autoplayDelay: 1000,
                                    control: SwiperControl(),
                                    onIndexChanged: (index) {
                                      controller.currentIndex.value = index;
                                    },
                                    allowImplicitScrolling: false,
                                    pagination: SwiperPagination(),
                                    itemCount: controller.imgList
                                        .length, // writeList의 이미지 갯수로 itemCount 설정
                                    itemBuilder: (context, index) {
                                      String imageUrl =
                                          controller.imgList[index];
                                      // print(
                                      //     '이건 이미지 주소${imageUrl}'); // 이미지 URL 가져오기
                                      return Column(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            height: 300,
                                            child: Image.network(
                                                imageUrl), // 이미지 불러오기
                                          )
                                        ],
                                      );
                                    },
                                  ),
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
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 30, 0, 0),
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            buildTextFieldRow(
                                                '색상', colorData['color']),
                                            buildTextFieldRow(
                                                '주행거리', colorData['km']),
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
                                            buildTextFieldRow('변속기유형',
                                                colorData['transmission']),
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
                                            buildTextFieldRow('차량연비',
                                                colorData['efficiency']),
                                            buildTextFieldRow(
                                                '차량마력', colorData['power_ps']),
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
                                      ],
                                    ),
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
      ),
    );
  }

  Widget buildTextFieldRow(String labelText, String initialValue) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                // 라벨 텍스트
                '$labelText ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              // SizedBox(
              //   width: 75,
              // ),
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
}
