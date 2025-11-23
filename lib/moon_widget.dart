import 'package:flutter/material.dart';
import 'moon_painter.dart';

class MoonWidget extends StatelessWidget {
  ///DateTime to show.
  ///Even hour, minutes, and seconds are calculated for MoonWidget
  final DateTime date;

  ///Decide the container size for the MoonWidget
  final double size;

  ///Pixel size for shadow rendering. Smaller values = smoother but heavier.
  ///Default is 1.0. Use 0.5 for smoother edges.
  final double pixelSize;

  ///Color of light side of moon
  final Color moonColor;

  ///Color of dark side of moon
  final Color earthshineColor;

  ///Optional background image asset path for realistic moon appearance
  final String? backgroundImageAsset;

  ///Shadow radius ratio for image mode (0.0 ~ 1.0).
  ///Use this to match shadow to actual moon area in image.
  ///1.0 means shadow radius = size/2, 0.8 means shadow radius = size/2 * 0.8.
  ///Defaults to 1.0.
  final double shadowRatio;

  const MoonWidget({
    Key? key,
    required this.date,
    this.size = 36,
    this.pixelSize = 1.0,
    this.moonColor = Colors.amber,
    this.earthshineColor = Colors.black87,
    this.backgroundImageAsset,
    this.shadowRatio = 1.0,
  }) : super(key: key);

  /// Simple moon with solid colors
  const MoonWidget.simple({
    Key? key,
    required this.date,
    this.size = 36,
    this.pixelSize = 1.0,
    this.moonColor = Colors.amber,
    this.earthshineColor = Colors.black87,
  })  : backgroundImageAsset = null,
        shadowRatio = 1.0,
        super(key: key);

  /// Moon with background image (moonColor is ignored)
  const MoonWidget.image({
    Key? key,
    required this.date,
    required this.backgroundImageAsset,
    this.size = 36,
    this.pixelSize = 0.5,
    this.earthshineColor = Colors.black87,
    this.shadowRatio = 1.0,
  })  : moonColor = Colors.amber,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasBackgroundImage = backgroundImageAsset != null;

    final moonPaint = CustomPaint(
      size: Size(size, size),
      painter: MoonPainter(moonWidget: this, shadowOnly: hasBackgroundImage),
    );

    if (hasBackgroundImage) {
      return SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                backgroundImageAsset!,
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
            ),
            moonPaint,
          ],
        ),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: moonPaint,
    );
  }
}
