import 'package:dmentia_flutter_app/servey/viewChart.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class resultServey extends StatefulWidget {
  final String result;

  const resultServey(this.result);

  @override
  State<resultServey> createState() => _resultServeyState();
}

class _resultServeyState extends State<resultServey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            usersStaticInfo.userName == "null"
                ? Text(
                    '입력하신 결과는 = ${widget.result}',
                  )
                : Text('${usersStaticInfo.userName}님의 결과는 :  ${widget.result}'),
            const Text('입력하신 답안'),
            Text('입력하신 나이는 : ${usersStaticInfo.userAge}'),
            Text('입력하신 학력은 : ${usersStaticInfo.userEduc}'),
            Text('입력하신 경제력은 : ${usersStaticInfo.userSes}'),
            Text('입력하신 성별은 : ${usersStaticInfo.userSex}'),
            Text('설문 점수는 : ${usersStaticInfo.userResultMMSE}'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            usersStaticInfo.userName == "null"
                ? ElevatedButton(
                    onPressed: () {
                      _shownullDialog(context);
                    },
                    child: const Text('Chart 보기!'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const viewChart(),
                        ),
                      );
                    },
                    child: const Text('Chart 보기!'),
                  ),
          ],
        ),
      ),
    );
  }

// --------------------- Function ---------------------
// 23-1-12 Hosik
  _shownullDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('입력결과'),
          content: const Text(
            'Chart는 로그인한 회원만 보실 수 있어요 \n\n 로그인 하시겠습니까?',
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.pop(context);
                },
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("No"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, '/MyPage');
                        },
                        child: const Text('Yes')),
                  ],
                ))
          ],
        );
      },
    );
  } //_shownullDialog
}//END
