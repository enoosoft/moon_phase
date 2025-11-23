import 'package:flutter/material.dart';
import 'package:moon_phase/moon_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MoonWidget example app'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Simple'),
                Tab(text: 'Image'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MoonPhasesSimple(),
              MoonPhasesImage(),
            ],
          ),
        ),
      ),
    );
  }
}

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
