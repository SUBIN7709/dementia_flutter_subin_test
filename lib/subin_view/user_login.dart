import 'dart:convert';

import 'package:dmentia_flutter_app/Home.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:dmentia_flutter_app/subin_view/user_sign_up.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> with WidgetsBindingObserver {
  late AppLifecycleState _lastLifeCycleState;
  late TextEditingController user_idController; //user id insert TextField
  late TextEditingController user_pwController;
  late List data;
  late String setUser_id;
  late String setUser_pw;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    // TODO: implement initState
    super.initState();
    user_idController = TextEditingController();
    user_pwController = TextEditingController();
    setUser_id = '';
    setUser_pw = '';
    data = [];
    _initSharedPreferences();
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('로그인'),
          backgroundColor: Color.fromARGB(255, 176, 162, 39)),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: user_idController,
                  decoration: const InputDecoration(
                    hintText: '아이디를 입력하세요.',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 176, 162, 39)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 176, 162, 39)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  controller: user_pwController,
                  decoration: const InputDecoration(
                    hintText: '비밀번호를 입력하세요.',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 176, 162, 39)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 176, 162, 39)),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       getJsonDataLoginChk(
                //           user_idController.text, user_pwController.text);
                //     },
                //     child: const Text('로그인하기')),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      getJsonDataLoginChk(
                          user_idController.text, user_pwController.text);
                      // _loginFail(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 162, 39),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      '로그인',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserSignUp(),
                        ),
                      );
                    },
                    child: Text('회원가입'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// -------------------- Function --------------------
// 23-1-11

  Future getJsonDataLoginChk(final input_user_id, final input_user_pw) async {
    var url = Uri.parse(
        //'http://192.168.10.81:8080/Dementia/dementia_login_chk.jsp?user_id=$input_user_id&user_pw=$input_user_pw');
        'http://localhost:8080/Dementia/dementia_login_chk.jsp?user_id=$input_user_id&user_pw=$input_user_pw');

    var response = await http.get(url);

    data.clear();
    var dateConvertedJSON = json.decode(
      utf8.decode(
        response.bodyBytes,
      ),
    );

    List result = dateConvertedJSON['results'];
    data.addAll(result);
    print(' data == >$data');

    if (data.isNotEmpty) {
      usersStaticInfo.userId = data[0]['user_id'];
      usersStaticInfo.userName = data[0]['user_name'];
      usersStaticInfo.userEduc = data[0]['user_educ'];
      usersStaticInfo.userSes = data[0]['user_ses'];
      usersStaticInfo.userSex = data[0]['user_sex'];
      usersStaticInfo.userbirth = data[0]['user_brith'];

      setUser_pw = data[0]['user_pw'];
      setUser_id = data[0]['user_id'];

      _initSharedPreferences();

      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Home();
        },
      ));
    } else {
      _loginFail(context);
    }
    return true;
  } // getJsonDataLoginChk END

  _loginFail(BuildContext context) {
    // 로그인 실패시
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap the button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('로그인 실패'),
          content: const Text('아이디와 비밀번호를 다시 확인해 주세요'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(' 뒤로가기 '),
            ),
          ],
        );
      },
    );
  } // _showDialog END

  _initSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('userId', setUser_id);
    pref.setString('userPw', setUser_pw);
  } //  _initSharedPreferences END

  // --------------------Function END--------------------
}// END
