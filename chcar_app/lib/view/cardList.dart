import 'package:chcar_app/model/card.dart';
import 'package:chcar_app/vm/mainCardList_vm.dart';
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
    final writeCard = WriteCard(
      seq: doc['seq'],
      id: doc['id'],
      carSeq: doc['carseq'],
      sellprice: doc['sellprice'],
      imagepath: doc['img_01'],
    );

    return GetBuilder<CardListVm>(
      initState: (state) {},
      builder: (controller) {
        String nickname = '';
        controller.findUserId(writeCard.id, nickname);
        print(nickname);
        return Card(
            child: Row(
          children: [
            Image.network(
              writeCard.imagepath,
              width: 200,
            ),
            Column(
              children: [
                Text('판매 가격 : ${writeCard.sellprice}'),
                Text('작성자 아이디 ${writeCard.id}'),
                //Text('작성자 닉네임 ${nickname}'),
              ],
            )
          ],
        ));
      },
    );
  }
}
