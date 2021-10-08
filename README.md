# moon_phase

Flutter plugin that creates moon widgets according to the moon's phase.

## Getting Started

Just add the `MoonWidget` and put in every single `DateTime` you want see. Then, the phase of the moon will be display.

```dart
        MoonWidget(
          date: DateTime.now(),
        ),
```

This is the [example app](https://pub.dev/packages/moon_phase/example) that shows the shape of the moon every 12 hours for 30 days.

<img src="https://user-images.githubusercontent.com/68217334/136544208-f1c8b8bb-bd64-4225-8157-c6eae9a63e56.png" alt="example app" width="250"/>


Yes, this is cool!    
<br>
    
## Learn More

```dart
        MoonWidget(
          date: DateTime.now(),
          resolution: 128,
          size: 64,
          scale: 0.2,
          moonColor: Colors.amber,
          earthshineColor: Colors.blueGrey.shade900,
        ),
```   
#### **date**
- DateTime to show.   
   Hour, minutes, and seconds are calculated for MoonWidget.  

#### **resolution**
- Resolution will be the moon radius.   
Large resolution needs more math operation makes widget heavy.   
Enter a small number if it is sufficient to mark it small,   
such as an icon or marker.   

#### **size**
- Decide the container size for the MoonWidget

#### **scale**
- Transform the size. 1.0 is resolution(=radius) x 2.   
#### **moonColor**
- Color of light side of the moon

#### **earthshineColor**
- Color of dark side of the moon.   

---
## About

- Publisher - [enoosoft](https://github.com/enoosoft)   
- This project converted from Java([Audrius Meskauskas's MoonView](https://github.com/andviane/moon.git)) to Dart.