import 'package:chcar_app/view/predict_result_page.dart';
import 'package:chcar_app/vm/predict_page_value.dart';
import 'package:chcar_app/vm/predict_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
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
  // 판매글 올리기,mysql 에 인서트를 위한 저장
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    pstextEditingController = TextEditingController();
    fueltextEditingController = TextEditingController();
    kmtextEditingController = TextEditingController();
    yearEditingController = TextEditingController();
    trantype = ["0", "1"];
    fueltype = ["0", "1"];
    dropvalue1 = 'Audi';
    dropvalue2 = 'Audi_A3';
    initcol = 'black';
    _selectedOption1 = trantype[0];
    _selectedOption2 = fueltype[0];
    whatb = 'Audi';

    dropdownBrandList.whatB = whatb;

    col = [];
    // 페이지 진입시 DB에서 차량 정보 가져오기
    goconnected();
    goconnected2();
    colorchoice();

  }

  // 브랜드 목록 드롭다운버튼 리스트를 json 으로 받는 함수
  goconnected() async {
    //carbrand.clear();
    await dropdownBrandList.getbrand();
    carbrand = dropdownBrandList.carbrand;
    print(carbrand);
    setState(() {});
  }

// 모델 목록 드롭다운버튼 리스트를 json 으로 받는 함수
  goconnected2() async {
    //carmodel.clear();
    await dropdownBrandList.getmodel();
    carmodel = dropdownBrandList.carmodel;
    print(carmodel);
    setState(() {});
  }

  colorchoice() async {
    await dropdownBrandList.whatcolor();
      col  =  dropdownBrandList.col;
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ShowResult controller = Get.put(ShowResult());

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
                            onChanged: (value){
                              dropvalue1 = value.toString();
                              dropdownBrandList.whatB = value.toString();
                              print(dropvalue1);
                              dropdownBrandList.getmodel();
                              //dropdownBrandList.carmodel = [];
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
                            items: carmodel.map((String model){
                              return DropdownMenuItem(
                                value: model,
                                child: Text(model),
                              );
                            }).toList(),
                            value: dropvalue2,
                            onChanged: (value) {
                              dropvalue2 = value!.toString();
                              dropdownBrandList.model = dropvalue2;
                              print(dropvalue2);
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
                            const Text('auto'),
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
                            const Text('manual'),
                            SizedBox(
                              width: 50,
                              child: Radio(
                                value: trantype[1],
                                groupValue: _selectedOption1,
                                onChanged: (value) {
                                  _selectedOption1 = value!;
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
                            const Text('diesel'),
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
                            const Text('gasoline'),
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
                              Text('차량 마력(ps)'),
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
                                Text('차량 연비 l/(km)'),
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
                                Text('주행 거리(km)'),
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
                              maxLength: 7,
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
                                // VM 에 변수를 넣어준다
                                controller.whatmodel = dropvalue2;
                                controller.colorpoint = initcol;
                                controller.whattrans = _selectedOption1;
                                controller.whatfuel = _selectedOption2;
                                controller.whatyear =
                                    yearEditingController.text;
                                controller.whatpower =
                                    pstextEditingController.text;
                                controller.whatcons =
                                    fueltextEditingController.text;
                                controller.whatmile =
                                    kmtextEditingController.text;
                                controller.navigater();
                                //스토리지에 추가하여 판매글 작성시 값을 넣어준다
                                box.write("brand", dropvalue1);
                                box.write("model", dropvalue2);
                                box.write("color", initcol);
                                // 수치화된걸 다시 문자로 저장
                                if(_selectedOption1 == "1") {
                                box.write("transmission", "manual");
                                }else {
                                box.write("transmission", "auto");
                                }
                                if(_selectedOption2 == "1") {
                                box.write("fueltype", "gasoline");
                                }else {
                                box.write("fueltype", "diesel");
                                }
                                box.write("year", yearEditingController.text);
                                box.write("power", pstextEditingController.text);
                                box.write("연료효율", fueltextEditingController.text);
                                box.write("mile", kmtextEditingController.text);

                                Get.to(ResultPage());
                                setState(() {});
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
