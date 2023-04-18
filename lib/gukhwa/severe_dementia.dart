import 'package:dmentia_flutter_app/subin_view/kakaomapscreen.dart';
import 'package:file/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:url_launcher/url_launcher.dart';

class SevereDementia extends StatefulWidget {
  const SevereDementia({super.key});

  @override
  State<SevereDementia> createState() => _SevereDementiaState();
}

class _SevereDementiaState extends State<SevereDementia> {
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
                Text('중증치매',
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
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('가까운 치매 안심센터에 방문하여 ',
                  style: TextStyle(
                  fontSize: 18
                ),
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text('전문의와 상담을 권유드립니다.',
                  style: TextStyle(
                  fontSize: 18
                ),
                  ),
            ),
            const SizedBox(
              height: 50,
            ),
              Column(
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
              height: 15,
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
              height: 50,
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
                  height: 20,
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