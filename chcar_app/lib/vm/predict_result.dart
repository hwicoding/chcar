import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShowResult extends GetxController{
      List data = [];
      var go = Get.arguments;
       String whatmodel = '';
       String  whatyear = '';
       String  whatpower = '';
       String  whattrans = '';
       String  whatfuel = '';
       String  whatcons = '';
       String  whatmile = '';
       String  whatcolb = '0';
       String  whatcols = '0';
       String  whatcolr = '0';
       String  whatcolg = '0';
       String  whatcolbl = '0';
       String  whatcolw = '0';

      String whatcost ='';
      String whaterror = '';
      //색깔 컬럼이 다른 것 끼리 다른함수로
        navigater() {
              if(whatmodel == 'Kia_Sportage') {
                    color4predict();
              }if(whatmodel == 'BMW_118' || whatmodel == 'BMW_118') {
                color5predict();
              }else {
                gopredict();
              }
        }


      gopredict() async {
    var url = Uri.parse('http://localhost:8080/Flutter/team_car_Rserve/$whatmodel.jsp?'
                        'year=$whatyear&power_ps=$whatpower&transmission_type=$whattrans&'
                        'fuel_type=$whatfuel&fuel_consumption_l_100km=$whatcons&'
                        'mileage_in_km=$whatmile&color_black$whatcolb&color_silver=$whatcols&'
                        'color_red=$whatcolr&color_grey=$whatcolg&color_blue=$whatcolbl&color_white=$whatcolw');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
     String result = dataConvertedJSON['result'];
    String error = dataConvertedJSON['error'];

    whatcost = result;
    whaterror = error;

    update(); 
    // 컬러값 초기화
       whatcolb = '0';
       whatcols = '0';
       whatcolr = '0';
       whatcolg = '0';
       whatcolbl = '0';
       whatcolw = '0';
  }

color4predict() async{
 var url = Uri.parse('http://localhost:8080/Flutter/team_car_Rserve/$whatmodel.jsp?'
                        'year=$whatyear&power_ps=$whatpower&transmission_type=$whattrans&'
                        'fuel_type=$whatfuel&fuel_consumption_l_100km=$whatcons&'
                        'mileage_in_km=$whatmile&color_black$whatcolb&color_silver=$whatcols'
                        '&color_grey=$whatcolg&color_white=$whatcolw');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
     String result = dataConvertedJSON['result'];
    String error = dataConvertedJSON['error'];

    whatcost = result;
    whaterror = error;

    update(); 
    // 컬러값 초기화
       whatcolb = '0';
       whatcols = '0';
       whatcolr = '0';
       whatcolg = '0';
       whatcolbl = '0';
       whatcolw = '0';
}

color5predict() async{
var url = Uri.parse('http://localhost:8080/Flutter/team_car_Rserve/$whatmodel.jsp?'
                        'year=$whatyear&power_ps=$whatpower&transmission_type=$whattrans&'
                        'fuel_type=$whatfuel&fuel_consumption_l_100km=$whatcons&'
                        'mileage_in_km=$whatmile&color_black$whatcolb&color_silver=$whatcols'
                        '&color_grey=$whatcolg&color_white=$whatcolw&color_blue=$whatcolbl');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
     String result = dataConvertedJSON['result'];
    String error = dataConvertedJSON['error'];

    whatcost = result;
    whaterror = error;

    update(); 
    // 컬러값 초기화
       whatcolb = '0';
       whatcols = '0';
       whatcolr = '0';
       whatcolg = '0';
       whatcolbl = '0';
       whatcolw = '0';
}


}