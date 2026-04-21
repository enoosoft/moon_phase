# moon_phase

Flutter plugin that creates moon widgets according to the moon's phase.

<p align="left">
  <img src="https://raw.githubusercontent.com/enoosoft/moon_phase/master/example/screenshots/example_app_001.jpeg" width="250" />
  <img src="https://raw.githubusercontent.com/enoosoft/moon_phase/master/example/screenshots/example_app_002.jpeg" width="250" />
  <img src="https://raw.githubusercontent.com/enoosoft/moon_phase/master/example/screenshots/example_app_003.jpeg" width="250" />
</p>

## Usage

### Simple (solid colors)
```dart
MoonWidget.simple(
  date: DateTime.now(),
  size: 64,
  moonColor: Colors.amber,
  earthshineColor: Colors.black87,
)
```

### Image (with background)
```dart
MoonWidget.image(
  date: DateTime.now(),
  backgroundImageAsset: 'assets/moon.png',
  size: 64,
  shadowRatio: 0.8,
  earthshineColor: Colors.black87,
)
```

### With phase label
```dart
MoonWidget.simple(
  date: DateTime.now(),
  size: 64,
  labelPosition: MoonLabelPosition.bottom,
  labelStyle: TextStyle(fontSize: 12),
)
```
Pass `phaseLabels` to inject localized strings; missing keys fall back to
`MoonPhaseNameX.defaultLabels` (English).

## Parameters

| Parameter | Description |
|-----------|-------------|
| `date` | DateTime to display |
| `size` | Widget size |
| `pixelSize` | Shadow rendering precision (smaller = smoother) |
| `moonColor` | Light side color (simple mode) |
| `earthshineColor` | Dark side color |
| `backgroundImageAsset` | Background image path (image mode) |
| `shadowRatio` | Shadow radius ratio 0.0~1.0 (image mode) |
| `labelPosition` | Label placement: top / bottom / left / right. `null` = no label |
| `phaseLabels` | Map<MoonPhaseName, String> for i18n; falls back to defaults when a key is missing |
| `labelStyle` | TextStyle applied to the label |
| `labelSpacing` | Gap in logical pixels between moon and label (default 4) |

## Acknowledgements

- [bksubhuti](https://github.com/bksubhuti) - Background image overlay idea
- [guillotnico](https://github.com/guillotnico) - Phase label support (#4)

## About

- Publisher - [enoosoft](https://github.com/enoosoft)
- Used in - [천문달력 (Astronomy Calendar)](https://apps.apple.com/us/app/id1592216707) · [Google Play](https://play.google.com/store/apps/details?id=com.enoo.astc)
- Reference - [Audrius Meskauskas's MoonView](https://github.com/andviane/moon.git)
