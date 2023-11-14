import 'dart:math';

import 'package:flutter/material.dart';

class BottomSheetIconAnimation extends StatefulWidget {
  const BottomSheetIconAnimation(
      {super.key,
      required this.parentScrollController,
      required this.minHeight,
      required this.maxHeight});

  final DraggableScrollableController parentScrollController;
  final double minHeight;
  final double maxHeight;

  @override
  State<BottomSheetIconAnimation> createState() =>
      _BottomSheetIconAnimationState();
}

class _BottomSheetIconAnimationState extends State<BottomSheetIconAnimation> {
  static const endTweenRotation = -pi;
  double tweenEnd = 0;
  double maxSize = 0;
  double minSize = 0;

  @override
  void initState() {
    super.initState();
    minSize = widget.minHeight;
    maxSize = widget.maxHeight;
    tweenEnd =
        tweenSizeFunc(currentSize: widget.parentScrollController.size) * endTweenRotation;
  }

  double tweenSizeFunc({required double currentSize}) =>
      (currentSize - minSize) * ((1 - 0) / (maxSize - minSize));

  @override
  Widget build(BuildContext context) {
    widget.parentScrollController.addListener(() {
      double firstValue =
          tweenSizeFunc(currentSize: widget.parentScrollController.size);
      setState(() {
        tweenEnd = firstValue * endTweenRotation;
      });
    });
    return TweenAnimationBuilder<double>(
      builder: (_, double angle, builderChild) {
        return Transform.rotate(angle: angle, child: builderChild);
      },
      tween: Tween(begin: 0, end: tweenEnd),
      duration: const Duration(seconds: 0),
      child: const RotatedBox(
        quarterTurns: 2,
        child: Center(
          child: Icon(Icons.download),
        ),
      ),
    );
  }
}
