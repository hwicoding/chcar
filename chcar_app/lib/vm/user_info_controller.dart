import 'dart:convert';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserinfoController extends GetxController {
  // late String userid = 'hwicoding';
  //String userId ='';
  List data = [];

  // @override
  // void onInit() {
  //   super.onInit();
  //   userId = GetStorage().read('userid') ?? '';
  //   getJSONData();
  // }

  @override
  void onInit() {
    super.onInit();
    getJSONData();
  }

  getJSONData() async {
    //print('이건 유저아이디야 : $userId');
    var url = Uri.parse('http://localhost:8080/Chcar/JSP/userinfo.jsp');
    var response = await http.get(url);
    //print('진짜 찍히냐? : $userId');
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    print('넌 뭐냐? $result');
    data.addAll(result);
    update();
  }
}
