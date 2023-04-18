import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  late TextEditingController user_idController; //user id insert TextField
  late TextEditingController user_pwController;
  late TextEditingController user_pwCheckController;
  late TextEditingController user_nameController;

  final List<String> user_brithList = [];
  String? user_brithValue;

  final List<String> user_sexcodeList = ['남자', '여자'];
  String? user_sexcodeValue;

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

  late String id;
  late String pw;
  late String name;
  late String birth;
  late String sexcode;
  late String educ;
  late String ses;

  late String user_pw1Check;
  late String user_pw2Check;
  late String pwCheck;
  late Color pwCheckColor;

  //late int userIDcheck;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_idController = TextEditingController();
    user_pwController = TextEditingController();
    user_pwCheckController = TextEditingController();
    user_nameController = TextEditingController();

    pwCheck = '비번 확인 text';

    pwCheckColor = Colors.white;

    // for (int i = 1900;
    //     i <= int.parse(DateTime.now().toString().substring(0, 4));
    //     i++) {
    //   user_brithList.add(i.toString());
    // }
    for (int i = 20; i <= 120; i++) {
      user_brithList.add(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                TextField(
                  controller: user_idController,
                  decoration: const InputDecoration(
                    hintText: '아이디를 입력하세요',
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
                const SizedBox(height: 10),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: TextButton.icon(
                //       onPressed: () {
                //         //userIDcheck();
                //       },
                //       icon: const Icon(
                //         Icons.check,
                //         size: 30,
                //         color: Colors.grey,
                //       ),
                //       label: const Text(
                //         '아이디 중복 확인',
                //         style: TextStyle(color: Colors.black),
                //       )),
                // ),
                const SizedBox(height: 10),
                TextField(
                    obscureText: true,
                    controller: user_pwController,
                    decoration: const InputDecoration(
                      hintText: '비밀번호를 입력하세요',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 176, 162, 39)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 176, 162, 39)),
                      ),
                    ),
                    onChanged: (pw1) {
                      setState(() {
                        user_pw1Check = pw1;
                        print(user_pw1Check);
                        //userPW1check();
                      });
                    }),
                const SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  controller: user_pwCheckController,
                  decoration: const InputDecoration(
                    hintText: '비밀번호 중복 확인',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 176, 162, 39)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 176, 162, 39)),
                    ),
                  ),
                  onChanged: (pw2) {
                    setState(() {
                      user_pw2Check = pw2;
                      userPWcheck();
                    });
                  },
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      pwCheck,
                      style: TextStyle(color: pwCheckColor),
                    )),
                const SizedBox(height: 10),
                TextField(
                  controller: user_nameController,
                  decoration: const InputDecoration(
                    hintText: '이름을 입력하세요',
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
                    setState(() {
                      user_brithValue = value as String;
                    });
                  },
                  buttonHeight: 70,
                  buttonWidth: 350,
                  itemHeight: 50,
                ),
                const SizedBox(height: 10),
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
                    setState(() {
                      user_sexcodeValue = value as String;
                    });
                  },
                  buttonHeight: 70,
                  buttonWidth: 350,
                  itemHeight: 50,
                ),
                const SizedBox(height: 10),
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
                    setState(() {
                      user_sesValue = value as String;
                    });
                  },
                  buttonHeight: 60,
                  buttonWidth: 350,
                  itemHeight: 50,
                ),
                const SizedBox(height: 35),
                // ElevatedButton(
                //   onPressed: () {
                //     //--null--
                //     if (user_idController.text.trim().isEmpty ||
                //         user_pwController.text.trim().isEmpty ||
                //         user_nameController.text.trim().isEmpty ||
                //         user_brithValue!.trim().isEmpty ||
                //         user_sexcodeValue!.trim().isEmpty ||
                //         user_educValue!.trim().isEmpty ||
                //         user_sesValue!.trim().isEmpty) {
                //       print('null');
                //       // ScaffoldMessenger.of(context).showSnackBar(
                //       //   const SnackBar(
                //       //     content: Text(
                //       //       '모든 정보를 입력하세요.',
                //       //       style: TextStyle(
                //       //         color: Colors.white,
                //       //         fontSize: 20
                //       //         ),
                //       //       ),
                //       //     duration: Duration(seconds: 2),
                //       //     backgroundColor: Colors.black,
                //       //   ),
                //       //);
                //       _shownullDialog(context);
                //     } else {
                //       print('not null');
                //       id = user_idController.text;
                //       pw = user_pwController.text;
                //       name = user_nameController.text;
                //       birth = user_brithValue!;
                //       sexcode = user_sexcodeValue!;
                //       educ = user_educValue!;
                //       ses = user_sesValue!;
                //       print(id);
                //       print(ses);
                //       getDementiaData();
                //     }
                //   },
                //   child: const Text('회원가입'),
                // ),
                Container(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      //--null--
                      if (user_idController.text.trim().isEmpty ||
                          user_pwController.text.trim().isEmpty ||
                          user_nameController.text.trim().isEmpty ||
                          user_brithValue!.trim().isEmpty ||
                          user_sexcodeValue!.trim().isEmpty ||
                          user_educValue!.trim().isEmpty ||
                          user_sesValue!.trim().isEmpty) {
                        print('null');
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text(
                        //       '모든 정보를 입력하세요.',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 20
                        //         ),
                        //       ),
                        //     duration: Duration(seconds: 2),
                        //     backgroundColor: Colors.black,
                        //   ),
                        //);
                        _shownullDialog(context);
                      } else {
                        print('not null');
                        id = user_idController.text;
                        pw = user_pwController.text;
                        name = user_nameController.text;
                        birth = user_brithValue!;
                        sexcode = user_sexcodeValue!;
                        educ = user_educValue!;
                        ses = user_sesValue!;
                        print(id);
                        print(ses);
                        getDementiaData();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 162, 39),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      '가입하기',
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

  //----function----

  UserPw1Check(String user_pwController) {} //UserPw1Check

  _shownullDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('입력결과'),
          content: const Text(
            '모든 정보를 입력헤 주세요.',
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  } //_shownullDialog

  getDementiaData() async {
    var url = Uri.parse(
        'http://localhost:8080/Dementia/dementia_insert_flutter.jsp?user_id=$id&user_pw=$pw&user_name=$name&user_brith=$birth&user_sex=$sexcode&user_educ=$educ&user_ses=$ses');

    await http.get(url);
    _showDialog(context);
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('입력결과'),
          content: const Text('입력이 완료 되었습니다.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  } //getDementiaData

  userPWcheck() {
    if (user_pw1Check == user_pw2Check) {
      pwCheck = '비밀번호가 동일합니다.';
      pwCheckColor = Colors.green;
    } else {
      pwCheck = '동일한 비밀번호를 입력해주세요.';
      pwCheckColor = Colors.red;
    }
  } //userPWcheck

  // userIDcheck() async{
  //   var url = Uri.parse('http://localhost:8080/Dementia/dementia_selectid_dlutter.jsp');
  //   var response = await http.get(url);

  //   var dateConvertedJSCN = json.decode(utf8)
  // } //userIDcheck
} //end
