import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:moon_phase/moon_phase.dart';

void main() {
  const eighth = pi / 8;

  group('MoonPhaseNameX.fromAngle — canonical angles', () {
    test('0 rad → fullMoon', () {
      expect(MoonPhaseNameX.fromAngle(0), MoonPhaseName.fullMoon);
    });

    test('π rad → newMoon', () {
      expect(MoonPhaseNameX.fromAngle(pi), MoonPhaseName.newMoon);
    });

    test('π/2 rad → lastQuarter', () {
      expect(MoonPhaseNameX.fromAngle(pi / 2), MoonPhaseName.lastQuarter);
    });

    test('3π/2 rad → firstQuarter', () {
      expect(MoonPhaseNameX.fromAngle(3 * pi / 2), MoonPhaseName.firstQuarter);
    });
  });

  group('MoonPhaseNameX.fromAngle — sector boundaries', () {
    test('just below π/8 → fullMoon', () {
      expect(
        MoonPhaseNameX.fromAngle(eighth - 1e-9),
        MoonPhaseName.fullMoon,
      );
    });

    test('exactly π/8 → waningGibbous (inclusive lower bound)', () {
      expect(MoonPhaseNameX.fromAngle(eighth), MoonPhaseName.waningGibbous);
    });

    test('exactly 3π/8 → lastQuarter', () {
      expect(MoonPhaseNameX.fromAngle(3 * eighth), MoonPhaseName.lastQuarter);
    });

    test('exactly 5π/8 → waningCrescent', () {
      expect(
        MoonPhaseNameX.fromAngle(5 * eighth),
        MoonPhaseName.waningCrescent,
      );
    });

    test('exactly 7π/8 → newMoon', () {
      expect(MoonPhaseNameX.fromAngle(7 * eighth), MoonPhaseName.newMoon);
    });

    test('exactly 9π/8 → waxingCrescent', () {
      expect(
        MoonPhaseNameX.fromAngle(9 * eighth),
        MoonPhaseName.waxingCrescent,
      );
    });

    test('exactly 11π/8 → firstQuarter', () {
      expect(
        MoonPhaseNameX.fromAngle(11 * eighth),
        MoonPhaseName.firstQuarter,
      );
    });

    test('exactly 13π/8 → waxingGibbous', () {
      expect(
        MoonPhaseNameX.fromAngle(13 * eighth),
        MoonPhaseName.waxingGibbous,
      );
    });

    test('exactly 15π/8 → fullMoon (wrap into upper bucket)', () {
      expect(MoonPhaseNameX.fromAngle(15 * eighth), MoonPhaseName.fullMoon);
    });
  });

  group('MoonPhaseNameX.fromAngle — normalization', () {
    test('2π rad normalizes to 0 → fullMoon', () {
      expect(MoonPhaseNameX.fromAngle(2 * pi), MoonPhaseName.fullMoon);
    });

    test('negative angle normalizes into [0, 2π)', () {
      expect(MoonPhaseNameX.fromAngle(-pi), MoonPhaseName.newMoon);
    });

    test('3π normalizes to π → newMoon', () {
      expect(MoonPhaseNameX.fromAngle(3 * pi), MoonPhaseName.newMoon);
    });
  });

  group('MoonPhaseNameX.defaultLabels', () {
    test('contains every MoonPhaseName value', () {
      for (final phase in MoonPhaseName.values) {
        expect(
          MoonPhaseNameX.defaultLabels.containsKey(phase),
          isTrue,
          reason: 'missing default label for $phase',
        );
      }
    });

    test('all labels are non-empty', () {
      for (final entry in MoonPhaseNameX.defaultLabels.entries) {
        expect(entry.value, isNotEmpty, reason: '${entry.key} has empty label');
      }
    });
  });
}
