import 'package:dmentia_flutter_app/servey/survey0.dart';
import 'package:dmentia_flutter_app/servey/survey1.dart';
import 'package:dmentia_flutter_app/servey/survey1_1.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';

class SurveyStart extends StatefulWidget {
  const SurveyStart({super.key});

  @override
  State<SurveyStart> createState() => _SurveyState();
}

class _SurveyState extends State<SurveyStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  print('Outlined Button');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 176, 162, 39), width: 2.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      Image.asset(
                  'images/note.png',
                ),
                const SizedBox(
                  height: 10,
                ),
                      const Text(
                        '설문지',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '당신의 치매 지수를 판단하는 설문지 입니다.\n\n총 10개의 문항입니다.',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         // builder: (context) => Survey1(),
            //         builder: (context) => usersStaticInfo.userName == "null"
            //             ? Survey0()
            //             : Survey1_1(),
            //       ),
            //     );
            //   },
            //   child: const Text('설문지'),
            // )
            Container(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => Survey1(),
                    builder: (context) => usersStaticInfo.userName == "null"
                        ? Survey0()
                        : Survey1_1(),
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
                    '설문하기',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// usersStaticInfo.userName == "null"
//                   ? ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return UserLogin();
//                             },
//                           ),
//                         );
//                       },
//                       child: Text(
//                         'User Login Test',
//                       ),
//                     )
//                   : Text('${usersStaticInfo.userName} 님 환영합니다'),

