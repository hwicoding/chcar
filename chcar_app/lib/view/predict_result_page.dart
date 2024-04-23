import 'package:chcar_app/view/sale_page.dart';
import 'package:chcar_app/vm/predict_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShowResult controller = Get.put(ShowResult());
    controller.navigater();
    
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<ShowResult>(
              builder: (controller) {
                return controller.resultvalue == 0
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [

                          


                          const Text(
                            '고객님의 차량 예측 판매가격은',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 290,
                            child: Row(
                              children: [

                              Text(
                                '${(controller.resultvalue - controller.errorvalue).toInt()} ~ ${(controller.resultvalue + controller.errorvalue).toInt()}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 79, 139, 116),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.euro,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              )
                            ]),
                          ),
                          const Text(
                            '입니다.',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 280,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(SalePage());
                                    
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color.fromARGB(255, 79, 139, 116),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: const Text('판매 하기'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor:
                                            const Color.fromARGB(255, 79, 139, 116),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: const Text('돌아가기'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
