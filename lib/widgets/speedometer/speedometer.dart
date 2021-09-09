import 'package:flutter/material.dart';
import 'package:speedometer/listeners/speed_listener.dart';
import 'package:speedometer/widgets/speedometer/speed_painter.dart';
import 'package:provider/provider.dart';

class Speedometer extends StatelessWidget {

  //speedometer widget

  Speedometer({/*
    required this.speed,
    required this.speedRecord,*/
    this.size = 200
  });

  final double size;

  @override
  Widget build(BuildContext context) {

    double speed = context.watch<SpeedListener>().getSpeed;
    //наблюдаем за изменениями
    //double speedRecord = context.watch<double>();
    double speedRecord = context.watch<SpeedListener>().getHighestSpeed;

    //print("speed $speed");
    return CustomPaint(
      size: Size(size, size),
      painter: SpeedPainter(
        speed: speed,
        speedRecord: speedRecord,
      ),
    );
  }
}