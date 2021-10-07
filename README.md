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
```

- like this.
![Screenshot_1633614082](https://user-images.githubusercontent.com/68217334/136396376-bd536827-03ef-4c3b-9de7-03d8b6d8fa3e.png)
