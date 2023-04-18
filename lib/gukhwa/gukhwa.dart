import 'package:dmentia_flutter_app/gukhwa/call.dart';
import 'package:dmentia_flutter_app/gukhwa/chatting.dart';
import 'package:dmentia_flutter_app/gukhwa/checkList.dart';
import 'package:dmentia_flutter_app/servey/surveyStart.dart';
import 'package:flutter/material.dart';

class Gukhwa extends StatefulWidget {
  const Gukhwa({super.key});

  @override
  State<Gukhwa> createState() => _GukhwaState();
}

class _GukhwaState extends State<Gukhwa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문 페이지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => Survey1(),
                    builder: (context) => SurveyStart(),
                  ),
                );
              },
              child: const Text('설문지'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Call(),
                  ),
                );
              },
              child: const Text('Call'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckList(),
                  ),
                );
              },
              child: const Text('Check List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text('Chatting'),
            ),
          ],
        ),
      ),
    );
  }
}
