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
  // 위도
  final String lat;
  // 경도
  final String lng;
  // 이미지 URL
  final String img;
  // 상태 표시
  final int state;

  // 생성자
  Write({
    required this.seq,
    required this.id,
    required this.carSeq,
    required this.carInfo,
    required this.sellPrice,
    required this.lat,
    required this.lng,
    required this.img,
    required this.state,
  });
}
