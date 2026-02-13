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
|-- Day_02_Rows_Cols_Wrap/
|   |-- rows_cols.dart               # 27 examples: Basic to complex real-world layouts
|
|-- Day_03_ListView_GridView/
|   |-- List_Grid.dart               # 18 examples: All ListView & GridView variations
|
|-- (Day 04 through Day 30 will be added daily)
|
|-- README.md
```

---

## Progress Tracker

| Day | Topic | Examples | Status |
|:---:|:------|:--------:|:------:|
| 01 | **Container and SizedBox** -- Basic containers, padding, margin, BoxDecoration, gradients (linear, radial, sweep), shadows, borders, rounded corners, circular shapes, neumorphism, glassmorphism, neon glow, 3D perspective, transforms, AnimatedContainer, pulsating animation, spinning animation, color shifting, bouncing, morphing shapes, flip cards, shimmer loading, music visualizer, wavy clips, diagonal splits, gradient text, and more | 50 | Complete |
| 02 | **Row, Column and Wrap** -- Horizontal & vertical layouts, main/cross axis alignment, main axis size, text/vertical direction, Expanded & Flexible for responsive space, Spacer for pushing items, Wrap for overflowing layouts, and 20+ real-life examples including Social Media Headers, E-commerce Product Cards, Settings Lists, Chat Bubbles, Profile Headers, Dashboard Stats, Music Player Controls, Food Order Cards, and Order Tracking Timelines. | 27 | Complete |
| 03 | **ListView and GridView** -- ListView.builder, ListView.separated, ListView() default, ListView.custom, Horizontal ListView, Reverse ListView, ListView with itemExtent, ListView with ScrollController, ListView with shrinkWrap, GridView.builder, GridView.count, GridView.extent, GridView() default, GridView with MaxCrossAxisExtent delegate, GridView.custom, Horizontal GridView, GridView with mainAxisExtent, and GridView with childAspectRatio comparisons. | 18 | Complete |
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

## Day 02 -- Row, Column and Wrap (27 Examples)

A comprehensive guide to Flutter's core layout widgets. This file covers:

**Layout Fundamentals (Examples 1-7)**
- **Basic Row:** Horizontal arrangement with center alignment.
- **MainAxisAlignment:** Start, Center, End, SpaceBetween, SpaceAround, and SpaceEvenly demonstrations.
- **Basic Column:** Vertical arrangement with specialized alignment.
- **CrossAxisAlignment:** Aligning items perpendicularly (Start, Center, End).
- **Expanded Widget:** Filling available space with flex factors (e.g., 2:1 ratio).
- **Spacer Widget:** Using empty space to push widgets apart (ideal for nav bars).
- **Wrap Widget:** Handling layout overflow by moving items to the next line/run.

**Real-Life Examples (Examples 8-27)**
- **Social Media Patterns:** Post headers (IG style), Action bars (Like/Comment/Share), Profile headers with stats, and Story-style avatar layouts.
- **Communication UI:** WhatsApp-style chat message bubbles (Sent/Received) and notification list items.
- **E-Commerce & Food:** Amazon-style product cards, Foodpanda-style order cards with quantity toggles, and category filter chips.
- **System & Utility:** Phone Settings items with toggles, Login form layout, and Contact info cards (Phone/Email/Address).
- **Dashboard & Stats:** Admin dashboard stat cards (Users/Revenue) and Order tracking timelines (Daraz style).
- **Media & Content:** Spotify-style music player controls and Instagram-style 3x3 photo gallery grids.
- **Navigation & Pricing:** Bottom navigation bar layout and SaaS subscription pricing plan cards.

---

## Day 03 -- ListView and GridView (18 Examples)

A complete guide to Flutter's scrollable list and grid widgets. This file covers:

**ListView Variations (Examples 1-9)**
- **ListView.builder:** Lazy item creation for large/infinite lists -- the most common and recommended approach.
- **ListView.separated:** Like builder, but with customizable separator widgets between each item (dividers, colored gaps).
- **ListView() Default:** All children created immediately -- best for small, fixed lists with known widgets.
- **ListView.custom:** Maximum control using SliverChildBuilderDelegate for advanced custom behavior.
- **Horizontal ListView:** `scrollDirection: Axis.horizontal` for left/right scrolling cards and items.
- **Reverse ListView:** `reverse: true` for bottom-to-top scrolling (chat-style UI with message bubbles).
- **ListView with itemExtent:** Fixed height per item for improved scroll performance.
- **ListView with ScrollController:** Programmatic scroll-to-top and scroll-to-bottom with animated scrolling.
- **ListView with shrinkWrap:** Nested lists inside SingleChildScrollView using `shrinkWrap: true` and `NeverScrollableScrollPhysics()`.

**GridView Variations (Examples 10-18)**
- **GridView.builder:** Lazy grid item creation -- recommended for large grids with `SliverGridDelegateWithFixedCrossAxisCount`.
- **GridView.count:** Quick shorthand for fixed column count grids with `crossAxisCount`.
- **GridView.extent:** Auto-calculated columns using `maxCrossAxisExtent` for responsive layouts.
- **GridView() Default:** Explicit `gridDelegate` with hardcoded children list (icon dashboard style).
- **GridView.builder + MaxCrossAxisExtent:** `SliverGridDelegateWithMaxCrossAxisExtent` for adaptive column counts.
- **GridView.custom:** Full control with `SliverChildBuilderDelegate` + `SliverGridDelegate` and radial gradients.
- **Horizontal GridView:** `scrollDirection: Axis.horizontal` with 2-row and 3-row horizontal scrolling grids.
- **GridView with mainAxisExtent:** Fixed tile height that overrides `childAspectRatio` for tall card layouts.
- **GridView with childAspectRatio:** Side-by-side comparison of 0.6 (tall), 1.0 (square), and 2.0 (wide) tile ratios.

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
| **Layout** | Container, SizedBox, Row, Column, Stack, Positioned, Wrap, Expanded, ListView, GridView |
| **Decoration** | BoxDecoration, BorderRadius, BoxShadow, Border, ShapeDecoration |
| **Gradients** | LinearGradient, RadialGradient, SweepGradient |
| **Animation** | AnimatedContainer, AnimationController, Tween, CurvedAnimation, ScaleTransition, RotationTransition, SlideTransition |
| **Transforms** | Matrix4, rotationZ, rotateX, rotateY, perspective, translate |
| **Clipping** | ClipPath, ClipRRect, CustomClipper |
| **Painting** | CustomPaint, CustomPainter, Canvas, ShaderMask |
| **Design Patterns** | Neumorphism, Glassmorphism, Material Design, Gradient borders, Neon glow, Skeleton loading |
| **Scrolling** | ListView.builder, ListView.separated, ListView.custom, GridView.builder, GridView.count, GridView.extent, GridView.custom, ScrollController, shrinkWrap, SliverGridDelegate |

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
