import 'package:flutter/material.dart';
import 'moon_painter.dart';

class MoonWidget extends StatelessWidget {
  final DateTime date;

  ///Determine the size of the moon widget container
  final double size;

  ///Adjust the size. 1 is resolution x 2.
  final double scale;

  ///resolution will be the moon radius
  final double resolution;
  final Color moonColor;
  final Color earthshineColor;

  const MoonWidget({
    Key? key,
    required this.date,
    this.size = 36,
    this.scale = 0.22,
    this.resolution = 96,
    this.moonColor = Colors.amber,
    this.earthshineColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Transform.scale(
        scale: scale,
        child: CustomPaint(
          painter: MoonPainter(moonWidget: this),
        ),
      ),
    );
  }
}
