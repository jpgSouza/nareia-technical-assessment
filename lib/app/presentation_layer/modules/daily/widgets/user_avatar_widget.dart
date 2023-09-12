import 'dart:math' as math;

import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String userImage;

  const UserAvatar({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0,
      height: 45.0,
      child: CustomPaint(
        size: const Size(45.0, 45.0),
        painter: CircularPaint(
          progressValue: 1,
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(userImage).image,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class CircularPaint extends CustomPainter {
  final double borderThickness;
  final double progressValue;

  CircularPaint({
    this.borderThickness = 3.0,
    required this.progressValue,
  });

  double deg2rad(double deg) => deg * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    final rect =
        Rect.fromCenter(center: center, width: size.width, height: size.height);

    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(.3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness;

    canvas.drawArc(
      rect,
      deg2rad(0),
      deg2rad(360),
      false,
      paint,
    );

    Paint progressBarPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderThickness
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        stops: [
          0.2,
          0.75,
          1.35,
        ],
        colors: [
          Color(0xFFf9ce34),
          Color(0xFFee2a7b),
          Color(0xFF6228d7),
        ],
      ).createShader(rect);
    canvas.drawArc(
      rect,
      deg2rad(-90),
      deg2rad(360 * progressValue),
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(CircularPaint oldDelegate) {
    return oldDelegate.borderThickness != borderThickness ||
        oldDelegate.progressValue != progressValue;
  }
}
