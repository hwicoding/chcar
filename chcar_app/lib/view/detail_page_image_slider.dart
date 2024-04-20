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
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      widget.onNext();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: Image.network(
        widget.images[widget.currentIndex],
        fit: BoxFit.cover,
      ),
    );
  }
}
