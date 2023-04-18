import 'package:dmentia_flutter_app/gukhwa/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements SocialLogin {
  // 로그인
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      // 카카오톡 install 여부 확인
      if (isInstalled) {
        // install 되어있다면
        try {
          await UserApi.instance.loginWithKakaoTalk();
          // 카카오톡 로그인
          return true;
        } catch (e) {
          // 로그인 안된 경우(뒤로 가기 등등)
          return false;
        }
      } else {
        // 설치하지 않았다면
        try {
          await UserApi.instance.loginWithKakaoAccount();
          // 카카오 계정으로 로그인
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  // 로그아웃
  @override
  Future<bool> logout() async {
    // 실패할 경우 대비 try catch
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
