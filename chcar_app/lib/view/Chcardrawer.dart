import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'userinfo_update.dart';

class ChchrDrawer extends StatelessWidget {
  const ChchrDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final login = GetStorage();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${login.read('usernickname')}님 안녕하세요 :)'),
            accountEmail: Text(''),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 79, 139, 116),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('내 정보 수정하기'),
            onTap: () {
              Get.to(Userinfoupdate());
            },
          ),
        ],
      ),
    );
  }
}
