import 'package:dmentia_flutter_app/servey/survey1.dart';
import 'package:dmentia_flutter_app/servey/survey2.dart';
import 'package:dmentia_flutter_app/static/serveyStatic.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Survey1_1 extends StatefulWidget {
  const Survey1_1({super.key});

  @override
  State<Survey1_1> createState() => _Survey1_1State();
}

class _Survey1_1State extends State<Survey1_1> {
  final List<String> user_brithList = [];
  String? user_brithValue;
  final TextEditingController _answerContorller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 20; i <= 120; i++) {
      user_brithList.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '나이를 입력해 주세요',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              DropdownButton2(
                hint: Text(
                  '나이를 선택하세요',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: user_brithList
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: user_brithValue,
                onChanged: (value) {
                  usersStaticInfo.userAge = value!;
                  print('dropBox userStaticSES= ${usersStaticInfo.userAge}');
                  setState(() {
                    user_brithValue = value as String;
                  });
                },
                buttonHeight: 60,
                buttonWidth: 350,
                itemHeight: 50,
              ),
              const SizedBox(
                height: 40,
              ),
              
              Container(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                  serveyStatic.ser1 = _answerContorller.text;
                  _answerContorller.text = '';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Survey1(),
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
    );
  }
}
