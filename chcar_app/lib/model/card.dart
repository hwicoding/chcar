class WriteCard {
  // 글 번호
  final int seq;
  // 판매자(사용자 ID)
  final String id;
  // 차량 번호
  final String carSeq;
  // 차량 가격
  final String sellprice;
  // 이미지
  final String imagepath;

  WriteCard({
    required this.seq,
    required this.id,
    required this.carSeq,
    required this.sellprice,
    required this.imagepath,
  });
}
