import 'package:dmentia_flutter_app/gukhwa/home_view.dart';
import 'package:dmentia_flutter_app/gukhwa/mild_dementia.dart';
import 'package:dmentia_flutter_app/gukhwa/normal.dart';
import 'package:dmentia_flutter_app/gukhwa/severe_dementia.dart';
import 'package:dmentia_flutter_app/splash.dart';
import 'package:dmentia_flutter_app/static/userInfo.dart';
import 'package:dmentia_flutter_app/subin_view/kakaomapscreen.dart';
import 'package:dmentia_flutter_app/subin_view/user_login.dart';
import 'package:dmentia_flutter_app/subin_view/user_sign_up.dart';
import 'package:dmentia_flutter_app/subin_view/user_sign_up_pw_check.dart';
import 'package:dmentia_flutter_app/subin_view/userlogin_student_test.dart';
import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

const String kakaoMapKey = 'yourKey';

class MMSEResult2 extends StatefulWidget {
  const MMSEResult2({super.key});

  @override
  State<MMSEResult2> createState() => _MMSEResult2State();
}

class _MMSEResult2State extends State<MMSEResult2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('kakao map test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // KakaoMapView(
              // width: 350,
              // height: 400,
              // kakaoMapKey: kakaoMapKey,
              // lat: 33.450701,
              // lng: 126.570667,
              // showMapTypeControl: true,
              // showZoomControl: true,
              // markerImageURL:
              //     'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
              // onTapMarker: (message) async {
              //   ScaffoldMessenger.of(context)
              //       .showSnackBar(SnackBar(content: Text('Marker is clicked')));

              //   //await _openKakaoMapScreen(context);
              // }),
              ElevatedButton(
                  child: Text('Kakao map'),
                  onPressed: () async {
                    await _openKakaoMapScreen(context);
                  }),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return UserSignUp();
                      },
                    ));
                  },
                  child: Text('회원가입')),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return StudentUserLogin();
                    },
                  ));
                },
                child: Text(
                  'Student Select Test',
                ),
              ),
              usersStaticInfo.userName == "null"
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UserLogin();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'User Login Test',
                      ),
                    )
                  : Text('${usersStaticInfo.userName} 님 환영합니다'),

              ElevatedButton(
                onPressed: () {
                  print(usersStaticInfo.userId);
                  print(usersStaticInfo.userName);
                },
                child: const Text(
                  'static check button',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return UserPwCheck();
                    },
                  ));
                }, 
                child: const Text('User Pw Check')
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeView();
                    },
                  ));
                }, 
                child: const Text('Home View')
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Splash();
                    },
                  ));
                }, 
                child: const Text('Splash View')
                ),
                ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Normal();
                    },
                  ));
                }, 
                child: const Text('Normal View')
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MileDementia();
                    },
                  ));
                }, 
                child: const Text('MileDementia View')
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SevereDementia();
                    },
                  ));
                }, 
                child: const Text('SevereDementia View')
                )
            ],
          ),
        ));
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
