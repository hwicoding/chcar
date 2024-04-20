// detail_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../vm/detail_page_controller.dart';
import 'detail_page_image_slider.dart';
import 'predict_page.dart';

class DetailPage extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          width: 150,
        ),
        backgroundColor: const Color.fromARGB(255, 79, 139, 116),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => controller.writeList.isEmpty
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DetailPageImageSlider(
                          images: controller.writeList
                              .map((write) => write.img)
                              .toList(),
                          currentIndex: controller.currentIndex.value,
                          onNext: () => controller.nextImage(),
                          onPrevious: () => controller.previousImage(),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.previousImage();
                              },
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              onPressed: () {
                                controller.nextImage();
                              },
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            Text('data')
          ],
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
