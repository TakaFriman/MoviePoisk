import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BarPage extends StatefulWidget {
  const BarPage({super.key});

  @override
  State<BarPage> createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 100,
        height: 100,
        child: RadialPercentWidget(
          child: Text(
            '72 %',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          percent: 0.72,
          fillColor: Colors.blue,
          lineColor: Colors.red,
          freeColor: Colors.yellow,
          lineWidth: 5,
        ),
      )),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  const RadialPercentWidget(
      {super.key,
      required this.child,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            lineWidth: lineWidth,
            freeColor: freeColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Center(child: child),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter(
      {required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcRect(size);

    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      (pi * 2 * percent) - pi / 2,
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcRect(Size size) {
    const linesMargin = 4;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
