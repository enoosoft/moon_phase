library moon_phase;

export 'moon_painter.dart' show MoonPainter;
export 'moon_phase.dart' show MoonPhase;

import 'package:flutter/material.dart';
import 'moon_painter.dart';

class MoonWidget extends StatelessWidget {
  final DateTime date;
  final double scale;
  final double radius;

  const MoonWidget({
    Key? key,
    required this.date,
    this.scale = 0.22,
    this.radius = 96,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Transform.scale(
        scale: scale,
        child: CustomPaint(
          painter: MoonPainter(date: date, radius: radius),
        ),
      ),
    );
  }
}
