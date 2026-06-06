import 'package:flutter/material.dart';

class CityBackground extends StatelessWidget {
  const CityBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: .15,
        child: SizedBox(
          height: 100,
          child: CustomPaint(painter: CityPainter()),
        ),
      ),
    );
  }
}

class CityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 40)
      ..lineTo(20, 40)
      ..lineTo(20, 15)
      ..lineTo(50, 15)
      ..lineTo(50, 60)
      ..lineTo(80, 60)
      ..lineTo(80, 25)
      ..lineTo(120, 25)
      ..lineTo(120, size.height)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
