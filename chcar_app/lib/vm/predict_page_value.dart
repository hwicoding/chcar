import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

 class DropdownBrandList{
  List<String> carbrand = []; 
  List<String> carmodel = []; 
  String whatB = '';
  List<String> col = ['black', 'silver', 'grey', 'blue', 'white', 'red'];
  String model ='';

  Future<void> getbrand() async {
  
    var url = Uri.parse('http://localhost:8080/Chcar/JSP/selectbrand.jsp');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    if (dataConvertedJSON is Map<String, dynamic>) {    
        var result = dataConvertedJSON['resultbrand'] as List<dynamic>;
        
        // key 값의 value 만 뽑아온다
        for (var item in result) {
            carbrand.add(item['brand']);
        }
    }
    //update(); 
  }

    getmodel() async {

    var url = Uri.parse('http://localhost:8080/Chcar/JSP/selectmodel.jsp?brand=$whatB');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    if (dataConvertedJSON is Map<String, dynamic>) {    
        var result = dataConvertedJSON['resultmodel'] as List<dynamic>;
        // 모델에 벨류값만 리스트에 추가
        //carmodel = [];
    for (var item in result) {
            carmodel.add(item['model']);
        }
    }
    //update(); 
  }

  whatcolor() {
      if (model == 'Kia_Sportage') {
          col = ['black', 'silver', 'grey', 'white'];
      }if (model == 'BMW_118' || model == 'BMW_320') {
          col = ['black', 'silver', 'grey', 'blue', 'white'];
      }else {
          col == ['black','silver','grey','blue','white','red'];
      }
      //update();
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