import 'package:chcar_app/model/collect.dart';
import 'package:chcar_app/view/detail_page.dart';
import 'package:chcar_app/vm/detail_page_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListPage extends StatelessWidget {
  const CardListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('write')
          .orderBy('seq', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final documents = snapshot.data!.docs;

        return ListView(
          children: documents.map((doc) => _showCard(doc)).toList(),
        );
      },
    );
  }

  Widget _showCard(DocumentSnapshot doc) {
    final writeCard = CollectInfo(
      seq: doc['seq'],
      sellprice: doc['sellprice'],
      imagepath: doc['img_01'],
      carbrand: doc['carbrand'],
      carmodel: doc['carmodel'],
      km: doc['carkm'],
      year: doc['caryear'],
      nickname: doc['usernickname'],
    );

    return GestureDetector(
      onTap: () {
        final DetailController detailController = Get.put(DetailController());
        detailController.carSeq = writeCard.seq.toString();
        detailController.fetchWrites(writeCard.seq.toString());
        detailController.getJSONData();
        print('여기는 카드 리스트 ${writeCard.seq}');

        Get.to(DetailPage());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                    color: Color.fromARGB(255, 79, 139, 116), width: 3),
              ),
              color: Colors.white,
              shadowColor: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      writeCard.imagepath,
                      width: 200,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${writeCard.carbrand}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${writeCard.carmodel}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text('생산년도 : ${writeCard.year}', style: TextStyle()),
                      Text('주행거리 : ${writeCard.km}km', style: TextStyle()),
                      Row(
                        children: [
                          Text('판매 가격 : ', style: TextStyle()),
                          Text('${writeCard.sellprice} ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 204, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text('€', style: TextStyle())
                        ],
                      ),
                      Text('판매자 : ${writeCard.nickname}', style: TextStyle()),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
