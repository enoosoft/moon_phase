//
// MoonPhase.java:
// Calculate the phase of the moon.
//    Copyright 2014 by Audrius Meskauskas
// You may use or distribute this code under the terms of the GPLv3
//https://github.com/andviane/moon.git

import 'dart:math';
import 'package:flutter/material.dart';
import 'moon_phase.dart';
import 'moon_widget.dart';

class MoonPainter extends CustomPainter {
  MoonWidget moonWidget;
  final Paint paintDark = Paint();
  final Paint paintLight = Paint();
  final MoonPhase moon = MoonPhase();

  MoonPainter({required this.moonWidget});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = moonWidget.resolution;

    int width = radius.toInt() * 2;
    int height = radius.toInt() * 2;
    double phaseAngle = moon.getPhaseAngle(moonWidget.date);

    double xcenter = 0;
    double ycenter = 0;

    try {
      paintLight.color = moonWidget.moonColor;
      //달의 색깔로 전체 원을 그린다
      canvas.drawCircle(const Offset(0, 1), radius, paintLight);
    } catch (e) {
      radius = min(width, height) * 0.4;
      paintLight.color = moonWidget.moonColor;
      Rect oval = Rect.fromLTRB(xcenter - radius, ycenter - radius,
          xcenter + radius, ycenter + radius);
      canvas.drawOval(oval, paintLight);
    }

    ///위상각은 태양 - 달 - 지구의 각도다.
    ///따라서 0 = full phase, 180 = new
    ///우리가 필요한 것은 일출 터미네이터의 위치 각도(태양 - 지구 - 달)다.
    ///위상각과 반대 방향이기 때문에 변환해야한다.
    double positionAngle = pi - phaseAngle;
    if (positionAngle < 0.0) {
      positionAngle += 2.0 * pi;
    }

    //이제 어두운 면을 그려야 한다.
    paintDark.color = moonWidget.earthshineColor;

    double cosTerm = cos(positionAngle);

    double rsquared = radius * radius;
    double whichQuarter = ((positionAngle * 2.0 / pi) + 4) % 4;

    for (int j = 0; j < radius; ++j) {
      double rrf = sqrt(rsquared - j * j);
      double rr = rrf;
      double xx = rrf * cosTerm;
      double x1 = xcenter - (whichQuarter < 2 ? rr : xx);
      double w = rr + xx;
      canvas.drawRect(
          Rect.fromLTRB(x1, ycenter - j, w + x1, ycenter - j + 2), paintDark);
      canvas.drawRect(
          Rect.fromLTRB(x1, ycenter + j, w + x1, ycenter + j + 2), paintDark);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
