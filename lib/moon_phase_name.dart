import 'dart:math';

/// The 8 standard lunar phases.
enum MoonPhaseName {
  newMoon,
  waxingCrescent,
  firstQuarter,
  waxingGibbous,
  fullMoon,
  waningGibbous,
  lastQuarter,
  waningCrescent,
}

extension MoonPhaseNameX on MoonPhaseName {
  /// Default English labels, used as fallback when [MoonWidget.phaseLabels] is not provided.
  static const Map<MoonPhaseName, String> defaultLabels = {
    MoonPhaseName.newMoon: 'New Moon',
    MoonPhaseName.waxingCrescent: 'Waxing Crescent',
    MoonPhaseName.firstQuarter: 'First Quarter',
    MoonPhaseName.waxingGibbous: 'Waxing Gibbous',
    MoonPhaseName.fullMoon: 'Full Moon',
    MoonPhaseName.waningGibbous: 'Waning Gibbous',
    MoonPhaseName.lastQuarter: 'Last Quarter',
    MoonPhaseName.waningCrescent: 'Waning Crescent',
  };

  /// Derives the phase name from a phase angle (radians, [0, 2π]).
  ///
  /// Convention used by [MoonPainter]: 0 = full moon, π = new moon.
  static MoonPhaseName fromAngle(double phaseAngle) {
    // Normalize to [0, 2π]
    double a = phaseAngle % (2 * pi);
    if (a < 0) a += 2 * pi;

    const eighth = pi / 8; // 22.5°

    if (a < eighth || a >= 15 * eighth) return MoonPhaseName.fullMoon;
    if (a < 3 * eighth) return MoonPhaseName.waningGibbous;
    if (a < 5 * eighth) return MoonPhaseName.lastQuarter;
    if (a < 7 * eighth) return MoonPhaseName.waningCrescent;
    if (a < 9 * eighth) return MoonPhaseName.newMoon;
    if (a < 11 * eighth) return MoonPhaseName.waxingCrescent;
    if (a < 13 * eighth) return MoonPhaseName.firstQuarter;
    return MoonPhaseName.waxingGibbous;
  }
}

/// Position of the phase label relative to the moon widget.
enum MoonLabelPosition {
  top,
  bottom,
  left,
  right,
}
