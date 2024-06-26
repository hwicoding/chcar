import 'package:chcar_app/view/sale_page.dart';
import 'package:chcar_app/vm/predict_insert.dart';

import 'package:chcar_app/vm/predict_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShowResult controller = Get.put(ShowResult());
    final Predictinset controller2 = Get.put(Predictinset());

    final box = GetStorage();
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
                                SizedBox(
                                    height: 150,
                                  child: Text("차량 : ${box.read('model')}",style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 79, 139, 116)
                                  ),),
                                ),
                          const Text(
                            '고객님의 차량 예측 판매가격은',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 290,
                            child: Row(children: [
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
                                controller2.model = box.read("model");
                                controller2.error = (controller.errorvalue).toString();
                                controller2.price = (controller.resultvalue).toString();
                                controller2.getbrand();
                                      Get.to(SalePage());
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 79, 139, 116),
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
                                controller2.model = box.read("model");
                                controller2.error = (controller.errorvalue).toString();
                                controller2.price = (controller.resultvalue).toString();
                                controller2.getbrand();
                                      Get.back();
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: const Color.fromARGB(
                                            255, 79, 139, 116),
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
