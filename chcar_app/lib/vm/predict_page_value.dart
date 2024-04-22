import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

 class DropdownBrandList extends GetxController {
  List<String> carbrand = []; 
  List<String> carmodel = []; 
  String whatB = 'Audi';

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
}