import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../infra/infra.dart';

class UserAvatar extends StatelessWidget {
  final String userImage;

  const UserAvatar({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: CustomPaint(
        size: const Size(40.0, 40.0),
        painter: CircularPaint(
          progressValue: 1,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: userImage,
              ),
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
          AppColors.goldenZest,
          AppColors.fuchsiaFlare,
          AppColors.royalRadiance,
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
