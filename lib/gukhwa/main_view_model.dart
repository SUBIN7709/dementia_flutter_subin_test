import 'package:dmentia_flutter_app/gukhwa/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainViewModel {
  final SocialLogin _socialLogin; // 소셜로그인 인터페이스 객체
  bool isLogined = false; // 로그인 상태, 처음엔 로그인이 안되어있음
  User? user;
  // 로그인이 되었는지 안되었는지, 유저의 정보
  // user의 사진,이름 등등을 뿌릴수 잇게
  // 카카오에 있는 클래스임

  MainViewModel(this._socialLogin); // 생성자

  Future login() async {
    isLogined = await _socialLogin.login();
    // 로그인 상태, _socialLogin.login() 의 결과
    if (isLogined) {
      // 결과가 true 이면, 로그인이 되었다면
      user = await UserApi.instance.me();
      // 유저정보를 가져옴
    }
  }

  // 로그아웃
  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
