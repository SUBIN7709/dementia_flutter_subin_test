import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      // Navigator.pushReplacementNamed(context, '/');
      Navigator.of(context).pop();
      // Navigator.pushNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
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
                  padding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
                  child: Text(
                    'Dementia',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'images/dementia.png',
                  width: 90,
                  height: 90,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
