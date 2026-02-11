import 'dart:math' as math;
import 'package:flutter/material.dart';

// ============================================================================
// CONTAINER & SIZEBOX - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS A CONTAINER?
// --------------------
// Container is one of the most versatile widgets in Flutter. It's like a "box"
// that can contain another widget and apply various visual properties like
// padding, margin, decoration, size, and transformations.
//
// Think of it as a <div> in HTML - it's a wrapper that can style its child.
//
// WHEN TO USE CONTAINER:
// ----------------------
// - When you need to add padding, margin, or decoration to a widget
// - When you need a colored background or border
// - When you need rounded corners or shadows
// - When you need to constrain size with specific width/height
//
// WHAT IS A SIZEBOX?
// ------------------
// SizedBox is a simpler widget that just adds fixed width/height or spacing.
// It's more lightweight than Container when you only need sizing.
//
// WHEN TO USE SIZEBOX:
// --------------------
// - For adding fixed spacing between widgets: SizedBox(height: 20)
// - For giving a child widget fixed dimensions
// - When you don't need decoration, padding, or other Container features
//
// ============================================================================
// CONTAINER PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// CHILD & ALIGNMENT:
// ------------------
// 1. child: Widget?
//    - The widget inside the container
//    - Only one child allowed (use Row/Column for multiple)
//
// 2. alignment: AlignmentGeometry?
//    - How to align the child within the container
//    - Values: Alignment.center, .topLeft, .bottomRight, etc.
//    - Also: Alignment(x, y) where x,y are -1 to 1
//
// SIZE PROPERTIES:
// ----------------
// 3. width: double?
//    - Fixed width of the container
//    - Example: width: 200
//
// 4. height: double?
//    - Fixed height of the container
//    - Example: height: 100
//
// 5. constraints: BoxConstraints?
//    - Min/max width and height constraints
//    - Example: constraints: BoxConstraints(
//                 minWidth: 100, maxWidth: 300,
//                 minHeight: 50, maxHeight: 200)
//
// SPACING PROPERTIES:
// -------------------
// 6. padding: EdgeInsetsGeometry?
//    - Space INSIDE the container (between border and child)
//    - Example: padding: EdgeInsets.all(16)
//    - Other options:
//      - EdgeInsets.symmetric(horizontal: 20, vertical: 10)
//      - EdgeInsets.only(left: 10, top: 5)
//      - EdgeInsets.fromLTRB(left, top, right, bottom)
//
// 7. margin: EdgeInsetsGeometry?
//    - Space OUTSIDE the container (between container and other widgets)
//    - Same EdgeInsets options as padding
//
// DECORATION PROPERTIES:
// ----------------------
// 8. decoration: Decoration?
//    - Visual decoration of the container (background, border, shadow, etc.)
//    - Usually use BoxDecoration (see below)
//    - NOTE: Cannot use both color and decoration together!
//
// 9. foregroundDecoration: Decoration?
//    - Decoration painted on top of the child
//
// 10. color: Color?
//     - Background color (shorthand for decoration with color)
//     - Example: color: Colors.blue
//     - NOTE: Use either color OR decoration, not both!
//
// TRANSFORM PROPERTIES:
// ---------------------
// 11. transform: Matrix4?
//     - Transformation matrix applied to container
//     - Example: transform: Matrix4.rotationZ(0.1) // Rotate slightly
//
// 12. transformAlignment: AlignmentGeometry?
//     - Origin point for transform (default: center)
//
// OTHER PROPERTIES:
// -----------------
// 13. clipBehavior: Clip
//     - How to clip content that overflows
//     - Values: Clip.none, .hardEdge, .antiAlias, .antiAliasWithSaveLayer
//
// ============================================================================
// BOXDECORATION PROPERTIES (Used with Container's decoration)
// ============================================================================
//
// 1. color: Color?
//    - Background color of the box
//
// 2. image: DecorationImage?
//    - Background image
//    - Example: image: DecorationImage(
//                 image: NetworkImage('url'),
//                 fit: BoxFit.cover)
//
// 3. border: BoxBorder?
//    - Border around the box
//    - Example: border: Border.all(color: Colors.blue, width: 2)
//    - Also: Border(top: BorderSide(), bottom: BorderSide())
//
// 4. borderRadius: BorderRadiusGeometry?
//    - Rounded corners (cannot use with shape: BoxShape.circle)
//    - Example: borderRadius: BorderRadius.circular(20)
//    - Also: BorderRadius.only(topLeft: Radius.circular(10))
//
// 5. boxShadow: List<BoxShadow>?
//    - Shadows beneath the box
//    - Example: boxShadow: [BoxShadow(
//                 color: Colors.grey,
//                 blurRadius: 10,
//                 spreadRadius: 2,
//                 offset: Offset(2, 2))]
//
// 6. gradient: Gradient?
//    - Background gradient (linear, radial, or sweep)
//    - Example: gradient: LinearGradient(
//                 colors: [Colors.blue, Colors.purple])
//
// 7. backgroundBlendMode: BlendMode?
//    - How the background blends with content behind
//
// 8. shape: BoxShape
//    - Shape of the box
//    - Values: BoxShape.rectangle (default), BoxShape.circle
//    - NOTE: Use circle OR borderRadius, not both!
//
// ============================================================================
// SIZEBOX PROPERTIES
// ============================================================================
//
// 1. width: double?
//    - Width of the box
//
// 2. height: double?
//    - Height of the box
//
// 3. child: Widget?
//    - Optional child widget
//
// SPECIAL CONSTRUCTORS:
// ---------------------
// - SizedBox.expand() - Takes all available space
// - SizedBox.shrink() - Takes minimum space (0x0)
// - SizedBox.fromSize(size: Size(width, height))
// - SizedBox.square(dimension: 50) - Square box
//
// ============================================================================

class Container_size extends StatefulWidget {
  const Container_size({super.key});

  @override
  State<Container_size> createState() => _Container_sizeState();
}

class _Container_sizeState extends State<Container_size>
    with TickerProviderStateMixin {
  // AnimatedContainer toggle
  bool _isExpanded = false;

  // Pulsating animation
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  // Rotating animation
  late AnimationController _rotateController;

  // Color shifting animation
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  // Bouncing animation
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  // Breathing glow animation
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  // Shake animation
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  // Flip animation
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  // Slide animation
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  // Morphing shape
  late AnimationController _morphController;
  late Animation<double> _morphAnimation;

  // Tap states for interactive containers
  bool _isTapped1 = false;
  bool _isTapped2 = false;
  bool _isTapped3 = false;

  @override
  void initState() {
    super.initState();

    // Pulsating
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Rotating
    _rotateController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    // Color shifting
    _colorController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _colorAnimation = ColorTween(begin: Colors.deepPurple, end: Colors.cyan)
        .animate(
          CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
        );

    // Bouncing
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _bounceAnimation = Tween<double>(begin: 0, end: -30).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );

    // Breathing glow
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _glowAnimation = Tween<double>(begin: 2, end: 20).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Shake
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _shakeAnimation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );

    // Flip
    _flipController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _flipAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _flipController, curve: Curves.linear));

    // Slide
    _slideController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(-0.3, 0),
          end: const Offset(0.3, 0),
        ).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );

    // Morphing
    _morphController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _morphAnimation = Tween<double>(begin: 10, end: 60).animate(
      CurvedAnimation(parent: _morphController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    _colorController.dispose();
    _bounceController.dispose();
    _glowController.dispose();
    _shakeController.dispose();
    _flipController.dispose();
    _slideController.dispose();
    _morphController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Container & SizedBox Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // EXAMPLE 1: Basic Container with Color
            // ==============================================================
            const Text(
              '1. Basic Container with Color',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Simple container with width, height, and color:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 15),

            Container(
              // Fixed dimensions
              width: 150,
              height: 80,
              // Background color (simple way)
              color: Colors.blue,
              // Align child in center
              alignment: Alignment.center,
              // Child widget
              child: const Text(
                'Basic Container',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 2: Container with Padding & Margin
            // ==============================================================
            const Text(
              '2. Container with Padding & Margin',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Padding = inside spacing, Margin = outside spacing:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Outer container to show margin effect
            Container(
              color: Colors.yellow.shade100,
              child: Container(
                // Margin: space OUTSIDE (yellow visible around)
                margin: const EdgeInsets.all(30),
                // Padding: space INSIDE (between blue and text)
                padding: const EdgeInsets.all(15),
                color: Colors.blue,
                child: const Text(
                  'I have padding & margin!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 3: Container with BoxDecoration
            // ==============================================================
            const Text(
              '3. Container with Rounded Corners',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using BoxDecoration for rounded corners:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: 200,
              height: 100,
              // Use decoration instead of color for advanced styling
              decoration: BoxDecoration(
                color: Colors.green,
                // Rounded corners
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Rounded Corners!',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 4: Container with Border & Shadow
            // ==============================================================
            const Text(
              '4. Container with Border & Shadow',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Adding border and boxShadow for depth:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                // Border around the container
                border: Border.all(color: Colors.purple, width: 5),
                // Rounded corners
                borderRadius: BorderRadius.circular(15),
                // Shadow effect
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.7),
                    blurRadius: 15, // How blurry the shadow is
                    spreadRadius: 4, // How far shadow spreads
                    offset: const Offset(4, 4), // Shadow position (x, y)
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Text(
                'Border & Shadow',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 5: Container with Gradient
            // ==============================================================
            const Text(
              '5. Container with Gradient',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using LinearGradient for colorful backgrounds:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity, // Full width
              height: 100,
              decoration: BoxDecoration(
                // Gradient background
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue, Colors.purple, Colors.red, Colors.pink],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Beautiful Gradient!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 6: Circular Container
            // ==============================================================
            const Text(
              '6. Circular Container (Avatar Style)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using BoxShape.circle for circular containers:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  // Make it circular
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'AW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 7: Nested Containers
            // ==============================================================
            const Text(
              '7. Nested Containers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Containers inside containers for complex layouts:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                // Nested container
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Nested!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 8: SizedBox for Spacing
            // ==============================================================
            const Text(
              '8. SizedBox for Spacing',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'SizedBox is perfect for adding fixed space:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                // SizedBox for horizontal spacing
                const SizedBox(width: 20),
                Container(width: 50, height: 50, color: Colors.green),
                // SizedBox for horizontal spacing
                const SizedBox(width: 20),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 9: Container with Transform (Rotated)
            // ==============================================================
            const Text(
              '9. Rotated Container (Transform)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using Matrix4 transform to rotate containers:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Center(
              child: Container(
                width: 120,
                height: 120,
                // Rotate the container 15 degrees
                transform: Matrix4.rotationZ(0.26),
                transformAlignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.deepOrange, Colors.amber],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  '🔥 Tilted!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ==============================================================
            // EXAMPLE 10: Neumorphic Container (Soft UI)
            // ==============================================================
            const Text(
              '10. Neumorphic Container (Soft UI)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Modern soft shadow design technique:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E5EC),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    // Dark shadow (bottom-right)
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(6, 6),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    // Light shadow (top-left) for embossed effect
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-6, -6),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.favorite,
                  size: 60,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 11: Glassmorphism Container
            // ==============================================================
            const Text(
              '11. Glassmorphism Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Frosted glass effect with translucent background:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Colors.pink, Colors.deepPurple, Colors.blue],
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 280,
                height: 150,
                decoration: BoxDecoration(
                  // Semi-transparent white for glass effect
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.white, size: 36),
                    SizedBox(height: 8),
                    Text(
                      'Glassmorphism ✨',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 12: Neon Glow Container (Animated)
            // ==============================================================
            const Text(
              '12. Neon Glow Container (Animated)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Breathing neon glow animation:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.cyanAccent, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.6),
                          blurRadius: _glowAnimation.value,
                          spreadRadius: _glowAnimation.value / 4,
                        ),
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.3),
                          blurRadius: _glowAnimation.value * 2,
                          spreadRadius: _glowAnimation.value / 2,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '⚡ NEON GLOW',
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 13: AnimatedContainer (Tap to Animate)
            // ==============================================================
            const Text(
              '13. AnimatedContainer (Tap to Animate)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap the box to see it animate smoothly:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.elasticOut,
                  width: _isExpanded ? 300 : 150,
                  height: _isExpanded ? 150 : 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _isExpanded
                          ? [Colors.teal, Colors.greenAccent]
                          : [Colors.indigo, Colors.purpleAccent],
                    ),
                    borderRadius: BorderRadius.circular(_isExpanded ? 30 : 15),
                    boxShadow: [
                      BoxShadow(
                        color: (_isExpanded ? Colors.teal : Colors.indigo)
                            .withOpacity(0.5),
                        blurRadius: _isExpanded ? 20 : 10,
                        spreadRadius: _isExpanded ? 5 : 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _isExpanded ? '🎉 EXPANDED!' : '👆 Tap Me!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 14: Pulsating Container (Scale Animation)
            // ==============================================================
            const Text(
              '14. Pulsating Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Continuous pulsing heartbeat effect:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: ScaleTransition(
                scale: _pulseAnimation,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Colors.redAccent, Colors.red, Colors.deepOrange],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text('❤️', style: TextStyle(fontSize: 40)),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 15: Spinning Container
            // ==============================================================
            const Text(
              '15. Spinning Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Continuously rotating container:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Center(
              child: RotationTransition(
                turns: _rotateController,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const SweepGradient(
                      colors: [
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                        Colors.green,
                        Colors.blue,
                        Colors.purple,
                        Colors.red,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Text('🌀', style: TextStyle(fontSize: 28)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ==============================================================
            // EXAMPLE 16: Color Shifting Container
            // ==============================================================
            const Text(
              '16. Color Shifting Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Animated color transition loop:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Container(
                    width: 220,
                    height: 100,
                    decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: (_colorAnimation.value ?? Colors.purple)
                              .withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 3,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '🎨 Color Shift',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 17: Bouncing Container
            // ==============================================================
            const Text(
              '17. Bouncing Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Floating up and down animation:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _bounceAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _bounceAnimation.value),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF764ba2).withOpacity(0.4),
                            blurRadius: 20 + (-_bounceAnimation.value),
                            spreadRadius: 2,
                            offset: Offset(
                              0,
                              10 + (-_bounceAnimation.value / 2),
                            ),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '🪄\nFloating',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // ==============================================================
            // EXAMPLE 18: Radial Gradient Container
            // ==============================================================
            const Text(
              '18. Radial Gradient Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Center-radiating gradient effect:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.yellow.shade300,
                      Colors.orange,
                      Colors.deepOrange,
                      Colors.red.shade900,
                    ],
                    stops: const [0.2, 0.5, 0.7, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.6),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text('☀️', style: TextStyle(fontSize: 50)),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 19: Sweep Gradient Container
            // ==============================================================
            const Text(
              '19. Sweep Gradient Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A spinning-wheel style gradient:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const SweepGradient(
                    startAngle: 0,
                    endAngle: math.pi * 2,
                    colors: [
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.red,
                      Colors.blue,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text('🎯', style: TextStyle(fontSize: 36)),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 20: 3D Perspective Container
            // ==============================================================
            const Text(
              '20. 3D Perspective Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using Matrix4 for a 3D tilt effect:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002) // perspective
                  ..rotateX(0.3)
                  ..rotateY(-0.3),
                child: Container(
                  width: 180,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF11998e).withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(10, 15),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '🧊 3D Effect',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 21: Gradient Border Container
            // ==============================================================
            const Text(
              '21. Gradient Border Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fake gradient border using nested containers:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                padding: const EdgeInsets.all(4), // Border width
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.pink, Colors.blue, Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: 220,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '🌈 Gradient Border',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 22: Multi-Shadow Layered Container
            // ==============================================================
            const Text(
              '22. Multi-Shadow Layered Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Multiple colored shadows stacked for a colorful glow:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(-10, -10),
                    ),
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(10, -10),
                    ),
                    BoxShadow(
                      color: Colors.green.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(-10, 10),
                    ),
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(10, 10),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  '🎆\nRGB Glow',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 23: Stacked Fancy Card
            // ==============================================================
            const Text(
              '23. Stacked Fancy Card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Overlapping containers with Stack for a layered look:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: SizedBox(
                width: 240,
                height: 170,
                child: Stack(
                  children: [
                    // Back card
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 200,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    // Middle card
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 200,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    // Front card
                    Container(
                      width: 200,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrange.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: Colors.white,
                            size: 36,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Stacked Cards',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 24: Dotted Decoration Container
            // ==============================================================
            const Text(
              '24. Custom Dashed Border Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using CustomPaint for a dashed border:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: CustomPaint(
                painter: DashedBorderPainter(
                  color: Colors.deepPurple,
                  strokeWidth: 2.5,
                  dashWidth: 8,
                  dashSpace: 5,
                  radius: 15,
                ),
                child: Container(
                  width: 220,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text(
                    '- - Dashed! - -',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 25: Foreground Decoration (Striped Overlay)
            // ==============================================================
            const Text(
              '25. Foreground Decoration Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Container with foregroundDecoration painted on top:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 220,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.teal, Colors.lightGreenAccent],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '🌿 Vignette Effect',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 26: Animated Rotating Gradient Border
            // ==============================================================
            const Text(
              '26. Animated Rotating Gradient Border',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A spinning gradient border around a container:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _rotateController,
                builder: (context, child) {
                  return Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: SweepGradient(
                        startAngle: _rotateController.value * 2 * math.pi,
                        colors: const [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.purple,
                          Colors.red,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '🔮 Magic\nBorder',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 27: Badge-Style Container
            // ==============================================================
            const Text(
              '27. Badge / Chip Style Containers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Small pill-shaped status containers:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildBadge('🟢 Online', Colors.green),
                _buildBadge('🔴 Busy', Colors.red),
                _buildBadge('🟡 Away', Colors.orange),
                _buildBadge('⭐ Pro', Colors.deepPurple),
                _buildBadge('🔥 Hot', Colors.deepOrange),
                _buildBadge('✅ Verified', Colors.teal),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 28: Inset Shadow (Inner Shadow Simulation)
            // ==============================================================
            const Text(
              '28. Inset Shadow (Pressed Effect)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Simulating an inner shadow / pressed button:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 180,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E5EC),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    // Outer light (top-left)
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 5,
                    ),
                    // Outer dark (bottom-right)
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 160,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E5EC),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      // Inner dark (inset simulation)
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(-2, -2),
                        blurRadius: 4,
                      ),
                      // Inner light
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Pressed',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 29: Frosted Notification Card
            // ==============================================================
            const Text(
              '29. Frosted Notification Card',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A modern notification-style container:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Update Available!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tap to download v2.0',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 30: Shimmer / Skeleton Container
            // ==============================================================
            const Text(
              '30. Shimmer Skeleton Loader',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Animated shimmer loading effect:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            AnimatedBuilder(
              animation: _slideController,
              builder: (context, child) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment(_slideController.value * 2 - 1, 0),
                            end: Alignment(_slideController.value * 2, 0),
                            colors: [
                              Colors.grey.shade200,
                              Colors.grey.shade100,
                              Colors.grey.shade200,
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 14,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment(
                                    _slideController.value * 2 - 1,
                                    0,
                                  ),
                                  end: Alignment(_slideController.value * 2, 0),
                                  colors: [
                                    Colors.grey.shade300,
                                    Colors.grey.shade100,
                                    Colors.grey.shade300,
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 14,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  begin: Alignment(
                                    _slideController.value * 2 - 1,
                                    0,
                                  ),
                                  end: Alignment(_slideController.value * 2, 0),
                                  colors: [
                                    Colors.grey.shade300,
                                    Colors.grey.shade100,
                                    Colors.grey.shade300,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 31: Shaking Container
            // ==============================================================
            const Text(
              '31. Shaking Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Vibrating/shaking error-style animation:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _shakeAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_shakeAnimation.value, 0),
                    child: Container(
                      width: 200,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.redAccent, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, color: Colors.redAccent),
                          SizedBox(width: 8),
                          Text(
                            'Error! Shaking!',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 32: Flip Card Container
            // ==============================================================
            const Text(
              '32. Flipping Card Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Continuous Y-axis flip animation:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  final angle = _flipAnimation.value * math.pi * 2;
                  final isFront = (angle % (2 * math.pi)) < math.pi;
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(angle),
                    child: Container(
                      width: 160,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isFront
                              ? [
                                  const Color(0xFFf093fb),
                                  const Color(0xFFf5576c),
                                ]
                              : [
                                  const Color(0xFF4facfe),
                                  const Color(0xFF00f2fe),
                                ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: (isFront ? Colors.pink : Colors.blue)
                                .withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        isFront ? '🎭 Front' : '🔮 Back',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 33: Morphing Border Radius Container
            // ==============================================================
            const Text(
              '33. Morphing Shape Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Border radius animates between square and circle:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _morphAnimation,
                builder: (context, child) {
                  return Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        _morphAnimation.value,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFa18cd1).withOpacity(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '🫧\nMorph',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 34: Sliding Container
            // ==============================================================
            const Text(
              '34. Sliding Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Container slides left and right:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            SlideTransition(
              position: _slideAnimation,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF43e97b), Color(0xFF38f9d7)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43e97b).withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  '↔️ Sliding!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 35: Concentric Circles
            // ==============================================================
            const Text(
              '35. Concentric Circles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Nested circles with decreasing opacity:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple.withOpacity(0.1),
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple.withOpacity(0.2),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple.withOpacity(0.4),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepPurple,
                      ),
                      alignment: Alignment.center,
                      child: const Text('🎯', style: TextStyle(fontSize: 24)),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 36: Pricing Card Container
            // ==============================================================
            const Text(
              '36. Pricing Card Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A beautiful pricing card layout:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                width: 220,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6366f1), Color(0xFF8b5cf6)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6366f1).withOpacity(0.4),
                      blurRadius: 25,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'PRO',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '\$29',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/month',
                      style: TextStyle(color: Colors.white60, fontSize: 14),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Unlimited Access',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Priority Support',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Custom Themes',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 37: Tap-to-Swap Colors Container
            // ==============================================================
            const Text(
              '37. Tap-to-Swap Colors',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap to smoothly swap gradient colors:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: GestureDetector(
                onTap: () => setState(() => _isTapped1 = !_isTapped1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOutCubic,
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _isTapped1
                          ? [const Color(0xFFf5af19), const Color(0xFFf12711)]
                          : [const Color(0xFF12c2e9), const Color(0xFFc471ed)],
                    ),
                    borderRadius: BorderRadius.circular(_isTapped1 ? 50 : 15),
                    boxShadow: [
                      BoxShadow(
                        color: (_isTapped1 ? Colors.orange : Colors.purple)
                            .withOpacity(0.5),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _isTapped1 ? '🔥 Hot!' : '❄️ Cool!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 38: Diagonal Split Container
            // ==============================================================
            const Text(
              '38. Diagonal Split Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ClipPath with a diagonal divider:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: SizedBox(
                width: 250,
                height: 120,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1a1a2e),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    ClipPath(
                      clipper: DiagonalClipper(),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFe94560), Color(0xFFff6b6b)],
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                    const Positioned.fill(
                      child: Center(
                        child: Text(
                          '⚡ Diagonal Split',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 39: Music Visualizer Container
            // ==============================================================
            const Text(
              '39. Music Visualizer Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Animated bars simulating audio visualization:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF1a1a2e),
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(15, (i) {
                  return AnimatedBuilder(
                    animation: _bounceController,
                    builder: (context, child) {
                      final h =
                          20.0 +
                          40.0 *
                              ((math
                                  .sin(
                                    (_bounceController.value * math.pi * 2) +
                                        (i * 0.5),
                                  )
                                  .abs()));
                      return Container(
                        width: 8,
                        height: h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.cyanAccent,
                              Colors.purpleAccent.withOpacity(0.8),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 40: Stats Counter Container
            // ==============================================================
            const Text(
              '40. Stats Counter Row',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Clean stat cards in a row:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                _buildStatCard(
                  'Downloads',
                  '12.5K',
                  Icons.download,
                  const Color(0xFF3b82f6),
                ),
                const SizedBox(width: 10),
                _buildStatCard(
                  'Rating',
                  '4.9 ⭐',
                  Icons.star,
                  const Color(0xFFf59e0b),
                ),
                const SizedBox(width: 10),
                _buildStatCard(
                  'Users',
                  '8.2K',
                  Icons.people,
                  const Color(0xFF10b981),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 41: Animated Scale-on-Tap
            // ==============================================================
            const Text(
              '41. Scale-on-Tap Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Press and hold to shrink, release to bounce back:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: GestureDetector(
                onTapDown: (_) => setState(() => _isTapped2 = true),
                onTapUp: (_) => setState(() => _isTapped2 = false),
                onTapCancel: () => setState(() => _isTapped2 = false),
                child: AnimatedScale(
                  scale: _isTapped2 ? 0.85 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutBack,
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFfc5c7d), Color(0xFF6a82fb)],
                      ),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6a82fb).withOpacity(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '👇 Hold Me!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 42: Wavy Bottom Container
            // ==============================================================
            const Text(
              '42. Wavy Bottom Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Custom clipped wave shape at the bottom:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: const Alignment(0, -0.3),
                child: const Text(
                  '🌊 Wavy Container',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 43: Diamond Container
            // ==============================================================
            const Text(
              '43. Diamond Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A 45° rotated square forming a diamond:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Center(
              child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00c6ff), Color(0xFF0072ff)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0072ff).withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: -math.pi / 4,
                    child: const Text('💎', style: TextStyle(fontSize: 32)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ==============================================================
            // EXAMPLE 44: Social Media Icon Row
            // ==============================================================
            const Text(
              '44. Social Media Icon Containers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Gradient icon circles:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialIcon(Icons.camera_alt, [
                  const Color(0xFFf09433),
                  const Color(0xFFe6683c),
                  const Color(0xFFdc2743),
                  const Color(0xFFcc2366),
                  const Color(0xFFbc1888),
                ]),
                _buildSocialIcon(Icons.smart_display, [
                  const Color(0xFFFF0000),
                  const Color(0xFFCC0000),
                ]),
                _buildSocialIcon(Icons.music_note, [
                  const Color(0xFF25F4EE),
                  const Color(0xFFFE2C55),
                ]),
                _buildSocialIcon(Icons.code, [
                  const Color(0xFF333333),
                  const Color(0xFF666666),
                ]),
                _buildSocialIcon(Icons.chat_bubble, [
                  const Color(0xFF25D366),
                  const Color(0xFF128C7E),
                ]),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 45: Animated Progress Bar Container
            // ==============================================================
            const Text(
              '45. Animated Progress Bar Container',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A breathing progress indicator:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  final fraction = (_glowAnimation.value - 2) / 18;
                  return FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.3 + 0.5 * fraction,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF764ba2).withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${(30 + 50 * fraction).toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 46: Gradient Text on Dark Container
            // ==============================================================
            const Text(
              '46. Dark Container with Gradient Text',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'ShaderMask for gradient text:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF0f0f23),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFf9d423), Color(0xFFff4e50)],
                ).createShader(bounds),
                child: const Text(
                  '✦ FLUTTER MAGIC ✦',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 47: Animated Border Width Container
            // ==============================================================
            const Text(
              '47. Animated Border Width',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tap to animate border thickness and color:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: GestureDetector(
                onTap: () => setState(() => _isTapped3 = !_isTapped3),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutBack,
                  width: 180,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _isTapped3 ? Colors.deepOrange : Colors.blue,
                      width: _isTapped3 ? 6 : 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (_isTapped3 ? Colors.deepOrange : Colors.blue)
                            .withOpacity(0.3),
                        blurRadius: _isTapped3 ? 20 : 8,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _isTapped3 ? '🟠 Thick!' : '🔵 Thin',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _isTapped3 ? Colors.deepOrange : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 48: Layered Cards Deck
            // ==============================================================
            const Text(
              '48. Layered Cards Deck',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fanned-out card stack with rotation:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Center(
              child: SizedBox(
                width: 220,
                height: 160,
                child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(5, (i) {
                    final colors = [
                      [const Color(0xFFf093fb), const Color(0xFFf5576c)],
                      [const Color(0xFF4facfe), const Color(0xFF00f2fe)],
                      [const Color(0xFF43e97b), const Color(0xFF38f9d7)],
                      [const Color(0xFFfa709a), const Color(0xFFfee140)],
                      [const Color(0xFF667eea), const Color(0xFF764ba2)],
                    ];
                    return Transform.rotate(
                      angle: (i - 2) * 0.12,
                      child: Container(
                        width: 140,
                        height: 90,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: colors[i]),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 49: Circular Avatar with Ring
            // ==============================================================
            const Text(
              '49. Avatar with Gradient Ring',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Instagram-story style gradient ring:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _rotateController,
                builder: (context, child) {
                  return Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        startAngle: _rotateController.value * 2 * math.pi,
                        colors: const [
                          Color(0xFFfeda75),
                          Color(0xFFfa7e1e),
                          Color(0xFFd62976),
                          Color(0xFF962fbf),
                          Color(0xFF4f5bd5),
                          Color(0xFFfeda75),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [Color(0xFFe0c3fc), Color(0xFF8ec5fc)],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text('👤', style: TextStyle(fontSize: 40)),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 50: Full Showcase Mega Container
            // ==============================================================
            const Text(
              '50. Mega Showcase Container 🏆',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Combining multiple effects into one epic container:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.95 + 0.05 * _pulseAnimation.value,
                    child: Container(
                      width: 280,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: SweepGradient(
                          startAngle: _rotateController.value * 2 * math.pi,
                          colors: const [
                            Colors.red,
                            Colors.orange,
                            Colors.yellow,
                            Colors.green,
                            Colors.blue,
                            Colors.purple,
                            Colors.red,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent.withOpacity(0.3),
                            blurRadius: 25,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0f0c29),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  Colors.cyanAccent,
                                  Colors.purpleAccent,
                                ],
                              ).createShader(bounds),
                              child: const Text(
                                '🎆 ULTIMATE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 3,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'CONTAINER',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                                letterSpacing: 8,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              height: 2,
                              width: 80,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.cyanAccent,
                                    Colors.transparent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Animated border + gradient text\n+ pulsing scale + glow shadow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 12,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // SUMMARY BOX
            // ==============================================================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.pink.shade400, width: 2.5),
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
                  Text('• Use color OR decoration, not both together'),
                  Text('• padding = inside, margin = outside'),
                  Text('• Use SizedBox for simple spacing'),
                  Text(
                    '• BorderRadius for rounded, BoxShape.circle for circles',
                  ),
                  Text('• boxShadow adds depth and visual hierarchy'),
                  Text('• Gradients make beautiful backgrounds'),
                  Text('• AnimatedContainer for smooth transitions'),
                  Text('• Use TickerProviderStateMixin for animations'),
                  Text('• SweepGradient & RadialGradient for cool effects'),
                  Text('• Matrix4 transform for 3D / rotation effects'),
                  Text('• Nested containers = gradient borders'),
                  Text('• CustomPaint for dashed borders'),
                  Text('• ClipPath for wave/diagonal shapes'),
                  Text('• ShaderMask for gradient text effects'),
                  Text('• AnimatedScale for press effects'),
                  Text('• Stack + Positioned for layered designs'),
                  Text('• FractionallySizedBox for responsive sizing'),
                  Text('\n🎉 50 Container examples explored!'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Stat card
  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(color: color.withOpacity(0.7), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: Social media icon
  Widget _buildSocialIcon(IconData icon, List<Color> colors) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }

  // Helper: Build a badge/chip widget
  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

// ============================================================================
// CUSTOM PAINTER: Dashed Border
// ============================================================================
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double radius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 2,
    this.dashWidth = 6,
    this.dashSpace = 4,
    this.radius = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    // Draw dashed path
    final dashPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final len = math.min(dashWidth, metric.length - distance);
        dashPath.addPath(
          metric.extractPath(distance, distance + len),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter old) =>
      color != old.color || strokeWidth != old.strokeWidth;
}

// ============================================================================
// CUSTOM CLIPPER: Diagonal Split
// ============================================================================
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.6, 0)
      ..lineTo(size.width * 0.4, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// ============================================================================
// CUSTOM CLIPPER: Wave Bottom
// ============================================================================
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 20,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 40,
      size.width,
      size.height - 10,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
