<div align="center">

# Flutter 30 Days UI Challenge

### A comprehensive, hands-on Flutter UI reference -- one file per day, each packed with 10 to 50 real, working widget examples.

---

[![Flutter](https://img.shields.io/badge/Flutter-Framework-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![Days](https://img.shields.io/badge/Challenge-30%20Days-ff6f61?style=for-the-badge)](#progress-tracker)

</div>

---

## About This Repository

This repository is a **30-day Flutter UI challenge** where each day focuses on a specific widget category or UI concept. Every file is a self-contained, fully commented Dart file containing **10 to 50 practical examples** -- not just basic usage, but creative, animated, and production-quality implementations.

Whether you are a beginner learning Flutter for the first time or an intermediate developer looking for quick reference code, this repository is built to be your go-to resource.

### What Makes This Different

- **Not just snippets.** Each file is a complete, runnable widget with detailed inline comments explaining every property, parameter, and design decision.
- **Quantity and quality.** Every day contains dozens of examples, progressing from basic usage to advanced animations and creative designs.
- **Real patterns.** Neumorphism, glassmorphism, animated borders, 3D transforms, custom painters, shimmer effects, and more -- the kind of UI you actually ship in production apps.
- **Beginner-friendly documentation.** Every file starts with a comprehensive guide section that explains the widget from scratch before diving into examples.

---

## Repository Structure

```
Flutter_30_days_UI/
|
|-- Day_01_Containers_and_SizedBox/
|   |-- Container_size.dart          # 50 examples: basic to animated containers
|
|-- (Day 02 through Day 30 will be added daily)
|
|-- README.md
```

---

## Progress Tracker

| Day | Topic | Examples | Status |
|:---:|:------|:--------:|:------:|
| 01 | **Container and SizedBox** -- Basic containers, padding, margin, BoxDecoration, gradients (linear, radial, sweep), shadows, borders, rounded corners, circular shapes, neumorphism, glassmorphism, neon glow, 3D perspective, transforms, AnimatedContainer, pulsating animation, spinning animation, color shifting, bouncing, morphing shapes, flip cards, shimmer loading, music visualizer, wavy clips, diagonal splits, gradient text, and more | 50 | Complete |
| 02 | *Coming Soon* | -- | Upcoming |
| 03 | *Coming Soon* | -- | Upcoming |
| 04 | *Coming Soon* | -- | Upcoming |
| 05 | *Coming Soon* | -- | Upcoming |
| 06 | *Coming Soon* | -- | Upcoming |
| 07 | *Coming Soon* | -- | Upcoming |
| 08 | *Coming Soon* | -- | Upcoming |
| 09 | *Coming Soon* | -- | Upcoming |
| 10 | *Coming Soon* | -- | Upcoming |
| 11 | *Coming Soon* | -- | Upcoming |
| 12 | *Coming Soon* | -- | Upcoming |
| 13 | *Coming Soon* | -- | Upcoming |
| 14 | *Coming Soon* | -- | Upcoming |
| 15 | *Coming Soon* | -- | Upcoming |
| 16 | *Coming Soon* | -- | Upcoming |
| 17 | *Coming Soon* | -- | Upcoming |
| 18 | *Coming Soon* | -- | Upcoming |
| 19 | *Coming Soon* | -- | Upcoming |
| 20 | *Coming Soon* | -- | Upcoming |
| 21 | *Coming Soon* | -- | Upcoming |
| 22 | *Coming Soon* | -- | Upcoming |
| 23 | *Coming Soon* | -- | Upcoming |
| 24 | *Coming Soon* | -- | Upcoming |
| 25 | *Coming Soon* | -- | Upcoming |
| 26 | *Coming Soon* | -- | Upcoming |
| 27 | *Coming Soon* | -- | Upcoming |
| 28 | *Coming Soon* | -- | Upcoming |
| 29 | *Coming Soon* | -- | Upcoming |
| 30 | *Coming Soon* | -- | Upcoming |

---

## Day 01 -- Container and SizedBox (50 Examples)

A deep dive into Flutter's most fundamental layout widget. This file covers:

**Basics (Examples 1-8)**
- Basic container with color, width, height, and alignment
- Padding vs margin with visual demonstration
- BoxDecoration with rounded corners (BorderRadius)
- Borders with customizable width and color
- Box shadows for depth and layering
- Linear gradients with multiple color stops
- Circular containers using BoxShape.circle
- Nested containers for complex layouts
- SizedBox for fixed spacing between widgets

**Advanced Decorations (Examples 9-28)**
- Rotated containers using Matrix4.rotationZ transform
- Neumorphic (Soft UI) design with dual light and dark shadows
- Glassmorphism with semi-transparent overlays
- Animated neon glow with breathing effect
- AnimatedContainer with tap-to-expand interaction
- Pulsating heartbeat using ScaleTransition
- Continuously spinning container with SweepGradient
- Color-shifting animation loop
- Bouncing / floating container with dynamic shadow
- Radial gradient (sun effect)
- Sweep gradient (color wheel)
- 3D perspective using Matrix4 with rotateX and rotateY
- Gradient border using nested container technique
- Multi-shadow RGB glow with four directional colored shadows
- Stacked cards using Stack and Positioned
- Custom dashed border using CustomPaint
- Foreground decoration with vignette overlay
- Animated rotating gradient border
- Badge and chip style pill containers
- Inset shadow for pressed button effect

**Creative and Animated (Examples 29-50)**
- Frosted notification card layout
- Shimmer skeleton loading placeholder
- Shaking error-style container
- Flipping card with 3D Y-axis rotation
- Morphing shape (square to circle animation)
- Sliding container (left-right motion)
- Concentric nested circles with gradient opacity
- Pricing card with gradient background and feature list
- Tap-to-swap gradient and shape
- Diagonal split container using ClipPath
- Music visualizer with animated bars
- Stats counter row with icon cards
- Scale-on-tap with press-and-hold shrink
- Wavy bottom container using custom ClipPath
- Diamond-shaped rotated container
- Social media gradient icon circles
- Animated breathing progress bar
- Dark container with ShaderMask gradient text
- Animated border width toggle on tap
- Layered fanned-out card deck
- Avatar with animated rotating gradient ring (Instagram-story style)
- Ultimate mega showcase: animated rainbow border, gradient text, pulsing scale, and glow shadow combined

---

## How to Use

Each file is a standalone Flutter widget. To run any day's code in your own project:

1. Create a new Flutter project or use an existing one:
   ```
   flutter create my_practice
   ```

2. Copy the desired day's `.dart` file into your `lib/widgets/` directory.

3. Import and use it in your `main.dart`:
   ```dart
   import 'package:my_practice/widgets/Container_size.dart';

   void main() => runApp(MaterialApp(home: Container_size()));
   ```

4. Run the app:
   ```
   flutter run
   ```

No external packages are required for any of the examples -- everything uses only the Flutter SDK.

---

## Key Concepts Covered Across the Challenge

| Category | Topics |
|:---------|:-------|
| **Layout** | Container, SizedBox, Row, Column, Stack, Positioned, Wrap, Expanded |
| **Decoration** | BoxDecoration, BorderRadius, BoxShadow, Border, ShapeDecoration |
| **Gradients** | LinearGradient, RadialGradient, SweepGradient |
| **Animation** | AnimatedContainer, AnimationController, Tween, CurvedAnimation, ScaleTransition, RotationTransition, SlideTransition |
| **Transforms** | Matrix4, rotationZ, rotateX, rotateY, perspective, translate |
| **Clipping** | ClipPath, ClipRRect, CustomClipper |
| **Painting** | CustomPaint, CustomPainter, Canvas, ShaderMask |
| **Design Patterns** | Neumorphism, Glassmorphism, Material Design, Gradient borders, Neon glow, Skeleton loading |

---

## Requirements

- Flutter SDK 3.0 or higher
- Dart 3.0 or higher
- Any platform: Android, iOS, Web, Windows, macOS, Linux

---

## Author

**Asad Wazir**
GitHub: [asadm1704](https://github.com/asadm1704)

---

## License

This project is open source and available under the [MIT License](LICENSE).

---

<div align="center">

*A new day, a new set of widgets. Follow the repository to get notified as each day is published.*

</div>
