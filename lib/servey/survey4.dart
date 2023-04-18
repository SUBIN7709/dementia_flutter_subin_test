import 'package:dmentia_flutter_app/servey/survey5.dart';
import 'package:dmentia_flutter_app/static/serveyStatic.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Survey4 extends StatefulWidget {
  const Survey4({super.key});

  @override
  State<Survey4> createState() => _Survey4State();
}

class _Survey4State extends State<Survey4> {
  final TextEditingController _answerContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '문항 4.',
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    '몇년도 입니까?',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    controller: _answerContorller,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 176, 162, 39)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 176, 162, 39)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                    serveyStatic.ser4 = _answerContorller.text;
                    _answerContorller.text = '';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Survey5(),
                      ),
                    );
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 162, 39),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      '입력',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
