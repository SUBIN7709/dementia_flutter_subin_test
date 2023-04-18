import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file/memory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // 컬렉션(스키마)에 있는 테이블 가져오기
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  final TextEditingController _nameContorller = TextEditingController();
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
                  controller: _nameContorller,
                  // decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Colors.black, // Text Color (Foreground color)
                    ),
                    child: const Text('등록'),
                    onPressed: () async {
                      final String name = _nameContorller.text;
                      // final double? price =
                      //     double.tryParse(_priceController.text);
                      if (name != null) {
                        await _products
                            .add({"name": name, "timestamp": Timestamp.now()});
                        _nameContorller.text = '';
                        _priceController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameContorller.text = documentSnapshot['name'];
      // _priceController.text = documentSnapshot['price'].toString();
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
                  controller: _nameContorller,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Colors.black, // Text Color (Foreground color)
                    ),
                    child: const Text('수정'),
                    onPressed: () async {
                      final String name = _nameContorller.text;
                      // final double? price =
                      //     double.tryParse(_priceController.text);
                      if (name != null) {
                        await _products.doc(documentSnapshot!.id)
                            // .update({"name": name, "price": price});
                            .update({"name": name});
                        _nameContorller.text = '';
                        // _priceController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  ),
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
    return Scaffold(
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Center(
                child: Text('오늘의 할일'),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 176, 162, 39)),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: StreamBuilder(
            stream: _products.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(documentSnapshot['name']),
                        ),
                        subtitle: Text(
                          documentSnapshot['timestamp']
                              .toDate()
                              .toLocal()
                              .toString()
                              .substring(5, 16),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  // icon: const Icon(Icons.edit),
                                  icon: const Icon(CupertinoIcons.pencil),
                                  onPressed: () => _update(documentSnapshot)),
                              IconButton(
                                  // icon: const Icon(Icons.edit),
                                  icon: const Icon(CupertinoIcons.delete),
                                  onPressed: () => _delete(documentSnapshot.id)),
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
        ),
// Add new product
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () => _create(),
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
