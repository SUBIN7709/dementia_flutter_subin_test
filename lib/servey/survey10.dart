import 'dart:convert';

import 'package:dmentia_flutter_app/gukhwa/mild_dementia.dart';
import 'package:dmentia_flutter_app/gukhwa/normal.dart';
import 'package:dmentia_flutter_app/gukhwa/severe_dementia.dart';
import 'package:dmentia_flutter_app/servey/resultServey.dart';
import 'package:dmentia_flutter_app/static/serveyStatic.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Survey10 extends StatefulWidget {
  const Survey10({super.key});

  @override
  State<Survey10> createState() => _Survey10State();
}

class _Survey10State extends State<Survey10> {
  final TextEditingController _answerContorller = TextEditingController();

  late Map<String, List<String>> todayMap;
  late String result;
  late List<int> aiNeedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aiNeedValue = [];
    chgStaticPoint();
    print(aiNeedValue);
  }

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
                  '문항 10.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    '12 - 7 =  ?',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    '위 식의 답을 적어주세요.',
                    style: TextStyle(fontSize: 18),
                  ),
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
                      submitServey();

                      getJSONData();
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

// ------------------------- Function -------------------------

//23-1-12 Hosik
//change Static value  -> int value
  chgStaticPoint() {
    int educ = 0;
    switch (usersStaticInfo.userEduc) {
      case '고등학교 이하 졸업':
        educ = 1;
        break;
      case '고등학교 졸업':
        educ = 2;
        break;
      case '대학교 이하 졸업':
        educ = 3;
        break;
      case '대학교 졸업':
        educ = 4;
        break;
      case '대학교 졸업 이상':
        educ = 5;
        break;
      default:
        educ = 0;
    }
    int usergenderValue;
    usersStaticInfo.userSex != "여자" ? usergenderValue = 1 : usergenderValue = 0;

    int ses = 0;
    switch (usersStaticInfo.userSes) {
      case '학생, 가정주부':
        ses = 1;
        break;
      case '미숙련된 작업자':
        ses = 2;
        break;
      case '숙련된 작업자':
        ses = 3;
        break;
      case '소규모 자영업자':
        ses = 4;
        break;
      case '사무직, 영업직':
        ses = 5;
        break;
      default:
        ses = 0;
    }
    aiNeedValue.add(educ);
    aiNeedValue.add(usergenderValue);
    aiNeedValue.add(ses);
  }

// 23-1-11 Hosik
  submitServey() {
    // 나중에 반복문으로 바꿔보든가 하자 일단 복붙으로 해결 ㅠㅠ
    int mmseState = 0;
    String dateNow = DateTime.now().toString();
    serveyStatic.ser1 == DateTime.now().toString().substring(8, 10)
        ? mmseState = mmseState + 3
        : mmseState = mmseState + 0;
    String whatToday = DateFormat('EEEE').format(DateTime.now()).toString();
    serveyStatic.ser2 == whatToday ? mmseState = mmseState + 3 : mmseState + 0;
    //print(todayMap[whatToday].); 나중에 any 찾아볼것
    serveyStatic.ser3 == dateNow.substring(5, 7)
        ? mmseState = mmseState + 3
        : mmseState + 0;
    serveyStatic.ser4 == dateNow.substring(0, 4)
        ? mmseState = mmseState + 3
        : mmseState + 0;
    serveyStatic.ser5 == '수박' ? mmseState = mmseState + 3 : mmseState + 0;
    serveyStatic.ser6 == '대한민국' ? mmseState = mmseState + 3 : mmseState + 0;
    serveyStatic.ser7 == dateNow.substring(11, 13)
        ? mmseState = mmseState + 3
        : mmseState + 0;
    serveyStatic.ser8 == "무궁화" ? mmseState = mmseState + 3 : mmseState + 0;
    serveyStatic.ser9 == "서울" ? mmseState = mmseState + 3 : mmseState + 0;
    serveyStatic.ser10 == 5 ? mmseState = mmseState + 3 : mmseState + 0;
    getFireBaseData();

    usersStaticInfo.userResultMMSE = mmseState;
  }

  getFireBaseData() {
    FirebaseFirestore.instance.collection('surveyResults').add(
      {
        'Age': usersStaticInfo.userAge,
        'EDUC': usersStaticInfo.userEduc,
        'MMSE': usersStaticInfo.userResultMMSE,
        'SES': usersStaticInfo.userSes,
        'SexCode': usersStaticInfo.userSex,
        // 'date': DateTime.now(),
        'date': DateTime.parse(DateTime.now().toString().substring(0, 16)),
        'user_id': usersStaticInfo.userId,
      },
    );
  } // Firebase upload END

  getJSONData() async {
    String Age = usersStaticInfo.userAge;
    String SexCode = aiNeedValue[1].toString();
    int MMSE = usersStaticInfo.userResultMMSE;
    String SES = aiNeedValue[2].toString();
    String EDUC = aiNeedValue[0].toString();
    var url = Uri.parse(
        'http://localhost:8080/Rserve/test_dementia.jsp?Age=$Age&SexCode=$SexCode&MMSE=$MMSE&SES=$SES&EDUC=$EDUC');
    var response = await http.get(url);
    print('url = $url');

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      // var dataConvertedJSON = await json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      if (result == "1") {
        result = "치매";
      } else if (result == "0.5") {
        result = "경증 치매";
      } else if (result == "0") {
        result = "정상";
      } else {
        result = result;
      }
      print('설문지 다 끝나고 나오는 치매 증상 결과 = $result');
    });
    for (int i = 0; i <= 12; i++) {
      Navigator.pop(context);
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => resultServey(result),
    //   ),
    // );
    // result == "치매"
    //     ? Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const SevereDementia(),
    //         ),
    //       )
    //     : result == "경증 치매"
    //         ? Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const MileDementia(),
    //             ),
    //           )
    //         : Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const Normal(),
    //             ),
    //           );
    switch (result) {
      case "치매":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SevereDementia(),
          ),
        );
        break;
      case "경증 치매":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MileDementia(),
          ),
        );
        break;
      case "정상":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Normal(),
          ),
        );
        break;
    }
  }

// ------------------------- Function END -------------------------
} // END

// final List<String> monday = [
//       '월요일',
//       '월',
//       '월요',
//       'mon',
//       'Mon',
//       'monday',
//       'Monday'
//     ];
//     final List<String> tuesday = [
//       '화요일',
//       '화',
//       '화요',
//       'tue',
//       'tuesday',
//       'Tuesday'
//     ];
//     final List<String> wednesday = [
//       '수',
//       '수요일',
//       '수요',
//       'wed',
//       'wednesday',
//       'Wednesday'
//     ];
//     final List<String> thursday = ['목', '목요일', '목요', 'thursday', 'Thursday'];
//     final List<String> friday = ['금', '금요일', '금요', 'fri', 'friday', 'Friday'];
//     final List<String> saturday = [
//       '토요일',
//       '토',
//       '토요',
//       'sat',
//       'saturday',
//       'Saturday'
//     ];
//     final List<String> sunday = ['일', '일요일', '일요', 'sun', 'sunday', 'Sundaoy'];

//     Map<String, List<String>> todayMap = {
//       'monday': monday,
//       'tuesday': tuesday,
//       'wedneday': wednesday,
//       'thursday': thursday,
//       'friday': friday,
//       'saturday': saturday,
//       'sunday': sunday,
//     };
