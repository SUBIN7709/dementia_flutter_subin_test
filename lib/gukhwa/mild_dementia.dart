import 'package:dmentia_flutter_app/gukhwa/todo_list.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class MileDementia extends StatefulWidget {
  const MileDementia({super.key});

  @override
  State<MileDementia> createState() => _MileDementiaState();
}

class _MileDementiaState extends State<MileDementia> {
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
                Text('경도치매',
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
            const SizedBox(
              height: 65,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('매일매일 할일을 수행하며',
                  style: TextStyle(
                  fontSize: 18
                ),
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text('기억력을 향상해 보세요.',
                  style: TextStyle(
                  fontSize: 18
                ),
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoList(),
                  ),
                );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 176, 162, 39),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    '다음',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}