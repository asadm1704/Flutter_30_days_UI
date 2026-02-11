import 'package:flutter/material.dart';

// ============================================================================
// FLUTTER BUTTONS - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT ARE BUTTONS IN FLUTTER?
// ----------------------------
// Buttons are interactive widgets that users can tap to trigger actions.
// Flutter provides several button types for different use cases and styles.
// All buttons use the Material Design principles.
//
// TYPES OF BUTTONS IN FLUTTER:
// ----------------------------
// 1. ElevatedButton - Raised button with shadow (for primary actions)
// 2. TextButton - Flat button without elevation (for secondary actions)
// 3. OutlinedButton - Button with border outline (for secondary actions)
// 4. IconButton - Button with just an icon (for toolbar actions)
// 5. FloatingActionButton - Circular button (for primary screen action)
// 6. DropdownButton - Button that shows dropdown menu
//
// WHEN TO USE EACH TYPE:
// ----------------------
// • ElevatedButton: Primary actions (Submit, Save, Continue)
// • TextButton: Secondary actions (Cancel, Skip, Learn More)
// • OutlinedButton: Alternative to TextButton with more visibility
// • IconButton: Toolbar icons, like/share buttons
// • FloatingActionButton: Main action on a screen (Add, Compose)
//
// ============================================================================
// ELEVATEDBUTTON PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// REQUIRED PROPERTIES:
// --------------------
// 1. onPressed: VoidCallback?
//    - Function called when button is pressed
//    - If null, button is disabled (greyed out)
//    - Example: onPressed: () { print('Pressed!'); }
//
// 2. child: Widget?
//    - The content inside the button (usually Text or Row with Icon)
//    - Example: child: Text('Click Me')
//
// OPTIONAL PROPERTIES:
// --------------------
// 3. onLongPress: VoidCallback?
//    - Function called when button is long pressed
//
// 4. onHover: void Function(bool)?
//    - Called when pointer enters/exits button area
//
// 5. onFocusChange: void Function(bool)?
//    - Called when focus state changes
//
// 6. style: ButtonStyle?
//    - Customize button appearance (colors, size, shape, etc.)
//    - Use ElevatedButton.styleFrom() for easy styling
//
// 7. focusNode: FocusNode?
//    - Controls focus for keyboard navigation
//
// 8. autofocus: bool
//    - If true, button gets focus when screen loads (default: false)
//
// 9. clipBehavior: Clip
//    - How to clip content (default: Clip.none)
//
// 10. statesController: MaterialStatesController?
//     - Controls the button's interactive states
//
// ============================================================================
// BUTTONSTYLE PROPERTIES (Used with .styleFrom())
// ============================================================================
//
// ElevatedButton.styleFrom() properties:
//
// COLOR PROPERTIES:
// -----------------
// 1. backgroundColor: Color?
//    - Background color of the button
//    - Example: backgroundColor: Colors.blue
//
// 2. foregroundColor: Color?
//    - Color of text and icon inside button
//    - Example: foregroundColor: Colors.white
//
// 3. disabledBackgroundColor: Color?
//    - Background color when button is disabled
//
// 4. disabledForegroundColor: Color?
//    - Text/icon color when button is disabled
//
// 5. shadowColor: Color?
//    - Color of the button's shadow
//
// 6. surfaceTintColor: Color?
//    - Tint color applied to surface (Material 3)
//
// 7. overlayColor: Color?
//    - Color of press/hover/focus feedback overlay
//
// SIZE & SPACING PROPERTIES:
// --------------------------
// 8. elevation: double?
//    - Shadow depth (0 = no shadow, higher = more shadow)
//    - Example: elevation: 8
//
// 9. padding: EdgeInsetsGeometry?
//    - Internal padding around the child
//    - Example: padding: EdgeInsets.all(20)
//
// 10. minimumSize: Size?
//     - Minimum width and height of button
//     - Example: minimumSize: Size(200, 50)
//
// 11. maximumSize: Size?
//     - Maximum width and height of button
//
// 12. fixedSize: Size?
//     - Exact width and height of button
//
// 13. iconSize: double?
//     - Size of icons inside the button
//
// SHAPE & BORDER PROPERTIES:
// --------------------------
// 14. shape: OutlinedBorder?
//     - Shape of the button (rounded, circular, etc.)
//     - Example: shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(20))
//
// 15. side: BorderSide?
//     - Border around the button
//     - Example: side: BorderSide(color: Colors.blue, width: 2)
//
// TEXT PROPERTIES:
// ----------------
// 16. textStyle: TextStyle?
//     - Style for text inside button (fontSize, fontWeight, etc.)
//
// 17. alignment: AlignmentGeometry?
//     - Alignment of child within button
//
// ANIMATION PROPERTIES:
// ---------------------
// 18. animationDuration: Duration?
//     - Duration of state change animations
//
// 19. enableFeedback: bool?
//     - Whether to play sound/haptic feedback on tap
//
// 20. splashFactory: InteractiveInkFeatureFactory?
//     - Customizes the ripple/splash effect
//
// ============================================================================
// TEXTBUTTON PROPERTIES
// ============================================================================
//
// TextButton has the same properties as ElevatedButton but:
// - No elevation by default (flat appearance)
// - Use TextButton.styleFrom() for styling
// - Often used for Cancel, Skip, or secondary actions
//
// ============================================================================
// OUTLINEDBUTTON PROPERTIES
// ============================================================================
//
// OutlinedButton has the same properties but:
// - Has a border/outline instead of elevation
// - Transparent background by default
// - Use OutlinedButton.styleFrom() for styling
//
// ============================================================================
// ICONBUTTON PROPERTIES
// ============================================================================
//
// 1. icon: Widget (required) - The icon to display
// 2. onPressed: VoidCallback? - Action when pressed
// 3. iconSize: double - Size of the icon (default: 24)
// 4. color: Color? - Icon color
// 5. splashColor: Color? - Ripple color when pressed
// 6. highlightColor: Color? - Color when pressed
// 7. tooltip: String? - Text shown on long press/hover
// 8. padding: EdgeInsetsGeometry - Padding around icon
//
// ============================================================================

class Button_widget extends StatelessWidget {
  const Button_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Widget Examples'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // EXAMPLE 1: ElevatedButton (Primary Action Button)
            // ==============================================================
            const Text(
              '1. ElevatedButton',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Raised button with shadow - for primary actions:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Basic ElevatedButton
            ElevatedButton(
              // Action when button is pressed
              onPressed: () {
                print('ElevatedButton pressed!');
              },
              // The content inside the button
              child: const Text('Basic Elevated Button'),
            ),
            const SizedBox(height: 12),

            // Styled ElevatedButton
            ElevatedButton(
              // Custom styling using styleFrom
              style: ElevatedButton.styleFrom(
                // Background color
                backgroundColor: Colors.blue,
                // Text/icon color
                foregroundColor: Colors.white,
                // Shadow depth
                elevation: 10,
                // Internal padding
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                // Rounded corners
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // Minimum size
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                print('Styled button pressed!');
              },
              child: const Text(
                'Styled Elevated Button',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),

            // ElevatedButton with Icon
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Download Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 2: TextButton (Secondary Action Button)
            // ==============================================================
            const Text(
              '2. TextButton',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Flat button without shadow - for secondary actions:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Basic TextButton
            TextButton(
              onPressed: () {
                print('TextButton pressed!');
              },
              child: const Text('Basic Text Button'),
            ),
            const SizedBox(height: 12),

            // Styled TextButton
            TextButton(
              style: TextButton.styleFrom(
                // Text color
                foregroundColor: Colors.purple,
                // Background color (usually transparent)
                backgroundColor: Colors.purple.shade50,
                // Padding
                padding: const EdgeInsets.all(20),
                // Text style
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              child: const Text('Styled Text Button'),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 3: OutlinedButton (Border Button)
            // ==============================================================
            const Text(
              '3. OutlinedButton',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Button with border outline:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Basic OutlinedButton
            OutlinedButton(
              onPressed: () {
                print('OutlinedButton pressed!');
              },
              child: const Text('Basic Outlined Button'),
            ),
            const SizedBox(height: 12),

            // Styled OutlinedButton
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                // Text color
                foregroundColor: Colors.red,
                // Border color and width
                side: const BorderSide(color: Colors.red, width: 2),
                // Padding
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                // Shape
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text('Styled Outlined Button'),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 4: IconButton
            // ==============================================================
            const Text(
              '4. IconButton',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Button with just an icon - for toolbars:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Heart icon button
                IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                  iconSize: 40,
                  tooltip: 'Like', // Shown on hover/long press
                  onPressed: () {
                    print('Liked!');
                  },
                ),
                // Share icon button
                IconButton(
                  icon: const Icon(Icons.share),
                  color: Colors.blue,
                  iconSize: 40,
                  tooltip: 'Share',
                  onPressed: () {},
                ),
                // Bookmark icon button
                IconButton(
                  icon: const Icon(Icons.bookmark),
                  color: Colors.orange,
                  iconSize: 40,
                  tooltip: 'Bookmark',
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 5: Disabled Button
            // ==============================================================
            const Text(
              '5. Disabled Button',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Set onPressed to null to disable:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              // Setting onPressed to null disables the button
              onPressed: null,
              child: const Text('Disabled Button'),
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
                  Text('• ElevatedButton = Primary actions (Save, Submit)'),
                  Text('• TextButton = Secondary actions (Cancel, Skip)'),
                  Text('• OutlinedButton = Alternative secondary button'),
                  Text('• IconButton = Icon-only buttons for toolbars'),
                  Text('• Set onPressed: null to disable any button'),
                  Text('• Use .styleFrom() for easy styling'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
