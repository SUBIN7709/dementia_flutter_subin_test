import 'package:dmentia_flutter_app/gukhwa/location.dart';
import 'package:dmentia_flutter_app/servey/surveyStart.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:dmentia_flutter_app/subin_view/user_login.dart';
import 'package:dmentia_flutter_app/subin_view/user_myPage.dart';
import 'package:dmentia_flutter_app/subin_view/user_sign_up.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login_MyPage extends StatefulWidget {
  const Login_MyPage({super.key});

  @override
  State<Login_MyPage> createState() => _Login_MyPageState();
}

class _Login_MyPageState extends State<Login_MyPage> {
  //로그인전 마이페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('로그인전 마이페이지'),
        // ),
        body: usersStaticInfo.userName == "null"
            ? Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return UserLogin();
                                  },
                                ));
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              child: const Text(
                                '로그인',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 176, 162, 39)),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return UserSignUp();
                                  },
                                ));
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              child: const Text(
                                '회원가입',
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 35,
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
                          side: const BorderSide(
                              color: Color.fromARGB(255, 176, 162, 39)  ,
                              width: 2.0),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '진단검사',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 280,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Location(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '치매안심센터',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 280,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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

                      //-------------------------------------------
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.push(context, MaterialPageRoute(
                      //         builder: (context) {
                      //           return MyPage();
                      //         },
                      //       ));
                      //     },
                      //     child: const Text('로그인 후 mypage')),
                    ],
                  ),
                ),
              )
            : MyPage());
  }
}
