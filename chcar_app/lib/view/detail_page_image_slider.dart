// detail_page_image_slider.dart

import 'dart:async';
import 'package:flutter/material.dart';

class DetailPageImageSlider extends StatefulWidget {
  final List<String> images;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  // ignore: use_super_parameters
  const DetailPageImageSlider({
    Key? key,
    required this.images,
    required this.currentIndex,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailPageImageSliderState createState() => _DetailPageImageSliderState();
}

class _DetailPageImageSliderState extends State<DetailPageImageSlider> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  // 타이머 시작 메서드
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      widget.onNext();
    });
  }

  // 타이머 정지 메서드
  void _stopTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 이미지 표시
        SizedBox(
          width: 250,
          height: 250,
          child: Image.network(
            // 현재 이미지 인덱스를 이미지 리스트의 길이로 나누어 순환하도록 수정
            widget.images[widget.currentIndex % widget.images.length],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
