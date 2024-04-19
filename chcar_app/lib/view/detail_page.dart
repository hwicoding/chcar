import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'predict_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late TextEditingController infoController = TextEditingController();
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              // 사진
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/test_01.webp',
                          width: 300,
                        ),
                        Image.asset(
                          'images/test_02.webp',
                          width: 300,
                        ),
                        Image.asset(
                          'images/test_03.webp',
                          width: 300,
                        ),
                        Image.asset(
                          'images/test_04.webp',
                          width: 300,
                        ),
                        Image.asset(
                          'images/test_05.webp',
                          width: 300,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // 가격
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '가격 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '20,000 €',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 브랜드
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '브랜드 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Hyundai',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 모델
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '모델 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Kona',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 생산연도
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '생산연도 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '2017',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 색상
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '색상 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Black',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 주행거리
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '주행거리 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '20,000km',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 연료유형
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '연료유형 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '가솔린',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 변속기유형
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '연료유형 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '오토',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 차량연비
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '차량연비 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '18.3',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // 마력
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Row(
                  children: [
                    Text(
                      '마력 : ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Row(
                        children: [
                          Text(
                            '설명',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 370,
                      height: 500,
                      child: TextField(
                        maxLines: 300,
                        controller: infoController,
                        decoration: const InputDecoration(
                          labelText: '설명',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('내 차 시세 예측'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('예측 기록 보기'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('내 차 판매 글'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('공지사항'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 79, 139, 116),
        onPressed: () {
          Get.to(const PredictPage());
        },
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
