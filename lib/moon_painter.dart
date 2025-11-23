//
// MoonPhase.java:
// Calculate the phase of the moon.
//    Copyright 2014 by Audrius Meskauskas
// You may use or distribute this code under the terms of the GPLv3
//https://github.com/andviane/moon.git

import 'dart:math';
import 'package:flutter/material.dart';
import 'moon_phase.dart';

class MoonPainter extends CustomPainter {
  MoonWidget moonWidget;
  final bool shadowOnly;
  final Paint paintDark = Paint()..isAntiAlias = true;
  final Paint paintLight = Paint()..isAntiAlias = true;
  final MoonPhase moon = MoonPhase();

  MoonPainter({required this.moonWidget, this.shadowOnly = false});

  @override
  void paint(Canvas canvas, Size size) {
    // Use the size parameter to get the center of the canvas
    double xcenter = size.width / 2;
    double ycenter = size.height / 2;
    // Apply shadowRatio to radius
    double radius = min(size.width, size.height) / 2 * moonWidget.shadowRatio;
    double pixelSize = moonWidget.pixelSize;

    double phaseAngle = moon.getPhaseAngle(moonWidget.date);

    // Update the color settings
    paintLight.color = moonWidget.moonColor;
    paintDark.color = moonWidget.earthshineColor;

    // Draw the full moon as a light circle (skip if shadowOnly mode)
    if (!shadowOnly) {
      canvas.drawCircle(Offset(xcenter, ycenter), radius, paintLight);
    }

    ///위상각은 태양 - 달 - 지구의 각도다.
    ///따라서 0 = full phase, 180 = new
    ///우리가 필요한 것은 일출 터미네이터의 위치 각도(태양 - 지구 - 달)다.
    ///위상각과 반대 방향이기 때문에 변환해야한다.
    double positionAngle = pi - phaseAngle;
    if (positionAngle < 0.0) {
      positionAngle += 2.0 * pi;
    }

    // Calculate the shadow
    double cosTerm = cos(positionAngle);
    double rsquared = radius * radius;
    double whichQuarter = ((positionAngle * 2.0 / pi) + 4) % 4;

    // Draw the shadow on the moon
    double halfPixel = pixelSize / 2;
    for (double j = -radius; j <= radius; j += pixelSize) {
      double rrf = sqrt(rsquared - j * j);
      double rr = rrf;
      double xx = rrf * cosTerm;
      double x1 = xcenter - (whichQuarter < 2 ? rr : xx);
      double w = rr + xx;

      canvas.drawRect(
          Rect.fromLTRB(x1, ycenter + j - halfPixel, x1 + w, ycenter + j + halfPixel), paintDark);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
