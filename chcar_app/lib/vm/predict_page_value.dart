import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

 class DropdownBrandList extends GetxController {
  List<String> carbrand = []; 
  List<String> carmodel = []; 
  String whatB = 'Audi';
  List col = [];

  Future<void> getbrand() async {
    var url = Uri.parse('http://localhost:8080/Flutter/JSP/selectbrand.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    if (dataConvertedJSON is Map<String, dynamic>) {    
        var result = dataConvertedJSON['resultbrand'] as List<dynamic>;
        for (var item in result) {
            carbrand.add(item['brand']);
        }
    }
    update(); 
  }

  Future<void> getmodel() async {
    var url = Uri.parse('http://localhost:8080/Flutter/JSP/selectmodel.jsp?brand=$whatB');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    if (dataConvertedJSON is Map<String, dynamic>) {    
        var result = dataConvertedJSON['resultmodel'] as List<dynamic>;
        for (var item in result) {
            carmodel.add(item['model']);
        }
    }
    update(); 
  }

  whatcolor(String car) {
      if (car == 'Kia_Sportage') {
          col = ['black', 'silver', 'grey', 'white'];
      }if (car == 'BMW_118' || car == 'BMW_320') {
          col = ['black', 'silver', 'grey', 'blue', 'white'];
      }else {
          col == ['black','silver','grey','blue','white','red'];
      }
      update();
  }

  check() {
          
  }

  showdia() {
     Get.defaultDialog(
        title: '오류',
        middleText: '항목을 전부 입력해주세요.',
        backgroundColor: const Color.fromARGB(255, 79, 139, 116),
        barrierDismissible: true,
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Exit')),
        ]);
  }
}