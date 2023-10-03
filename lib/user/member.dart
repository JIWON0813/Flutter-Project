// 사용자 기본 정보 객체
// User 로 사용하다가 라이브러리에서 사용하는 명칭과 겹쳐서 오류 발생해서 Member로 바꿈
class Member{
  String email; // 로그인 객체 key
  String password; // 비번 필수
  String? id; // 계정 아이디
  Member(this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'id' : this.id
    };
  }
}