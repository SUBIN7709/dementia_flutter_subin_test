import 'package:dmentia_flutter_app/servey/survey1.dart';
import 'package:dmentia_flutter_app/servey/survey1_1.dart';
import 'package:dmentia_flutter_app/static/serveyStatic.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Survey0 extends StatefulWidget {
  const Survey0({super.key});

  @override
  State<Survey0> createState() => _Survey0State();
}

class _Survey0State extends State<Survey0> {
  final TextEditingController _answerContorller = TextEditingController();
  final List<String> user_sexcodeList = ['남자', '여자'];
  String? user_sexcodeValue;
  final List<String> user_brithList = [];
  String? user_brithValue;
  final List<String> user_educList = [
    '고등학교 이하 졸업',
    '고등학교 졸업',
    '대학교 이하 졸업',
    '대학교 졸업',
    '대학교 졸업 이상'
  ];
  String? user_educValue;

  final List<String> user_sesList = [
    '사무직, 영업직',
    '소규모 자영업자',
    '숙련된 작업자',
    '미숙련된 작업자',
    '학생, 가정주부'
  ];
  String? user_sesValue;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton2(
                  hint: Text(
                    '성별을 선택하세요',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: user_sexcodeList
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
                  value: user_sexcodeValue,
                  onChanged: (value) {
                    usersStaticInfo.userSex = value!;
                    print(usersStaticInfo.userSex);
                    setState(() {
                      user_sexcodeValue = value as String;
                    });
                  },
                  buttonHeight: 70,
                  buttonWidth: 350,
                  itemHeight: 50,
                ),

                // DropdownButton2(
                //   hint: Text(
                //     '나이를 선택하세요',
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: Theme.of(context).hintColor,
                //     ),
                //   ),
                //   items: user_brithList
                //       .map((item) => DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(
                //               item,
                //               style: const TextStyle(
                //                 fontSize: 14,
                //               ),
                //             ),
                //           ))
                //       .toList(),
                //   value: user_brithValue,
                //   onChanged: (value) {
                //     usersStaticInfo.userAge = value!;
                //     print('dropBox userStaticSES= ${usersStaticInfo.userAge}');
                //     setState(() {
                //       user_brithValue = value as String;
                //     });
                //   },
                //   buttonHeight: 60,
                //   buttonWidth: 350,
                //   itemHeight: 50,
                // ),

                DropdownButton2(
                  hint: Text(
                    '학벌을 선택하세요',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: user_educList
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
                  value: user_educValue,
                  onChanged: (value) {
                    usersStaticInfo.userEduc = value!;
                    print(
                        'dropBox userStaticEDUC= ${usersStaticInfo.userEduc}');
                    setState(() {
                      user_educValue = value as String;
                    });
                  },
                  buttonHeight: 70,
                  buttonWidth: 350,
                  itemHeight: 50,
                ),
                const SizedBox(height: 10),
                DropdownButton2(
                  hint: Text(
                    '직업을 선택하세요',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: user_sesList
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
                  value: user_sesValue,
                  onChanged: (value) {
                    usersStaticInfo.userSes = value!;
                    print('dropBox userStaticSES= ${usersStaticInfo.userSes}');
                    setState(() {
                      user_sesValue = value as String;
                    });
                  },
                  buttonHeight: 60,
                  buttonWidth: 350,
                  itemHeight: 50,
                ),
                //////////////////////////////////
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
                        builder: (context) => Survey1_1(),
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
