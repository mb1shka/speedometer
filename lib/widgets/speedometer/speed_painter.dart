import 'dart:math';

import 'package:flutter/material.dart';

class SpeedPainter extends CustomPainter {
  SpeedPainter({
    required this.speed,
    required this.speedRecord,
/*
    required this.canvas,
    required this.size,
    required this.center,
    required this.paintObj*/
  });

  final double speed;
  final double speedRecord;

  late Size size;
  late Canvas canvas;
  late Offset center;
  late Paint paintObj;

  @override
  void paint(Canvas canvas, Size size) {
    _init(canvas, size);

    _drawOuterCircle();
    _drawInnerCircle();
    _drawTriangle();
    //_drawOuterArc();
    _drawArrow(0.1 + (speed / 100), Colors.red, size.width / 65);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _init(Canvas canvas, Size size) {
    this.canvas = canvas;
    this.size = size;
    center = size.center(Offset.zero);
    paintObj = Paint();
  }

  void _drawOuterCircle() {
    //внешний круг
    paintObj
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(size.center(Offset.zero), size.width / 1.3, paintObj);
  }

  /* void _drawOuterArc() {
    paintObj
        ..color = Colors.white
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke;

    final arc = Path();
    arc.moveTo(size.width * 0, size.height * 0.92);
    arc.arcToPoint(
        Offset(size.width * 1, size.height * 0.92),
    radius: Radius.circular(10));

    canvas.drawPath(arc, paintObj);
  }*/

  void _drawInnerCircle() {
    //внутренний круг
    paintObj
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(size.center(Offset.zero), size.width / 1.38, paintObj);
  }

  void _drawRhombus() {
    //квадрат, который мы развернем как ромб
    paintObj
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    //final rect = Rect.from

    //canvas.drawRect(rect, paintObj)
  }

  void _drawTriangle() {
    //треугольник, потому что ну нахрен квадрат

    paintObj
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.5); //center
    path.lineTo(size.width * -0.4, size.height * 1.5);
    path.lineTo(size.width * 1.4, size.height * 1.5);
    path.close();
    
    canvas.drawPath(path, paintObj);
  }

  void _drawRotated(double angle, Function drawFunction) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle * pi * 2.5);
    canvas.translate(-center.dx, -center.dy);
    drawFunction();
    canvas.restore();
  }

  void _drawArrow(double rotation, Color color, double width) {
    //отрисовываем стрелку, которая будет указывать на скорость

    paintObj
      ..style = PaintingStyle.fill
      ..color = color;

    Path arrowPath = Path()
      ..moveTo(center.dx - width, center.dy)
      ..lineTo(center.dx + width, center.dy)
      ..lineTo(center.dx, center.dy + size.width / 1.4)
      ..moveTo(center.dx - width, center.dy);

    _drawRotated(rotation, () {
      canvas.drawPath(arrowPath, paintObj);
    });
  }
}
