import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전화걸기'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final url = Uri.parse('tel:+1 555 010 999'); // 전화번호 변경해야함 
            if (await canLaunchUrl(url)) {
              launchUrl(url);
            } else {
              // ignore: avoid_print
              print("Can't launch $url");
            }
          },
          child: const Text('Tel'),
        ),
      ),
    );
  }
}