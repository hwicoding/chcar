import 'package:chcar_app/view/mypage.dart';
import 'package:chcar_app/view/predict_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'detail_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final login = GetStorage();

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
      body: ElevatedButton(
          onPressed: () {
            Get.to(DetailPage());
          },
          child: Text('이동')),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('${login.read('usernickname')}님 안녕하세요'),
              accountEmail: Text(''),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mypage'),
              onTap: () {
                Get.to(Mypage());
              },
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
