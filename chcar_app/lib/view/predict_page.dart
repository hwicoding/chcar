import 'package:chcar_app/view/predict_result_page.dart';
import 'package:chcar_app/vm/predict_page_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  //년도
  DateTime? pickertime;
  // 텍스트 필드
  late TextEditingController yearEditingController;
  late TextEditingController pstextEditingController;
  late TextEditingController fueltextEditingController;
  late TextEditingController kmtextEditingController;
  // 브랜드 파라미터 전할 변수값
  late String whatb;
  // 라디오버튼 밸류 값 변수
  late List<String> trantype;
  late List<String> fueltype;
  // 드롭다운 초기값
  late String dropvalue1;
  late String dropvalue2;
  // 색상 드롭다운 버튼 리스트
  late List<String> col;
  // 색상 초기값
  late String initcol;
  // 라디오버튼 값
  late String _selectedOption1;
  late String _selectedOption2;

  // json 값 저장변수
  late List<String> carbrand = [];
  late List<String> carmodel = [];

  // 인스턴스 생성
  late DropdownBrandList dropdownBrandList = DropdownBrandList();

  @override
  void initState() {
    super.initState();

    pstextEditingController = TextEditingController();
    fueltextEditingController = TextEditingController();
    kmtextEditingController = TextEditingController();
    yearEditingController = TextEditingController();
    trantype = ["오토", "메뉴얼"];
    fueltype = ["디젤", "가솔린"];
    dropvalue1 = 'Audi';
    dropvalue2 = 'Audi_A3';
    initcol = 'black';
    _selectedOption1 = '';
    _selectedOption2 = '';
    col = ['black', 'silver', 'grey', 'blue', 'white', 'red'];
    // 페이지 진입시 DB에서 차량 정보 가져오기
    goconnected();
    goconnected2();
  }

  Future<void> goconnected() async {
    await dropdownBrandList.getbrand();
    carbrand = dropdownBrandList.carbrand;
    dropdownBrandList.whatB = dropvalue1;
    print(carbrand);
    setState(() {});
  }

  Future<void> goconnected2() async {
    carmodel.clear();
    await dropdownBrandList.getmodel();
    carmodel = dropdownBrandList.carmodel;
    print(carmodel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          width: 150,
        ),
        backgroundColor: const Color.fromARGB(255, 79, 139, 116),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: carbrand.isEmpty
          ? const CircularProgressIndicator()
          : GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text(
                                '차 브랜드 선택',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: DropdownButton(
                            items: carbrand.map((String brand) {
                              return DropdownMenuItem(
                                value: brand,
                                child: Text(brand),
                              );
                            }).toList(),
                            value: dropvalue1,
                            onChanged: (value)  async{
                              dropdownBrandList.carbrand = [];
                              dropdownBrandList.carmodel = [];
                              dropvalue1 = value.toString();
                              //await dropdownBrandList.whatB = value!;
                              goconnected2();
                              dropvalue2 = carmodel[1];
                              setState((){});
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text(
                                '차 모델 선택',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: DropdownButton(
                            items: carmodel.map((String model) {
                              return DropdownMenuItem(
                                value: model,
                                child: Text(model),
                              );
                            }).toList(),
                            value: dropvalue2,
                            onChanged: (value) {
                              dropdownBrandList.carmodel = [];
                              dropvalue2 = value.toString();
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text(
                                '색상 선택',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: DropdownButton(
                            items: col.map((String model) {
                              return DropdownMenuItem(
                                value: model,
                                child: Text(model),
                              );
                            }).toList(),
                            value: initcol,
                            onChanged: (value) {
                              initcol = value.toString();
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text(
                                '변속기 유형',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('오토'),
                            SizedBox(
                              width: 60,
                              child: Radio(
                                value: trantype[0],
                                groupValue: _selectedOption1,
                                onChanged: (value) {
                                  _selectedOption1 = value!;
                                  setState(() {});
                                },
                              ),
                            ),
                            const Text('메뉴얼'),
                            SizedBox(
                              width: 50,
                              child: Radio(
                                value: trantype[1],
                                groupValue: _selectedOption1,
                                onChanged: (value) {
                                  _selectedOption1 = value!;
                                  print(_selectedOption1);
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text(
                                '연료 유형',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('디젤'),
                            SizedBox(
                              width: 60,
                              child: Radio(
                                value: trantype[0],
                                groupValue: _selectedOption2,
                                onChanged: (value) {
                                  _selectedOption2 = value!;
                                  setState(() {});
                                },
                              ),
                            ),
                            const Text('가솔린'),
                            SizedBox(
                              width: 50,
                              child: Radio(
                                value: trantype[1],
                                groupValue: _selectedOption2,
                                onChanged: (value) {
                                  _selectedOption2 = value!;
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text('차량 구매 연도'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                              controller: yearEditingController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                            ),
                          ),
                        ),
                        
    
                        const SizedBox(
                          width: 300,
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 15,
                              ),
                              Text('차량 마력'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                              controller: pstextEditingController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              maxLength: 5,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 15,
                                ),
                                Text('차량 연비'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                              controller: fueltextEditingController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              maxLength: 5,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 15,
                                ),
                                Text('주행 거리'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: TextField(
                              controller: kmtextEditingController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (pstextEditingController.text.isEmpty ||
                                  fueltextEditingController.text.isEmpty ||
                                  kmtextEditingController.text.isEmpty ||
                                  yearEditingController.text.isEmpty) {
                                dropdownBrandList.showdia();
                              } else {
                              Get.to(dropdownBrandList.check(),arguments: [
                                  whatb,
                              ]);  
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 79, 139, 116),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              '시세 보기',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
