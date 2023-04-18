import 'dart:convert';

import 'package:dmentia_flutter_app/servey/resultServey.dart';
import 'package:dmentia_flutter_app/servey/survey9.dart';
import 'package:dmentia_flutter_app/static/serveyStatic.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Survey8 extends StatefulWidget {
  const Survey8({super.key});

  @override
  State<Survey8> createState() => _Survey8State();
}

class _Survey8State extends State<Survey8> {
  final TextEditingController _answerContorller = TextEditingController();

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
                  '문항 8.',
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
                    '대한민국을 대표하는 꽃의 이름은 무엇인가요? ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                  'https://images.immediate.co.uk/production/volatile/sites/10/2019/04/blooming-direct-hibiscus-syriacus-starburst-chiffon-2048-1365-63d24f5.jpg',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40,top: 20),
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
                    serveyStatic.ser8 = _answerContorller.text;
                    _answerContorller.text = '';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Survey9(),
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
} // END
