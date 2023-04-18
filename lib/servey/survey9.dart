import 'dart:convert';

import 'package:dmentia_flutter_app/servey/resultServey.dart';
import 'package:dmentia_flutter_app/servey/survey10.dart';
import 'package:dmentia_flutter_app/static/serveyStatic.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Survey9 extends StatefulWidget {
  const Survey9({super.key});

  @override
  State<Survey9> createState() => _Survey9State();
}

class _Survey9State extends State<Survey9> {
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
                  '문항 9.',
                  style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    '대한민국의 수도는 어디인가요?',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Image.network(
                  'https://a.storyblok.com/f/112937/567x464/b521a9ee4b/visit_seoul_web.jpg/m/620x0/filters:quality(70)/',
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
                    serveyStatic.ser8 = _answerContorller.text;
                    _answerContorller.text = '';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Survey10(),
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
