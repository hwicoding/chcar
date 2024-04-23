import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CardListVm extends GetxController {
  findUserId(String id) async {
    var url = Uri.parse('http://localhost:8080/Chcar/readNickname.jsp');
    var response = await http.post(
      url,
      body: {'id': id},
    );
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    var result = dataConvertedJson['result'];
    // 닉네임 반환
  }
}
