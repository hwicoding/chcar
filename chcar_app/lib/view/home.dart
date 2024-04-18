import 'package:chcar_app/view/login.dart';
import 'package:chcar_app/vm/findId_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FindIdVm());
    return Login();
  }
}
