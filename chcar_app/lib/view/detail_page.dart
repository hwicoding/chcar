import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../vm/detail_page_controller.dart';

// ignore: use_key_in_widget_constructors
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DetailController Instance 생성 및 GetX에 등록
    final DetailController controller = Get.put(DetailController());
    final login = GetStorage();

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
                // Obx 위젯: Rx 상태를 구독하고 그 상태가 변경될 때마다 자동으로 UI를 업데이트합니다.
                // wirteList 비어있다? 아니다?
                () => controller.writeList.isEmpty // writeList가 비어있는지 확인합니다.
                    // 비어있으면 로딩 중 표시
                    ? const CircularProgressIndicator() // writeList가 비어있다면 로딩 중을 나타내는 CircularProgressIndicator를 표시합니다.
                    // 아니면 이미지 슬라이더 및 화살표 버튼 표시
                    : Column(
                        // writeList에 항목이 있는 경우 Column을 반환합니다.
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 슬라이더 페이지 실행
                          Padding(
                            // fromLTRB(left, top, right, bottom)
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.white,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Swiper(
                                    index: 0, // Swiper의 초기 인덱스를 설정합니다.
                                    controller:
                                        SwiperController(), // Swiper를 제어하는 데 사용되는 컨트롤러를 설정합니다.
                                    autoplay: true, // 자동으로 이미지를 전환할지 여부를 나타냅니다.
                                    autoplayDelay:
                                        1000, // 이미지 전환 간격을 밀리초 단위로 설정합니다.
                                    control:
                                        SwiperControl(), // 이전 및 다음 이미지로 이동하는 화살표 버튼을 표시합니다.
                                    onIndexChanged: (index) {
                                      controller.currentIndex.value = index;
                                    },
                                    allowImplicitScrolling: false,
                                    pagination:
                                        SwiperPagination(), // 페이지 표시 도구를 활성화합니다(기본 동그라미).
                                    itemCount: controller.imgList
                                        .length, // Swiper에 표시할 항목 수를 설정합니다.
                                    itemBuilder: (context, index) {
                                      String imageUrl = controller
                                          .imgList[index]; // 이미지 URL을 가져옵니다.
                                      // print('이건 이미지 주소${imageUrl}'); // 이미지 URL을 출력합니다.
                                      return Column(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            height: 300,
                                            child: Image.network(
                                                imageUrl), // 네트워크에서 이미지를 로드합니다.
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
                                            buildTextFieldRow('판매자',
                                                login.read("usernickname")),
                                            buildTextFieldRow(
                                                '색상', colorData['color']),
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
                                                '주행거리(km)', colorData['km']),
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

                                        // const Padding(
                                        //   padding:
                                        //       EdgeInsets.fromLTRB(0, 20, 0, 20),
                                        //   child: Text(
                                        //     '차량 설명',
                                        //     textAlign: TextAlign.left,
                                        //     style: TextStyle(
                                        //       fontWeight: FontWeight.bold,
                                        //       fontSize: 20,
                                        //     ),
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 220,
                                        //   width: 360,
                                        //   child: TextField(
                                        //     controller:
                                        //         controller.write['va'], // 초기값 설정
                                        //     onChanged: (value) {

                                        //       print('value 값이 뭐야? $value');
                                        //     },
                                        //     decoration: InputDecoration(
                                        //       border: OutlineInputBorder(
                                        //         borderRadius:
                                        //             BorderRadius.circular(5),
                                        //       ),
                                        //       // contentPadding: EdgeInsets.symmetric(
                                        //       //     vertical: 20.0),
                                        //     ),
                                        //     keyboardType: TextInputType
                                        //         .multiline, // 여러 줄 입력을 허용
                                        //     maxLines: 20,
                                        //   ),
                                        // ),
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
