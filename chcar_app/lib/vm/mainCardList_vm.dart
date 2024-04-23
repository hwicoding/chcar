import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CardListVm extends GetxController {
  int count = 0;
  findUserId(String id, String nickname) async {
    var url = Uri.parse('http://localhost:8080/Chcar/JSP/readNickname.jsp');
    var response = await http.post(
      url,
      body: {'id': id},
    );
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];
    nickname = result;

    count++;

    update();
  }
}
