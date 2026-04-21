import 'package:flutter/material.dart';
import 'package:moon_phase/moon_phase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MoonWidget example app'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Simple'),
                Tab(text: 'Image'),
                Tab(text: 'Labels'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MoonPhasesSimple(),
              MoonPhasesImage(),
              MoonPhasesLabels(),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tab 1 – Simple
// ---------------------------------------------------------------------------

class MoonPhasesSimple extends StatelessWidget {
  const MoonPhasesSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            30.0,
            30.0,
            30.0,
            30.0 + MediaQuery.of(context).padding.bottom,
          ),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: _buildMoons(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMoons() {
    var list = <Widget>[];
    for (int i = 0; i < 30 * (24 / 12); i++) {
      list.add(
        MoonWidget.simple(
          date: DateTime(2021, 10, 6, 5).add(Duration(hours: i * 12)),
          size: 64,
          pixelSize: 0.5,
          moonColor: Colors.amber,
          earthshineColor: Colors.blueGrey.shade900,
        ),
      );
    }
    return list;
  }
}

// ---------------------------------------------------------------------------
// Tab 2 – Image
// ---------------------------------------------------------------------------

class MoonPhasesImage extends StatelessWidget {
  const MoonPhasesImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            30.0,
            30.0,
            30.0,
            30.0 + MediaQuery.of(context).padding.bottom,
          ),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: _buildMoons(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMoons() {
    var list = <Widget>[];
    for (int i = 0; i < 30 * (24 / 12); i++) {
      list.add(
        MoonWidget.image(
          date: DateTime(2021, 10, 6, 5).add(Duration(hours: i * 12)),
          backgroundImageAsset: 'assets/moon_free.png',
          size: 64,
          pixelSize: 0.5,
          shadowRatio: 0.827,
          earthshineColor: Colors.black87,
        ),
      );
    }
    return list;
  }
}

// ---------------------------------------------------------------------------
// Tab 3 – Labels
// ---------------------------------------------------------------------------

/// Dates that land on each of the 8 main phases (October 2021 lunar cycle).
final _phaseDates = [
  DateTime(2021, 10, 6, 11),  // New Moon
  DateTime(2021, 10, 9, 0),   // Waxing Crescent
  DateTime(2021, 10, 12, 23), // First Quarter
  DateTime(2021, 10, 16, 12), // Waxing Gibbous
  DateTime(2021, 10, 20, 14), // Full Moon
  DateTime(2021, 10, 24, 12), // Waning Gibbous
  DateTime(2021, 10, 28, 20), // Last Quarter
  DateTime(2021, 11, 1, 12),  // Waning Crescent
];

// Labels fall back to MoonPhaseNameX.defaultLabels (English) here.
// Pass `phaseLabels: yourMap` to MoonWidget to inject localized strings
// from flutter_localizations, easy_localization, etc.

class MoonPhasesLabels extends StatefulWidget {
  const MoonPhasesLabels({Key? key}) : super(key: key);

  @override
  State<MoonPhasesLabels> createState() => _MoonPhasesLabelsState();
}

class _MoonPhasesLabelsState extends State<MoonPhasesLabels> {
  MoonLabelPosition _position = MoonLabelPosition.bottom;
  double _moonSize = 48;
  double _fontSize = 11;

  bool get _isHorizontal =>
      _position == MoonLabelPosition.left ||
      _position == MoonLabelPosition.right;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ControlBar(
          position: _position,
          moonSize: _moonSize,
          fontSize: _fontSize,
          onPositionChanged: (v) => setState(() => _position = v),
          onMoonSizeChanged: (v) => setState(() => _moonSize = v),
          onFontSizeChanged: (v) => setState(() => _fontSize = v),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              24,
              16,
              24,
              24 + MediaQuery.of(context).padding.bottom,
            ),
            children: [
              _Section(
                title: 'Simple mode',
                child: _isHorizontal
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _phaseDates
                            .map((d) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: MoonWidget.simple(
                                    date: d,
                                    size: _moonSize,
                                    pixelSize: 0.5,
                                    moonColor: Colors.amber,
                                    earthshineColor: Colors.blueGrey.shade900,
                                    labelPosition: _position,
                                    labelSpacing: 8,
                                    labelStyle: TextStyle(fontSize: _fontSize),
                                  ),
                                ))
                            .toList(),
                      )
                    : Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: _phaseDates
                            .map((d) => MoonWidget.simple(
                                  date: d,
                                  size: _moonSize,
                                  pixelSize: 0.5,
                                  moonColor: Colors.amber,
                                  earthshineColor: Colors.blueGrey.shade900,
                                  labelPosition: _position,
                                  labelStyle: TextStyle(fontSize: _fontSize),
                                ))
                            .toList(),
                      ),
              ),
              const SizedBox(height: 32),
              _Section(
                title: 'Image mode',
                child: _isHorizontal
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _phaseDates
                            .map((d) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: MoonWidget.image(
                                    date: d,
                                    backgroundImageAsset: 'assets/moon_free.png',
                                    size: _moonSize,
                                    pixelSize: 0.5,
                                    shadowRatio: 0.827,
                                    earthshineColor: Colors.black87,
                                    labelPosition: _position,
                                    labelSpacing: 8,
                                    labelStyle: TextStyle(fontSize: _fontSize),
                                  ),
                                ))
                            .toList(),
                      )
                    : Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: _phaseDates
                            .map((d) => MoonWidget.image(
                                  date: d,
                                  backgroundImageAsset: 'assets/moon_free.png',
                                  size: _moonSize,
                                  pixelSize: 0.5,
                                  shadowRatio: 0.827,
                                  earthshineColor: Colors.black87,
                                  labelPosition: _position,
                                  labelStyle: TextStyle(fontSize: _fontSize),
                                ))
                            .toList(),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ControlBar extends StatelessWidget {
  final MoonLabelPosition position;
  final double moonSize;
  final double fontSize;
  final ValueChanged<MoonLabelPosition> onPositionChanged;
  final ValueChanged<double> onMoonSizeChanged;
  final ValueChanged<double> onFontSizeChanged;

  const _ControlBar({
    required this.position,
    required this.moonSize,
    required this.fontSize,
    required this.onPositionChanged,
    required this.onMoonSizeChanged,
    required this.onFontSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text('Position:'),
                const SizedBox(width: 8),
                DropdownButton<MoonLabelPosition>(
                  value: position,
                  isDense: true,
                  items: MoonLabelPosition.values
                      .map((p) => DropdownMenuItem(
                            value: p,
                            child: Text(p.toString().split('.').last),
                          ))
                      .toList(),
                  onChanged: (v) => onPositionChanged(v!),
                ),
              ],
            ),
            _SliderRow(
              label: 'Moon',
              value: moonSize,
              min: 24,
              max: 120,
              onChanged: onMoonSizeChanged,
            ),
            _SliderRow(
              label: 'Font',
              value: fontSize,
              min: 8,
              max: 24,
              onChanged: onFontSizeChanged,
            ),
          ],
        ),
      ),
    );
  }
}

class _SliderRow extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const _SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 48, child: Text(label)),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: 32,
          child: Text(
            value.round().toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
