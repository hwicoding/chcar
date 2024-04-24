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
      child: Card(
          child: Row(
        children: [
          Image.network(
            writeCard.imagepath,
            width: 200,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text('${writeCard.carbrand}'),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${writeCard.carmodel}')
                ],
              ),
              Text('생산년도 : ${writeCard.year}'),
              Text('주행거리 : ${writeCard.km}km'),
              Text('판매 가격 : ${writeCard.sellprice}'),
              Text('판매자 : ${writeCard.nickname}'),
            ],
          )
        ],
      )),
    );
  }
}
