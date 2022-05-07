import 'package:flutter/material.dart';

class SlideUpTween extends StatelessWidget {
  const SlideUpTween({
    Key? key,
    required this.child,
    required this.begin,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 750),
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Curve curve;
  final Offset begin;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: const Offset(0, 0)),
      duration: duration,
      builder: (_, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }
}
