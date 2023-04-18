import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  bool _isChecked = false;

// 컬렉션(스키마)에 있는 테이블 가져오기
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('오늘의 할일을 수행해보세요.        ')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: StreamBuilder(
          // stream: _products.snapshots(),
          stream: _products.orderBy("name", descending: true).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.only(left: 30, right: 30,top: 10),
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      // subtitle: Text(documentSnapshot['price'].toString()),
                      // trailing: SizedBox(
                      //   width: 100,
                      // ),
                      // trailing: Checkbox(
                      //     value: _isChecked,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _isChecked = value!;
                      //       });
                      //     },
                      //     activeColor: Colors.green,
                      //     ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
