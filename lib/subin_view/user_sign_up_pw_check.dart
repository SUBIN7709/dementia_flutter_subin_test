import 'package:flutter/material.dart';


class UserPwCheck extends StatefulWidget {
  const UserPwCheck({super.key});

  @override
  State<UserPwCheck> createState() => _UserPwCheckState();
}

class _UserPwCheckState extends State<UserPwCheck> {
  late TextEditingController user_pwController;
  late TextEditingController user_pw2Controller;

  //late FocusNode _password1Focus;

  late String user_pw1Check;
  late String user_pw2Check;

  late String user_pw1;
  late String user_pw2;
  
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user_pwController = TextEditingController();
    user_pw2Controller = TextEditingController();

    user_pw1 = 'pw1 check';
    user_pw2 = 'pw2 check';

    //_password1Focus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user pw check test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: user_pwController,
              //focusNode: _password1Focus,
              decoration: const InputDecoration(hintText: '비밀번호를 입력하세요.'),
              onChanged: (pw1) {
                setState(() {
                  user_pw1Check = pw1;
                  print(user_pw1Check);
                  //userPW1check();
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                //key: _formKey,
                onPressed: () {
                  // if (!_formKey.currentState.validate()) {
                  //   return;
                  // }
                  // _formKey.currentState.save();
                  // print(_name);
                },
                child: Text(user_pw1)),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: user_pw2Controller,
              decoration: const InputDecoration(hintText: '비밀번호를 입력하세요.'),
              onChanged: (pw2) {
                setState(() {
                  user_pw2Check = pw2;
                  userPWcheck();
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  //--
                },
                child: Text(user_pw2)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  //--
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }

  //----function----
  userPW1check() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (value) {
        user_pw1Check = value!;
      },
    );
  }

  userPWcheck(){
    if(user_pw1Check == user_pw2Check){
      user_pw2 = '비밀번호가 동일합니다.';
    }else{
      user_pw2 = '동일한 비밀번호를 입력해주세요.';
    }
  }
}//end
