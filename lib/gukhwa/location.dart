import 'package:dmentia_flutter_app/gukhwa/call.dart';
import 'package:dmentia_flutter_app/subin_view/kakaomapscreen.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('치매안심센터'),
        backgroundColor: Color.fromARGB(255, 176, 162, 39),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '치매 안심센터 대표번호',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () async {
                final url = Uri.parse('tel: 1666-0921');
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
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
                    EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                child: Text(
                  '1666 - 0921',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                const Text(
                  '가까운 치매 안심센터 위치',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    await _openKakaoMapScreen(context);
                  },
                  child: const Icon(
                    CupertinoIcons.location_solid,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '눌러주세요.',
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openKakaoMapScreen(BuildContext context) async {
    KakaoMapUtil util = KakaoMapUtil();

    // String url = await util.getResolvedLink(
    //     util.getKakaoMapURL(37.402056, 127.108212, name: 'Kakao 본사'));

    /// This is short form of the above comment
    String url =
        await util.getMapScreenURL(37.567870, 127.006941, name: '중앙치매센터');

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  }
}
