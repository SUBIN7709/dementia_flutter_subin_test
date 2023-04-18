import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class Normal extends StatefulWidget {
  const Normal({super.key});

  @override
  State<Normal> createState() => _NormalState();
}

class _NormalState extends State<Normal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('당신의 진단결과는',
              style: TextStyle(
                fontSize: 20
              ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('정상',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 240, 184, 19)
                ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('입니다.',
                style: TextStyle(
                fontSize: 20
              ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}