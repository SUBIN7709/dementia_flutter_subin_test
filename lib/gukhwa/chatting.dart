
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String kakao_id = '';
  // 컬렉션(스키마)에 있는 테이블 가져오기
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _products = FirebaseFirestore.instance.collection('chat_test');
  final TextEditingController _priceController = TextEditingController();

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(           
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'message',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String message = _priceController.text;
                    if (message != null) {
                      await _products.add({"kakao_id": kakao_id, "message": message, "timestamp":Timestamp.now() }); // 여기서 collection을 추가 
                                                                           // collection을 add 해야함 
                                                                           // collection.add
                                                                           // 오늘체크 문서저장 (문서 id 날짜 정보 들어감)
                                                                           // 오늘 체크를 했는지 여부
                                                                           //  - 체크한 데이터가 있으면 업데이트
                                                                           //  - 없으면 생성 
                      _priceController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _priceController.text = documentSnapshot['message'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String message = _priceController.text;
                    if (message != null) {
                      await _products
                          .doc(documentSnapshot!.id)
                          .update({"kakao_id": kakao_id, "message": message});
                      _priceController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
 
  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    String? user = ModalRoute.of(context)?.settings.arguments.toString();
    if(user != null){

    kakao_id = user;
    }
    
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Firebase Firestore')),
        ),
        body: StreamBuilder(
          stream: _products.orderBy("timestamp", descending: false).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Container(
                    
                    child: Card(

                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        
                        title: Text(documentSnapshot['kakao_id'] , textAlign: documentSnapshot['kakao_id'] == kakao_id ? TextAlign.right : TextAlign.left),
                        subtitle: Column(
                          crossAxisAlignment: documentSnapshot['kakao_id'] == kakao_id ? CrossAxisAlignment.end :CrossAxisAlignment.start,
                          children: [
                            Text(documentSnapshot['message']),
                            Text(documentSnapshot['timestamp'].toDate().toLocal().toString().substring(5,16)),
                          ],
                        ),
                      ),
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
// Add new product
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
