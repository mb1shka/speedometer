import 'package:flutter/material.dart';
import 'package:speedometer/speed_painter.dart';

class Speedometer extends StatelessWidget {

  //speedometer widget

  Speedometer({
    required this.speed,
    required this.speedRecord,
    this.size = 200
  });

  final double speed;
  final double speedRecord;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: SpeedPainter(
        speed: speed,
        speedRecord: speedRecord
      ),
    );
  }
}