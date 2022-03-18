import 'package:flutter/material.dart';
import 'moon_painter.dart';

class MoonWidget extends StatelessWidget {
  ///DateTime to show.
  ///Even hour, minutes, and seconds are calculated for MoonWidget
  final DateTime date;

  ///Decide the container size for the MoonWidget
  final double size;

  ///Resolution will be the moon radius.
  ///Large resolution needs more math operation makes widget heavy.
  ///Enter a small number if it is sufficient to mark it small,
  ///such as an icon or marker.
  final double resolution;

  ///Color of light side of moon
  final Color moonColor;

  ///Color of dark side of moon
  final Color earthshineColor;

  const MoonWidget({
    Key? key,
    required this.date,
    this.size = 36,
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
        scale: size / (resolution * 2),
        child: CustomPaint(
          painter: MoonPainter(moonWidget: this),
        ),
      ),
    );
  }
}
