import 'package:chcar_app/vm/findPw_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindPw extends StatelessWidget {
  const FindPw({super.key});

  @override
  Widget build(BuildContext context) {
    final findpw = Provider.of<FindPwVm>(context);

    String phoneSelect = findpw.phoneSelect;
    String emailSelect = findpw.emailSelect;

    final List<String> phonelist = ['010', '011'];
    final List<String> emaillist = [
      'naver.com',
      'gmail.com',
      'daum.net',
      'yahoo.com'
    ];
    final TextEditingController idController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phone1Controller = TextEditingController();
    final TextEditingController phone2Controller = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          width: 150,
        ),
        backgroundColor: Color.fromARGB(255, 79, 139, 116),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('아이디, 이름, 전화번호, 이메일로 아이디를 찾을 수 있습니다.'),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 390,
                height: 50,
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: '아이디를 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 390,
                height: 50,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: '이름를 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 89, 89, 89),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: DropdownButton(
                            underline: SizedBox(),
                            value: phoneSelect,
                            items: phonelist.map((String phone) {
                              return DropdownMenuItem(
                                value: phone,
                                child: Text(
                                  phone,
                                  style: TextStyle(fontSize: 15),
                                ),
                              );
                            }).toList(),
                            onChanged: (newvalue) {
                              findpw.changePhone(newvalue);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      width: 140,
                      height: 50,
                      child: TextField(
                        controller: phone1Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      width: 140,
                      height: 50,
                      child: TextField(
                        controller: phone2Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: '이메일을 입력하세요',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 89, 89, 89),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: DropdownButton(
                        underline: SizedBox(),
                        value: emailSelect,
                        items: emaillist.map((String email) {
                          return DropdownMenuItem(
                            value: email,
                            child: Text(
                              email,
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          findpw.changeEmail(newvalue);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  findpw.id = idController.text;
                  findpw.name = nameController.text;
                  findpw.phone = findpw.phoneSelect +
                      phone1Controller.text +
                      phone2Controller.text;
                  findpw.email =
                      emailController.text + '@' + findpw.emailSelect;
                  findpw.findUserPw();
                },
                child: Text('비밀번호 찾기'))
          ],
        ),
      ),
    );
  }
}
