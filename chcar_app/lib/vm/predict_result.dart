import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShowResult extends GetxController {
  List data = [];
  //var go = Get.arguments;
  //Predictinfo info = Predictinfo();
  
  String whatmodel = '';
  String whatyear = '';
  String whatpower = '';
  String whattrans = '';
  String whatfuel = '';
  String whatcons = '';
  String whatmile = '';
  String colorpoint = '';

  String whatcolb = '0';
  String whatcols = '0';
  String whatcolr = '0';
  String whatcolg = '0';
  String whatcolbl = '0';
  String whatcolw = '0';
  // 예측값 저장 변수 
  double resultvalue = 0;
  double errorvalue = 0;
  

  //색깔 컬럼이 다른 것 끼리 다른함수로
  navigater() {
    if (whatmodel == 'Kia_Sportage') {
      color4predict();
    }
    if (whatmodel == 'BMW_118' || whatmodel == 'BMW_320') {
      color5predict();
    } else {
      gopredict();
    }
  }

  gopredict() async {
    print("가져온 모델 $whatmodel");
    print("가져온 년도 $whatyear");
    print(whatpower);
    print(whattrans);
    print(whatfuel);
    print(whatcons);
    print(whatmile);
    print(colorpoint);
    colordiv();
    var url = Uri.parse(
        'http://localhost:8080/Flutter/team_car_Rserve/$whatmodel.jsp?'
        'year=$whatyear&power_ps=$whatpower&transmission_type=$whattrans&'
        'fuel_type=$whatfuel&fuel_consumption_l_100km=$whatcons&'
        'mileage_in_km=$whatmile&color_black=$whatcolb&color_silver=$whatcols&'
        'color_red=$whatcolr&color_grey=$whatcolg&color_blue=$whatcolbl&color_white=$whatcolw');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    double result = double.parse(dataConvertedJSON['result']);
    double error = double.parse(dataConvertedJSON['error']);

resultvalue = result;
errorvalue = error;
    // 컬러값 초기화
    whatcolb = '0';
    whatcols = '0';
    whatcolr = '0';
    whatcolg = '0';
    whatcolbl = '0';
    whatcolw = '0';
    update();
  }

  color4predict() async {
    colordiv();
    var url = Uri.parse(
        'http://localhost:8080/Flutter/team_car_Rserve/$whatmodel.jsp?'
        'year=$whatyear&power_ps=$whatpower&transmission_type=$whattrans&'
        'fuel_type=$whatfuel&fuel_consumption_l_100km=$whatcons&'
        'mileage_in_km=$whatmile&color_black=$whatcolb&color_silver=$whatcols'
        '&color_grey=$whatcolg&color_white=$whatcolw');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    double result = double.parse(dataConvertedJSON['result']);
    double error = double.parse(dataConvertedJSON['error']);

resultvalue = result;
errorvalue = error;

   
    // 컬러값 초기화
    whatcolb = '0';
    whatcols = '0';
    whatcolr = '0';
    whatcolg = '0';
    whatcolbl = '0';
    whatcolw = '0';
     update();
  }

  color5predict() async {
    colordiv();
    var url = Uri.parse(
        'http://localhost:8080/Flutter/team_car_Rserve/$whatmodel.jsp?'
        'year=$whatyear&power_ps=$whatpower&transmission_type=$whattrans&'
        'fuel_type=$whatfuel&fuel_consumption_l_100km=$whatcons&'
        'mileage_in_km=$whatmile&color_black=$whatcolb&color_silver=$whatcols'
        '&color_grey=$whatcolg&color_white=$whatcolw&color_blue=$whatcolbl');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    double result = double.parse(dataConvertedJSON['result']);
    double error = double.parse(dataConvertedJSON['error']);

resultvalue = result;
errorvalue = error;

    // 컬러값 초기화
    whatcolb = '0';
    whatcols = '0';
    whatcolr = '0';
    whatcolg = '0';
    whatcolbl = '0';
    whatcolw = '0';
    update();
  }

  colordiv() {
  //  문자로 받은 컬러값을 one hot encodig 한 컬럼 기준으로 변경
    switch (colorpoint) {
      case 'black':
        whatcolb = '1';
        break;
      case 'silver':
        whatcolbl = '1';
        break;
      case 'red':
        whatcolr = '1';
      case 'grey':
        whatcolg = '1';
        break;
      case 'blue':
        whatcolbl = '1';
        break;
      case 'white':
        whatcolw = '1';
        break;
      default:
        break;
    }
  }
}
