# moon_phase

Flutter plugin that creates moon widgets according to the moon's phase.

## Getting Started

Just add the `MoonWidget` and put in all the `DateTime` you want. Then, draw the phase of the moon.

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

like this.  
<img src="https://user-images.githubusercontent.com/68217334/136544208-f1c8b8bb-bd64-4225-8157-c6eae9a63e56.png" alt="example app" width="300"/>


Yes, this is cool!    
   
<br><br>   
## Usage

#### `date`
DateTime to show.   
Even hour, minutes, and seconds are calculated for MoonWidget
#### `resolution`
Resolution will be the moon radius.   
Large resolution needs more math operation makes widget heavy.   
Enter a small number if it is sufficient to mark it small,   
such as an icon or marker.


#### `size`
Decide the container size for the MoonWidget

#### `scale`
Transform the size. 1.0 is resolution(=radius) x 2.   
#### `moonColor`
Color of light side of the moon

#### `earthshineColor`
Color of dark side of the moon.
