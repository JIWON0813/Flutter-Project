// 사용자 기본 정보 객체
class User{
  String email; // 로그인 객체 key
  String password; // 비번 필수
  String? id; // 계정 아이디
  User(this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'id' : this.id
    };
  }
}