import 'package:chcar_app/view/Chcardrawer.dart';
import 'package:chcar_app/view/cardList.dart';
import 'package:chcar_app/view/predict_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

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
      body: CardListPage(),
      drawer: ChchrDrawer(),
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
