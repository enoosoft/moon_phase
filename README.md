# moon_phase

Flutter plugin that creates a moon widget according to the moon's phase.

## Getting Started
- Just add the moon widget as below, the widget according to the moon phase will be displayed there.
```dart
SizedBox(
    child: MoonWidget(
        date: DateTime.now().add(const Duration(days: 5)),
        scale: 1,
    ),
),

- like this.


