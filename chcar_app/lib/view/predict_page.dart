import 'package:chcar_app/view/predict_result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';


class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  State<PredictPage> createState() => _PredictPageState();
}

class _PredictPageState extends State<PredictPage> {
  late TextEditingController pstextEditingController;
  late TextEditingController fueltextEditingController;
  late TextEditingController kmtextEditingController;
  late List<String> trantype;
  late List<String> fueltype;

  late List<String> brand;
  late String brandValue;

  late List<String> model;
  late String modelValue;
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    pstextEditingController = TextEditingController();
    fueltextEditingController = TextEditingController();
    kmtextEditingController = TextEditingController();

    trantype = ["오토", "메뉴얼"];
    fueltype = ["디젤", "가솔린"];
    brand = [
      'Audi',
      'BMW',
      'Ford',
      'hyundai',
      'Kia',
      'mercede_benz',
      'Opel',
      'Renault',
      'VW',
      'volvo',
      'Skoda',
      'SEAT'
    ];
    model = [
      'Audi_A3',
      'Audi_A4',
      'Audi_A6',
      'BMW_118',
      'BMW_320',
      'BMW_X1',
      'Ford_Fiestadata',
      'Ford_Focusdata',
      'Ford_Mondeodata',
      '',
    ];

// 라디오버튼 선택값
    _selectedOption = '';
  }

  //   getJSONData() async {
  //   var url = Uri.parse(
  //       'http://localhost:8080/Flutter/JSP/student_query_flutter.jsp');
  //   var response = await http.get(url);
  //   var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //   List result = dataConvertedJSON['results'];
  //   data.addAll(result);
  //   setState(() {});
  // }

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
      body: GestureDetector(
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
                          Icons.star,
                          color: Colors.red,
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
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            _selectedOption = value!;
                            setState(() {});
                          },
                        ),
                      ),
                      const Text('메뉴얼'),
                      SizedBox(
                        width: 50,
                        child: Radio(
                          value: trantype[1],
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            _selectedOption = value!;
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
                          Icons.star,
                          color: Colors.red,
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
                      Text('디젤'),
                      SizedBox(
                        width: 60,
                        child: Radio(
                          value: trantype[0],
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            _selectedOption = value!;
                            setState(() {});
                          },
                        ),
                      ),
                      Text('가솔린'),
                      SizedBox(
                        width: 50,
                        child: Radio(
                          value: trantype[1],
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            _selectedOption = value!;
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
                          Icons.star,
                          color: Colors.red,
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
                      height: 30,
                      child: TextField(
                        controller: pstextEditingController,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
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
                            Icons.star,
                            color: Colors.red,
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
                      height: 30,
                      child: TextField(
                        controller: fueltextEditingController,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
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
                            Icons.star,
                            color: Colors.red,
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
                      height: 30,
                      child: TextField(
                        controller: kmtextEditingController,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to( ResultPage());
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
