// detail_controller.dart

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/write.dart';
import 'package:http/http.dart' as http;

class DetailController extends GetxController {
  final RxList<Write> writeList = <Write>[].obs;
  late Timer _timer;
  RxInt _currentIndex = RxInt(0);
  List data = [];

  @override
  void onInit() {
    super.onInit();
    fetchWrites();
  }

  getJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/team_car_JSP/selectCar.jsp');

    print('이건 URL이야 : $url');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    print(result);
    data.addAll(result);
    update();
  }

  void fetchWrites() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('write')
        .orderBy('seq', descending: false)
        .get();
    final writes = snapshot.docs.map((doc) {
      return Write(
        seq: doc['seq'],
        id: doc['id'],
        carSeq: doc['carseq'],
        carInfo: doc['carinfo'],
        sellPrice: doc['sellprice'],
        lat: doc['lat'],
        lng: doc['lng'],
        img: doc['img'],
        state: doc['state'],
      );
    }).toList();
    writeList.assignAll(writes);

    // Timer 설정
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _currentIndex.value = (_currentIndex.value + 1) % writeList.length;
    });
  }

  void nextImage() {
    _currentIndex.value = (_currentIndex.value + 1) % writeList.length;
  }

  void previousImage() {
    _currentIndex.value = _currentIndex.value == 0
        ? writeList.length - 1
        : _currentIndex.value - 1;
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  RxInt get currentIndex => _currentIndex;
}
