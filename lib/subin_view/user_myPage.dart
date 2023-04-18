import 'package:dmentia_flutter_app/gukhwa/location.dart';
import 'package:dmentia_flutter_app/servey/viewChart.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  //로그린후 마이페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My Page'),
      // ),
      body:
          // Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("images/login.png"),
          //         fit: BoxFit.cover,
          //         opacity: 0.3)),
          // child: Column(
          Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 35,
            // ),
            Row(
              children: [
                const CircleAvatar(
                  // backgroundImage: AssetImage('images/image1.png'),
                  radius: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${usersStaticInfo.userId} 님 환영합니다',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // const Divider( // 줄
            //       height: 20,
            //       color: Colors.black38,
            //       thickness: 0.5,
            //     ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MyProfile(),
                    //     )
                    //   );
                    // Navigator.pushNamed(context, '/profile')
                    //     .then((value) => rebuildData());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 162, 39),
                      foregroundColor: Colors.black),
                  child: const Text('프로필 보기',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),

            const SizedBox(
              height: 35,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const viewChart(),
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
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 5),
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
                            style: TextStyle(fontSize: 12, color: Colors.black),
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
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 5),
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
                            style: TextStyle(fontSize: 12, color: Colors.black),
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
          ],
        ),
      ),
      // )
    );
  }
}
