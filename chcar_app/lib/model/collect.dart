class CollectInfo {
  // 글 번호
  final int seq;
  // 이미지 링크
  final String imagepath;
  // 차량 브랜드
  final String carbrand;
  // 차량 모델
  final String carmodel;
  // 주행 거리
  final String km;
  // 연식
  final String year;
  // 차량 가격
  final String sellprice;
  // 유저 닉네임
  final String nickname;

  CollectInfo({
    required this.seq,
    required this.imagepath,
    required this.carbrand,
    required this.carmodel,
    required this.km,
    required this.year,
    required this.sellprice,
    required this.nickname,
  });
}
