import 'package:flutter/material.dart';

class MovieTheaterScreen extends StatelessWidget {
  const MovieTheaterScreen({
    Key? key,
    required this.image,
    required this.maxWidth,
    required this.maxHeight,
  }) : super(key: key);

  final String image;
  final double maxWidth, maxHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(.8),
          transformAlignment: Alignment.topCenter,
        ),
        Positioned(
          height: maxHeight * .03,
          width: maxWidth * .5,
          bottom: maxHeight * .025,
          child: const CustomPaint(
            painter: TheaterSeparation(),
          ),
        ),
      ],
    );
  }
}

class TheaterSeparation extends CustomPainter {
  const TheaterSeparation();

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;

    final paint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final path = Path()
      ..moveTo(0, h)
      ..quadraticBezierTo(w * .44, h * .57, w * .5, h * .6)
      ..quadraticBezierTo(w * .56, h * .57, w, h);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
