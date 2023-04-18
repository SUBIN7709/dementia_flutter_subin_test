import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmentia_flutter_app/gukhwa/location.dart';
import 'package:dmentia_flutter_app/servey/surveyStart.dart';
import 'package:dmentia_flutter_app/servey/viewChart.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:dmentia_flutter_app/subin_view/mmse_result2.dart';
import 'package:dmentia_flutter_app/subin_view/user_login.dart';
import 'package:dmentia_flutter_app/subin_view/user_login_myPage.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Center(
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
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 30, left: 20, right: 20),
                    child: Text(
                      'Dementia',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurveyStart(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '진단검사',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 280,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '간단한 문답으로 지금 진단검사 해보세요.',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right_circle,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                OutlinedButton(
                  onPressed: () {
                    chkLogin();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '기록',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 280,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '진단검사하신 기록을 다시 살펴보세요.',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right_circle,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Location(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 2.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '치매안심센터',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 280,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                '내 주변의 가까운 치매안심 센터를 찾아보세요.',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right_circle,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 70,
                // ),
                //-----------------------
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) {
                //             return MMSEResult2();
                //           },
                //         ),
                //       );
                //     },
                //     child: const Text('test all')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------- Function -------------------------
  // 23-1-13 Hosik

  chkLogin() {
    // usersStaticInfo.userId == "null"
    //     ? _showDialog(context)
    //     : Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) {
    //     return const viewChart();
    //   },
    // ));

    if (usersStaticInfo.userId == "null") {
      _showDialog(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const viewChart();
          },
        ),
      );
    }
  }

//Login_MyPage
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('기록은 로그인 하셔야 확인하실 수 있어요'),
          content: const Text('로그인 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login_MyPage();
                    },
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  } //getDementiaData

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
  }
}// END
