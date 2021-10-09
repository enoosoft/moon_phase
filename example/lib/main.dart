import 'package:flutter/material.dart';
import 'package:moon_phase/moon_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MoonWidget example app'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Wrap(
              direction: Axis.horizontal,
              children: _moonPhases(),
            ),
          ),
        ),
      ),
    );
  }

  _moonPhases() {
    var _list = <Widget>[];
    for (int i = 0; i < 30 * (24 / 12); i++) {
      _list.add(
        MoonWidget(
          date: DateTime(2021, 10, 6, 5).add(Duration(hours: i * 12)),
          resolution: 128,
          size: 54,
          scale: 0.185,
          moonColor: Colors.amber,
          earthshineColor: Colors.blueGrey.shade900,
        ),
      );
    }
    return _list;
  }
}
