import 'package:dmentia_flutter_app/gukhwa/gukhwa.dart';
import 'package:dmentia_flutter_app/gukhwa/home_view.dart';
import 'package:dmentia_flutter_app/servey/surveyStart.dart';
import 'package:dmentia_flutter_app/subin_view/mmse_result2.dart';
import 'package:dmentia_flutter_app/subin_view/user_login_myPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedScreenIndex = 1;
  final List _screens = [
    const SurveyStart(),
    const HomeView(),
    //const Gukhwa(),
    const Login_MyPage(),
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('dementia home.'),
      // ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: "진단검사"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          //BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: "보호자"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "MY"),
        ],
      ),
    );
  }
}
