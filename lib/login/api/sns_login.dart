import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SnsLogin {

  static void withGoogle() async {

    // 구글 로그인 기능 호출
    print('Google Login Start');

    //Future<UserCredential> result;
    //ID, PWD 회원가입
    //final newUser = await _authentication.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
    // if(newUser.user != null){
    //   // 성공
    //   print('회원가입 성공이다');
    // }

    // 로그인
    // final newUser = await _authentication.signInWithEmailAndPassword(email: userEmail, password: userPassword);
    // if(newUser.user != null){
    //   // 성공
    //   print('로그인 성공이다. 페이지 이동');
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => Home()),
    //   );
    // }

    // 구글 로그인
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var loginedUser = await FirebaseAuth.instance.signInWithCredential(credential);

    if(loginedUser.user != null){
      print('Login Success! User Name : ' + loginedUser.user!.displayName!);
    }
    // Once signed in, return the UserCredential
  }

  static void withApple() {
    // 애플 로그인 기능 호출
  }
}