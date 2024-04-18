import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PredictPage extends StatelessWidget {
  const PredictPage({super.key});

  @override
  Widget build(BuildContext context) {
      final TextEditingController pstextEditingController = TextEditingController();
      final TextEditingController fueltextEditingController = TextEditingController();
      final TextEditingController kmtextEditingController = TextEditingController();

      
      
    
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          width: 150,
        ),
        backgroundColor: Color.fromARGB(255, 79, 139, 116),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GestureDetector(
        onTap: () =>  FocusScope.of(context),
        child: SingleChildScrollView(
          child: GetBuilder(
          
            builder: (controller) {
                
            },
            ),
        ),
      ),
    );
  }
}