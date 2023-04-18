import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class StudentUserLogin extends StatefulWidget {
  const StudentUserLogin({super.key});

  @override
  State<StudentUserLogin> createState() => _StudentUserLoginState();
}

class _StudentUserLoginState extends State<StudentUserLogin> {
  late List data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Student'),
        backgroundColor: Colors.black,
        // actions: [
        // IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(
        //         builder: (context) {
        //           return InsertStudent();
        //         },
        //       )).then((value) => getJsonData());
        //     },
        //     icon: const Icon(Icons.add_outlined))
        // ],
      ),
      body: Center(
          child: data.isEmpty
              ? const Text('데이터가 없습니다.')
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const SelectAll(),
                        //     ));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('Code : '),
                                    Text(data[index]['code'])
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('Name : '),
                                    Text(data[index]['name'])
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('Dept : '),
                                    Text(data[index]['dept'])
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Text('Phone : '),
                                    Text(data[index]['phone'])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
    );
  }

  //function
  Future<bool> getJsonData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    //print(response.body);
    data.clear();
    var dataConvertedJSCN = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSCN['results'];
    setState(() {
      data.addAll(result);
    });
    return true;
  }
}//end