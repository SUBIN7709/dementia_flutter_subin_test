import 'package:dmentia_flutter_app/Home.dart';
import 'package:dmentia_flutter_app/firebase_options.dart';
import 'package:dmentia_flutter_app/splash.dart';
import 'package:dmentia_flutter_app/subin_view/user_login_myPage.dart';
import 'package:dmentia_flutter_app/subin_view/user_myPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // ******************************************** firebase ********************************************
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ******************************************** firebase ********************************************
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const Home(),
        '/MyPage': (context) => const Login_MyPage(),
        '/splash': (context) => const Splash(),
      },
    );
  }
}
