import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moon_phase/moon_phase.dart';

Widget _wrap(Widget child) => Directionality(
      textDirection: TextDirection.ltr,
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.black),
        child: Center(child: child),
      ),
    );

Finder _findMoon() => find.byWidgetPredicate(
      (w) => w is CustomPaint && w.painter is MoonPainter,
    );

void main() {
  final testDate = DateTime(2021, 10, 6, 5);
  final expectedPhase =
      MoonPhaseNameX.fromAngle(MoonPhase().getPhaseAngle(testDate));
  final expectedDefaultLabel = MoonPhaseNameX.defaultLabels[expectedPhase]!;

  group('MoonWidget — no label path', () {
    testWidgets('labelPosition null → no Text rendered', (tester) async {
      await tester.pumpWidget(_wrap(MoonWidget(date: testDate, size: 64)));
      expect(find.byType(Text), findsNothing);
      expect(_findMoon(), findsOneWidget);
    });

    testWidgets('.simple without labelPosition keeps legacy output',
        (tester) async {
      await tester
          .pumpWidget(_wrap(MoonWidget.simple(date: testDate, size: 64)));
      expect(find.byType(Text), findsNothing);
    });
  });

  group('MoonWidget — label positions', () {
    Future<void> pumpAt(WidgetTester tester, MoonLabelPosition pos) async {
      await tester.pumpWidget(_wrap(MoonWidget(
        date: testDate,
        size: 64,
        labelPosition: pos,
      )));
    }

    testWidgets('top → label sits above moon', (tester) async {
      await pumpAt(tester, MoonLabelPosition.top);
      final labelCenter = tester.getCenter(find.byType(Text));
      final moonCenter = tester.getCenter(_findMoon());
      expect(labelCenter.dy, lessThan(moonCenter.dy));
    });

    testWidgets('bottom → label sits below moon', (tester) async {
      await pumpAt(tester, MoonLabelPosition.bottom);
      final labelCenter = tester.getCenter(find.byType(Text));
      final moonCenter = tester.getCenter(_findMoon());
      expect(labelCenter.dy, greaterThan(moonCenter.dy));
    });

    testWidgets('left → label sits left of moon', (tester) async {
      await pumpAt(tester, MoonLabelPosition.left);
      final labelCenter = tester.getCenter(find.byType(Text));
      final moonCenter = tester.getCenter(_findMoon());
      expect(labelCenter.dx, lessThan(moonCenter.dx));
    });

    testWidgets('right → label sits right of moon', (tester) async {
      await pumpAt(tester, MoonLabelPosition.right);
      final labelCenter = tester.getCenter(find.byType(Text));
      final moonCenter = tester.getCenter(_findMoon());
      expect(labelCenter.dx, greaterThan(moonCenter.dx));
    });
  });

  group('MoonWidget — label content', () {
    testWidgets('default label used when phaseLabels is null', (tester) async {
      await tester.pumpWidget(_wrap(MoonWidget(
        date: testDate,
        labelPosition: MoonLabelPosition.bottom,
      )));
      expect(find.text(expectedDefaultLabel), findsOneWidget);
    });

    testWidgets('phaseLabels override wins when key is present',
        (tester) async {
      await tester.pumpWidget(_wrap(MoonWidget(
        date: testDate,
        labelPosition: MoonLabelPosition.bottom,
        phaseLabels: {expectedPhase: 'CUSTOM'},
      )));
      expect(find.text('CUSTOM'), findsOneWidget);
      expect(find.text(expectedDefaultLabel), findsNothing);
    });

    testWidgets('falls back to default when key missing from phaseLabels',
        (tester) async {
      final partial = <MoonPhaseName, String>{
        for (final p in MoonPhaseName.values)
          if (p != expectedPhase) p: 'NOT_$p',
      };
      await tester.pumpWidget(_wrap(MoonWidget(
        date: testDate,
        labelPosition: MoonLabelPosition.bottom,
        phaseLabels: partial,
      )));
      expect(find.text(expectedDefaultLabel), findsOneWidget);
    });
  });

  group('MoonWidget — label style and spacing', () {
    testWidgets('labelStyle is forwarded to Text', (tester) async {
      const style = TextStyle(color: Colors.red, fontSize: 22);
      await tester.pumpWidget(_wrap(MoonWidget(
        date: testDate,
        labelPosition: MoonLabelPosition.bottom,
        labelStyle: style,
      )));
      final text = tester.widget<Text>(find.byType(Text));
      expect(text.style, style);
    });

    testWidgets('labelSpacing controls vertical gap in bottom layout',
        (tester) async {
      const spacing = 40.0;
      await tester.pumpWidget(_wrap(MoonWidget(
        date: testDate,
        size: 64,
        labelPosition: MoonLabelPosition.bottom,
        labelSpacing: spacing,
      )));
      final moonBottom = tester.getBottomLeft(_findMoon()).dy;
      final labelTop = tester.getTopLeft(find.byType(Text)).dy;
      expect(labelTop - moonBottom, closeTo(spacing, 0.5));
    });

    testWidgets('labelSpacing controls horizontal gap in right layout',
        (tester) async {
      const spacing = 32.0;
      await tester.pumpWidget(_wrap(MoonWidget(
        date: testDate,
        size: 64,
        labelPosition: MoonLabelPosition.right,
        labelSpacing: spacing,
      )));
      final moonRight = tester.getTopRight(_findMoon()).dx;
      final labelLeft = tester.getTopLeft(find.byType(Text)).dx;
      expect(labelLeft - moonRight, closeTo(spacing, 0.5));
    });
  });
}
