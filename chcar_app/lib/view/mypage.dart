import 'package:chcar_app/view/userinfo_update.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 문의 버튼이 클릭되었을 때 수행할 작업
                    },
                    child: Text('문의'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // 네모 모양으로 변경할 수 있습니다.
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // 후기 버튼이 클릭되었을 때 수행할 작업
                    },
                    child: Text('후기'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // 네모 모양으로 변경할 수 있습니다.
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(Userinfoupdate());
                      },
                      child: Text('회원정보수정'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // 네모 모양으로 변경할 수 있습니다.
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
