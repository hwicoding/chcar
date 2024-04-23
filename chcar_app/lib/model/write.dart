// Write 모델 클래스 정의
class Write {
  // 글 번호
  final int seq;
  // 판매자(사용자 ID)
  final String id;
  // 차량 번호
  final String carSeq;
  // 차량 정보
  final String carInfo;
  // 판매 가격
  final String sellPrice;
  // 이미지 URL
  final String img_01;
  final String img_02;
  // final String img_03;
  // 상태 표시
  final int state;

  // 생성자
  Write({
    required this.seq,
    required this.id,
    required this.carSeq,
    required this.carInfo,
    required this.sellPrice,
    required this.img_01,
    required this.img_02,
    // required this.img_03,
    required this.state,
  });
}
