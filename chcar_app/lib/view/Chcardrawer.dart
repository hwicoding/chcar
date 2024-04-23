import 'package:chcar_app/view/mypage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class ChchrDrawer extends StatelessWidget {
  const ChchrDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final login = GetStorage();
    return Drawer(
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
    );
  }
}
