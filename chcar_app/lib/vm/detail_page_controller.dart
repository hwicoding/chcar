// detail_controller.dart

import 'dart:convert';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import '../model/write.dart';
import 'package:http/http.dart' as http;

class DetailController extends GetxController {
  // RxList - GetX에서 제공해주는 반응형 리스트.(실시간 UI 업데이트 기능)
  final RxList<Write> writeList = <Write>[].obs;
  String carSeq = '';
  RxInt _currentIndex = RxInt(0);
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  List data = [];
  List imgList = [];
  // 이미지 피커가 활성화되어 있는지 여부를 추적하는 상태 변수
  bool _isImagePickerActive = false;
  bool loopState = false;

  getJSONData() async {
    data.clear();
    loopState = false;
    var url = Uri.parse(
        'http://localhost:8080/Chcar/JSP/selectCar.jsp?carSeq=$carSeq');
    var response = await http.get(url);
    print('진짜 찍히냐? : $carSeq');
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data.addAll(result);
    print("데이터 뭐 가져오냐? $data");
    loopState = true;
    update();
  }

  void fetchWrites(String carSeq) async {
    imgList.clear();
    print('피쳐 시작 : $carSeq');
    final snapshot = await FirebaseFirestore.instance
        .collection('write')
        .where('carseq', isEqualTo: carSeq) // 매개변수로 받은 carseq 값으로 필터링합니다.
        .orderBy('seq', descending: false)
        .get();
    final writes = snapshot.docs.map((doc) {
      return Write(
        seq: doc['seq'],
        id: doc['id'],
        carSeq: doc['carseq'],
        carInfo: doc['carinfo'],
        sellPrice: doc['sellprice'],
        img_01: doc['img_01'],
        img_02: doc['img_02'],
        // img_03: doc['img_03'],
        state: doc['state'],
      );
    }).toList();
    writeList.assignAll(writes);
    imgList.add(
      writes[0].img_01,
    );
    imgList.add(
      writes[0].img_02,
    );

    // // Timer 설정
    // _timer = Timer.periodic(const Duration(seconds: 3), (_) {
    //   _currentIndex.value = (_currentIndex.value + 1) % writeList.length;
    // });
  }

  // void nextImage() {
  //   _currentIndex.value = (_currentIndex.value + 1) % writeList.length;
  // }

  // void previousImage() {
  //   _currentIndex.value = _currentIndex.value == 0
  //       ? writeList.length - 1
  //       : _currentIndex.value - 1;
  // }

  // @override
  // void onClose() {
  //   _timer.cancel();
  //   super.onClose();
  // }

  RxInt get currentIndex => _currentIndex;

  void getImageFromDevice(ImageSource imageSource) async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile.value = pickedFile;
    }
  }

  // 다시 사진 추가하기 메서드
  void addMorePhotos() async {
    // 이미지 피커가 활성화되어 있지 않을 때만 실행
    if (!_isImagePickerActive) {
      _isImagePickerActive = true; // 이미지 피커 활성화 상태로 변경
      final picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      _isImagePickerActive = false; // 이미지 피커 비활성화 상태로 변경

      if (pickedFile != null) {
        imageFile.value = pickedFile;
      }
    }
  }
}
