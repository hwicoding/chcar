import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// 예측 후, mysql DB 에 예측한 결과를 인서트 하는 jsp 실행

class Predictinset extends GetxController{
    String model = '';
    String price = '';
    String error = '';

  getbrand() async {
    var url = Uri.parse('http://localhost:8080/Chcar/JSP/insertpredict.jsp?model=$model&price=$price&error=$error');
    await http.get(url); 
    update(); 
      }
    }
  