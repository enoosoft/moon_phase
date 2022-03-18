# moon_phase

Flutter plugin that creates moon widgets according to the moon's phase.

## Getting Started

Just add the `MoonWidget` and put in every single `DateTime` you want see. Then, the phase of the moon will be displayed.

```dart
  MoonWidget(
    date: DateTime.now(),
  ),
```

This is the [example app](https://pub.dev/packages/moon_phase/example) that shows the shape of the moon every 12 hours for 30 days.

<img src="https://user-images.githubusercontent.com/68217334/136664443-31639f81-9e5d-4ca9-a26f-2abc2b408aad.png" alt="example app" width="250"/>

Yes, this is cool!    
<br>
    
## Learn More

```dart
  MoonWidget(
    date: DateTime.now(),
    resolution: 128,
    size: 64,
    moonColor: Colors.amber,
    earthshineColor: Colors.blueGrey.shade900,
  ),
```   
#### **date**
- DateTime to show.   
   Hours, minutes, and seconds are calculated for MoonWidget.  

#### **resolution**
- Resolution will be the moon radius.   
Large resolution needs more math operation makes widget heavy.   
Enter a small number if it is sufficient to mark it small,   
such as an icon or marker.   

#### **size**
- Set size for the MoonWidget
 
#### **moonColor**
- Color of light side of the moon

#### **earthshineColor**
- Color of dark side.   

---
## About

- Publisher - [enoosoft](https://github.com/enoosoft)   
- Reference - ([Audrius Meskauskas's MoonView](https://github.com/andviane/moon.git))
