import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

// ============================================================================
// ANIMATED TEXT KIT - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS ANIMATED TEXT KIT?
// --------------------------
// AnimatedTextKit is a Flutter package that provides beautiful text animations.
// It makes your text come alive with various animation effects like typing,
// rotating, fading, scaling, and more! Perfect for splash screens, headers,
// or anywhere you want eye-catching text.
//
// INSTALLATION:
// -------------
// Add to pubspec.yaml under dependencies:
//   animated_text_kit: ^4.2.2
// Then run: flutter pub get
//
// IMPORT:
// -------
// import 'package:animated_text_kit/animated_text_kit.dart';
//
// ============================================================================
// ANIMATEDTEXTKIT WIDGET PROPERTIES
// ============================================================================
//
// 1. animatedTexts (required): List<AnimatedText>
//    - List of animated text widgets to display
//    - Each item is one of the animation types (TypewriterAnimatedText, etc.)
//
// 2. totalRepeatCount: int
//    - How many times to repeat the entire animation sequence
//    - Default: 3
//    - Set to a high number for infinite-like behavior
//
// 3. repeatForever: bool
//    - If true, animation repeats forever (default: false)
//
// 4. pause: Duration
//    - Pause between each animated text in the list
//    - Default: Duration(milliseconds: 1000)
//
// 5. displayFullTextOnTap: bool
//    - If true, tapping shows full text immediately (default: false)
//
// 6. stopPauseOnTap: bool
//    - If true, tapping skips pause and moves to next text (default: false)
//
// 7. onTap: VoidCallback?
//    - Callback function when text is tapped
//
// 8. onNext: void Function(int index, bool isLast)?
//    - Called when moving to next text
//    - index: current text index, isLast: if it's the last text
//
// 9. onNextBeforePause: void Function(int index, bool isLast)?
//    - Called before pause, when current text finishes
//
// 10. onFinished: VoidCallback?
//     - Called when all animations complete
//
// 11. isRepeatingAnimation: bool
//     - Whether to repeat each individual text animation (default: true)
//
// ============================================================================
// ANIMATED TEXT TYPES (Built-in Animations)
// ============================================================================
//
// 1. TypewriterAnimatedText - Types text character by character
//    Properties:
//    - text: String (required) - The text to animate
//    - textStyle: TextStyle? - Style for the text
//    - speed: Duration - Time between each character (default: 30ms)
//    - cursor: String - Cursor character (default: '_')
//    - curve: Curve - Animation curve (default: Curves.linear)
//
// 2. TyperAnimatedText - Similar to typewriter but smoother
//    Properties:
//    - text: String (required)
//    - textStyle: TextStyle?
//    - speed: Duration (default: 40ms)
//
// 3. RotateAnimatedText - Rotates text in 3D
//    Properties:
//    - text: String (required)
//    - textStyle: TextStyle?
//    - duration: Duration - Total animation time (default: 2 seconds)
//    - rotateOut: bool - Rotate out or in (default: true)
//    - alignment: Alignment - Text alignment
//
// 4. FadeAnimatedText - Fades text in and out
//    Properties:
//    - text: String (required)
//    - textStyle: TextStyle?
//    - duration: Duration (default: 2 seconds)
//    - fadeInEnd: double - When fade in ends (0.0-1.0, default: 0.5)
//    - fadeOutBegin: double - When fade out starts (0.0-1.0, default: 0.8)
//
// 5. ScaleAnimatedText - Scales text up/down
//    Properties:
//    - text: String (required)
//    - textStyle: TextStyle?
//    - duration: Duration (default: 2 seconds)
//    - scalingFactor: double - How much to scale (default: 0.5)
//
// 6. WavyAnimatedText - Text with wave effect
//    Properties:
//    - text: String (required)
//    - textStyle: TextStyle?
//    - speed: Duration - Wave speed (default: 300ms)
//
// 7. FlickerAnimatedText - Text with flicker/glitch effect
//    Properties:
//    - text: String (required)
//    - textStyle: TextStyle?
//    - speed: Duration (default: 1600ms)
//    - entryEnd: double - When entry animation ends (default: 0.3)
//
// 8. ColorizeAnimatedText - Animates through multiple colors
//    Properties:
//    - text: String (required)
//    - textStyle: TextStyle (required) - Must have fontSize
//    - colors: List<Color> (required) - Colors to animate through
//    - speed: Duration (default: 200ms)
//
// ============================================================================
// TEXTLIQUIDFILL WIDGET PROPERTIES
// ============================================================================
//
// TextLiquidFill creates a text with liquid/wave fill animation effect.
// It's a standalone widget (not used inside AnimatedTextKit).
//
// REQUIRED PROPERTIES:
// --------------------
// 1. text: String
//    - The text to display with liquid effect
//
// OPTIONAL PROPERTIES:
// --------------------
// 2. textStyle: TextStyle
//    - Style for the text (fontSize, fontWeight, etc.)
//    - Default: TextStyle(fontSize: 140, fontWeight: FontWeight.bold)
//
// 3. textAlign: TextAlign
//    - Alignment of the text (default: TextAlign.left)
//
// 4. waveColor: Color
//    - Color of the liquid/wave (default: Colors.blueAccent)
//
// 5. boxBackgroundColor: Color
//    - Background color behind the text (default: Colors.black)
//
// 6. boxHeight: double
//    - Height of the container (default: 250.0)
//
// 7. boxWidth: double
//    - Width of the container (default: double.infinity)
//
// 8. loadDuration: Duration
//    - How long the liquid takes to fill (default: 6 seconds)
//
// 9. waveDuration: Duration
//    - Duration of wave animation cycle (default: 2 seconds)
//
// 10. loadUntil: double
//     - How full the liquid fills (0.0-1.0, default: 1.0)
//
// ============================================================================

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Animated Text Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // EXAMPLE 1: TextLiquidFill
            // ==============================================================
            // A text with liquid wave fill animation
            const Text(
              '1. TextLiquidFill',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Text fills up like liquid in a container:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // TextLiquidFill - standalone widget (not inside AnimatedTextKit)
            SizedBox(
              height: 100,
              child: TextLiquidFill(
                // The text to display
                text: 'LIQUID',

                // Color of the wave/liquid
                waveColor: Colors.blueAccent,

                // Background color of the box
                boxBackgroundColor: Colors.black,

                // Text styling
                textStyle: const TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                ),

                // Height of the container
                boxHeight: 100.0,

                // How long it takes to fill (optional)
                // loadDuration: Duration(seconds: 6),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 2: AnimatedTextKit with Multiple Animations
            // ==============================================================
            const Text(
              '2. AnimatedTextKit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Multiple text animations in sequence:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Container to give it some height
            SizedBox(
              height: 80,
              child: AnimatedTextKit(
                // List of different animated texts
                animatedTexts: [
                  // ---- TYPEWRITER ANIMATION ----
                  // Types text character by character like a typewriter
                  TypewriterAnimatedText(
                    'Hello Flutter!',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                    // Speed of typing each character
                    speed: const Duration(milliseconds: 100),
                    // Cursor character shown while typing
                    cursor: '|',
                  ),

                  // ---- ROTATE ANIMATION ----
                  // Text rotates in 3D effect
                  RotateAnimatedText(
                    'ROTATE EFFECT',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),

                  // ---- WAVY ANIMATION ----
                  // Each letter waves up and down
                  WavyAnimatedText(
                    'Wavy Text Here',
                    textStyle: const TextStyle(
                      fontSize: 28.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],

                // How many times to repeat entire sequence
                totalRepeatCount: 5,

                // Pause between each animated text
                pause: const Duration(milliseconds: 1000),

                // Tap to show full text immediately
                displayFullTextOnTap: true,

                // Tap to skip pause and go to next text
                stopPauseOnTap: true,

                // Callback when animation finishes
                onFinished: () {
                  print('Animation finished!');
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 3: Fade Animation
            // ==============================================================
            const Text(
              '3. FadeAnimatedText',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Text fades in and out smoothly:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 50,
              child: AnimatedTextKit(
                repeatForever: true, // Repeat forever
                animatedTexts: [
                  FadeAnimatedText(
                    'Fade In Fade Out',
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                  FadeAnimatedText(
                    'Smooth Transitions',
                    textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 4: Scale Animation
            // ==============================================================
            const Text(
              '4. ScaleAnimatedText',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Text scales up from small to large:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 50,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ScaleAnimatedText(
                    'SCALE UP!',
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                    // How small it starts (0.5 = half size)
                    scalingFactor: 0.2,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // SUMMARY BOX
            // ==============================================================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📝 Quick Tips:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• TextLiquidFill is standalone, not inside AnimatedTextKit'),
                  Text('• Use repeatForever: true for infinite animations'),
                  Text('• Wrap in SizedBox to control height'),
                  Text('• Use speed property to control animation speed'),
                  Text('• Combine multiple animation types in one list'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
