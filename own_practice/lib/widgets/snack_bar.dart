import 'package:flutter/material.dart';

// ============================================================================
// SNACKBAR - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS A SNACKBAR?
// -------------------
// A SnackBar is a lightweight message that briefly appears at the bottom of
// the screen. It provides feedback about an operation or action without
// interrupting the user. Think of it as a "toast" notification!
//
// WHEN TO USE SNACKBAR:
// ---------------------
// - To confirm an action was completed ("Message sent", "Item deleted")
// - To show brief error messages ("Network error")
// - To offer an undo option ("Deleted item. UNDO")
// - For non-critical information that auto-dismisses
//
// WHEN NOT TO USE (Use Dialog instead):
// -------------------------------------
// - When you need user confirmation before proceeding
// - For critical errors that need acknowledgment
// - When you need more than one action button
//
// HOW TO SHOW A SNACKBAR:
// -----------------------
// Use ScaffoldMessenger to show SnackBars:
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Hello!')),
//   );
//
// ============================================================================
// SNACKBAR PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// CONTENT PROPERTIES:
// -------------------
// 1. content: Widget (required)
//    - The main message/content of the snackbar
//    - Usually a Text widget
//    - Example: content: Text('Item deleted')
//
// 2. action: SnackBarAction?
//    - An optional action button (e.g., "UNDO", "RETRY")
//    - See SnackBarAction properties below
//
// TIMING PROPERTIES:
// ------------------
// 3. duration: Duration
//    - How long the snackbar is displayed
//    - Default: Duration(seconds: 4)
//    - Use Duration.infinite for persistent snackbars
//
// 4. animation: Animation<double>?
//    - Custom animation for showing/hiding
//
// 5. onVisible: VoidCallback?
//    - Callback when snackbar becomes visible
//
// APPEARANCE PROPERTIES:
// ----------------------
// 6. backgroundColor: Color?
//    - Background color of the snackbar
//    - Example: backgroundColor: Colors.green
//
// 7. elevation: double?
//    - Shadow depth beneath the snackbar
//
// 8. shape: ShapeBorder?
//    - Shape of the snackbar
//    - Example: shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10))
//
// 9. behavior: SnackBarBehavior?
//    - How the snackbar is displayed
//    - Values:
//      - SnackBarBehavior.fixed: Attached to bottom (default)
//      - SnackBarBehavior.floating: Floating with margins
//
// 10. width: double?
//     - Width of snackbar (only works with floating behavior)
//
// 11. margin: EdgeInsetsGeometry?
//     - Margin around snackbar (only for floating behavior)
//
// 12. padding: EdgeInsetsGeometry?
//     - Padding inside the snackbar
//
// 13. showCloseIcon: bool?
//     - Whether to show a close (X) icon (default: false)
//
// 14. closeIconColor: Color?
//     - Color of the close icon
//
// DISMISS PROPERTIES:
// -------------------
// 15. dismissDirection: DismissDirection
//     - Direction to swipe to dismiss
//     - Values: down, up, startToEnd, endToStart, horizontal, vertical
//     - Default: DismissDirection.down
//
// 16. clipBehavior: Clip
//     - How to clip content (default: Clip.hardEdge)
//
// ============================================================================
// SNACKBARACTION PROPERTIES
// ============================================================================
//
// 1. label: String (required)
//    - Text of the action button (e.g., "UNDO", "RETRY")
//
// 2. onPressed: VoidCallback (required)
//    - Function called when action is tapped
//
// 3. textColor: Color?
//    - Color of the action text
//
// 4. disabledTextColor: Color?
//    - Color when action is disabled
//
// 5. backgroundColor: Color?
//    - Background color of the action button
//
// ============================================================================
// SCAFFOLDMESSENGER METHODS
// ============================================================================
//
// 1. showSnackBar(SnackBar snackBar)
//    - Shows a snackbar
//    - Returns ScaffoldFeatureController to control the snackbar
//
// 2. hideCurrentSnackBar()
//    - Hides the current snackbar with animation
//
// 3. removeCurrentSnackBar()
//    - Removes current snackbar immediately (no animation)
//
// 4. clearSnackBars()
//    - Removes all snackbars from the queue
//
// ============================================================================

class snack_bar extends StatelessWidget {
  const snack_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar Examples'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // EXAMPLE 1: Basic SnackBar
            // ==============================================================
            const Text(
              '1. Basic SnackBar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Simple snackbar with just a message:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                // Create a basic SnackBar
                const snackBar = SnackBar(
                  // The message content
                  content: Text('This is a basic SnackBar!'),
                );

                // Show the SnackBar using ScaffoldMessenger
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Show Basic SnackBar'),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 2: SnackBar with Action Button
            // ==============================================================
            const Text(
              '2. SnackBar with Action',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Snackbar with an UNDO action button:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Item deleted'),

                  // Duration before auto-dismiss
                  duration: const Duration(seconds: 5),

                  // Action button
                  action: SnackBarAction(
                    label: 'UNDO', // Button text
                    textColor: Colors.yellow, // Button text color
                    onPressed: () {
                      // Code to undo the action
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Undo successful!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Delete Item'),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 3: Floating SnackBar with Custom Style
            // ==============================================================
            const Text(
              '3. Floating Styled SnackBar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Floating snackbar with rounded corners and custom colors:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text(
                    '✨ This is a beautiful snackbar!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  // Background color
                  backgroundColor: Colors.purple,

                  // Floating behavior (not attached to bottom)
                  behavior: SnackBarBehavior.floating,

                  // Custom shape with rounded corners
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  // Margin around the floating snackbar
                  margin: const EdgeInsets.all(16),

                  // Padding inside
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),

                  // Shadow depth
                  elevation: 10,

                  // Duration
                  duration: const Duration(seconds: 3),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Show Styled SnackBar'),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 4: SnackBar with Close Icon
            // ==============================================================
            const Text(
              '4. SnackBar with Close Icon',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Snackbar with a dismiss (X) button:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('You can dismiss me with the X button!'),
                  backgroundColor: Colors.orange,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  // Show close icon
                  showCloseIcon: true,

                  // Close icon color
                  closeIconColor: Colors.white,

                  // Longer duration since user can dismiss manually
                  duration: const Duration(seconds: 10),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Show SnackBar with Close'),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 5: Success/Error/Warning SnackBars
            // ==============================================================
            const Text(
              '5. Status SnackBars (Success/Error/Warning)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Different colors for different message types:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Success
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.white),
                            SizedBox(width: 12),
                            Text('Success! Operation completed.'),
                          ],
                        ),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: const Text('Success'),
                ),

                // Error
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.error, color: Colors.white),
                            SizedBox(width: 12),
                            Text('Error! Something went wrong.'),
                          ],
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: const Text('Error'),
                ),

                // Warning
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Row(
                          children: [
                            Icon(Icons.warning, color: Colors.black),
                            SizedBox(width: 12),
                            Text(
                              'Warning! Check your input.',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.amber,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: const Text('Warning'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 6: Clear SnackBars
            // ==============================================================
            const Text(
              '6. Clear All SnackBars',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Remove all pending snackbars:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                // Clear all snackbars
                ScaffoldMessenger.of(context).clearSnackBars();
              },
              child: const Text('Clear All SnackBars'),
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
                  Text('• Use ScaffoldMessenger.of(context).showSnackBar()'),
                  Text('• behavior: floating for modern look'),
                  Text('• Add action for undo/retry functionality'),
                  Text('• Use different colors for success/error/warning'),
                  Text('• showCloseIcon: true for manual dismiss'),
                  Text('• clearSnackBars() removes all pending snackbars'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
