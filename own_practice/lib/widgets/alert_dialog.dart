import 'package:flutter/material.dart';

// ============================================================================
// ALERT DIALOG - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS AN ALERT DIALOG?
// ------------------------
// An AlertDialog is a popup window that appears on top of the current screen.
// It interrupts the user to inform them about a situation or to get their
// decision/confirmation before proceeding. Think of it like a "Are you sure?"
// message box!
//
// WHEN TO USE IT?
// ---------------
// - To confirm dangerous actions (delete, logout, exit)
// - To show important information or warnings
// - To ask user for simple input or choice
// - Examples: "Delete this item?", "Discard changes?", "Permission required"
//
// HOW TO SHOW AN ALERT DIALOG?
// ----------------------------
// Use the showDialog() function to display the AlertDialog:
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(...),
//   );
//
// ============================================================================
// ALERTDIALOG PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// CONTENT PROPERTIES:
// -------------------
// 1. title: Widget?
//    - The title displayed at the top of the dialog
//    - Usually a Text widget
//    - Example: Text('Confirm Delete')
//
// 2. titleTextStyle: TextStyle?
//    - Style for the title text
//
// 3. titlePadding: EdgeInsetsGeometry?
//    - Padding around the title (default: 24px horizontal, 24px top)
//
// 4. content: Widget?
//    - The main body/message of the dialog
//    - Can be Text, Column, Form, or any widget
//    - Example: Text('Are you sure you want to delete this item?')
//
// 5. contentTextStyle: TextStyle?
//    - Style for the content text
//
// 6. contentPadding: EdgeInsetsGeometry?
//    - Padding around the content (default: 20px horizontal, 24px vertical)
//
// 7. actions: List<Widget>?
//    - Buttons displayed at the bottom of the dialog
//    - Usually TextButton or ElevatedButton widgets
//    - Example: [TextButton(onPressed: ..., child: Text('Cancel'))]
//
// 8. actionsPadding: EdgeInsetsGeometry?
//    - Padding around the action buttons
//
// 9. actionsAlignment: MainAxisAlignment?
//    - How to align actions horizontally
//    - Values: start, end, center, spaceBetween, spaceAround, spaceEvenly
//
// 10. actionsOverflowDirection: VerticalDirection?
//     - Direction when actions overflow (up or down)
//
// 11. actionsOverflowButtonSpacing: double?
//     - Spacing between actions when they overflow vertically
//
// APPEARANCE PROPERTIES:
// ----------------------
// 12. backgroundColor: Color?
//     - Background color of the dialog
//     - Example: Colors.white, Colors.grey[100]
//
// 13. elevation: double?
//     - Shadow depth beneath the dialog (default: 24.0)
//
// 14. shadowColor: Color?
//     - Color of the dialog's shadow
//
// 15. surfaceTintColor: Color?
//     - Color used to tint the dialog surface (Material 3)
//
// 16. shape: ShapeBorder?
//     - The shape of the dialog
//     - Example: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//
// 17. alignment: AlignmentGeometry?
//     - Where to position the dialog on screen
//     - Default: center of screen
//
// 18. insetPadding: EdgeInsets?
//     - Padding around the entire dialog (default: 40px horizontal, 24px vertical)
//
// BEHAVIOR PROPERTIES:
// --------------------
// 19. clipBehavior: Clip
//     - How to clip content that overflows (default: Clip.none)
//
// 20. scrollable: bool
//     - If true, title and content are wrapped in SingleChildScrollView
//     - Default: false
//
// 21. semanticLabel: String?
//     - Accessibility label for screen readers
//
// 22. icon: Widget?
//     - An optional icon displayed above the title
//
// 23. iconPadding: EdgeInsetsGeometry?
//     - Padding around the icon
//
// 24. iconColor: Color?
//     - Color of the icon
//
// ============================================================================
// SHOWDIALOG() FUNCTION PROPERTIES
// ============================================================================
//
// 1. context (required): BuildContext
//    - The build context from where dialog is shown
//
// 2. builder (required): Widget Function(BuildContext)
//    - Function that returns the dialog widget
//
// 3. barrierDismissible: bool
//    - If true, tapping outside dialog closes it (default: true)
//    - Set to false for important confirmations
//
// 4. barrierColor: Color?
//    - Color of the overlay behind the dialog (default: semi-transparent black)
//
// 5. barrierLabel: String?
//    - Accessibility label for the barrier
//
// 6. useSafeArea: bool
//    - If true, dialog avoids system UI areas (default: true)
//
// 7. useRootNavigator: bool
//    - If true, uses the root navigator (default: true)
//
// 8. routeSettings: RouteSettings?
//    - Settings for the dialog route
//
// 9. anchorPoint: Offset?
//    - The anchor point for positioning the dialog
//
// ============================================================================

class AlertWidget extends StatefulWidget {
  const AlertWidget({Key? key}) : super(key: key);

  @override
  _AlertWidgetState createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog Example'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ================================================================
            // EXAMPLE 1: Basic Alert Dialog
            // ================================================================
            ElevatedButton(
              child: const Text('Show Basic Alert'),
              onPressed: () {
                _showBasicDialog(context);
              },
            ),
            const SizedBox(height: 20),

            // ================================================================
            // EXAMPLE 2: Confirmation Dialog
            // ================================================================
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Show Confirmation Alert'),
              onPressed: () {
                _showConfirmationDialog(context);
              },
            ),
            const SizedBox(height: 20),

            // ================================================================
            // EXAMPLE 3: Custom Styled Dialog
            // ================================================================
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text('Show Custom Dialog'),
              onPressed: () {
                _showCustomDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// EXAMPLE 1: Basic Alert Dialog
// ============================================================================
// A simple dialog with title, content, and action buttons
Future<void> _showBasicDialog(BuildContext context) async {
  return showDialog<void>(
    // The BuildContext from which to show the dialog
    context: context,

    // If true, tapping outside the dialog dismisses it
    // Set to false for important confirmations
    barrierDismissible: true,

    // The builder function that creates the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        // ---- TITLE ----
        // The header text of the dialog
        title: const Text('Information'),

        // ---- CONTENT ----
        // The main message body
        content: const Text(
          'This is a basic alert dialog. It displays important information to the user.',
        ),

        // ---- ACTIONS ----
        // Buttons at the bottom of the dialog
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// ============================================================================
// EXAMPLE 2: Confirmation Dialog
// ============================================================================
// A dialog asking user to confirm or cancel an action
Future<void> _showConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,

    // User MUST tap a button to dismiss (can't tap outside)
    barrierDismissible: false,

    builder: (BuildContext context) {
      return AlertDialog(
        // ---- ICON ----
        // Optional icon displayed above the title
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.orange,
          size: 48,
        ),

        // ---- TITLE ----
        title: const Text('Confirm Delete'),

        // ---- CONTENT ----
        content: const SingleChildScrollView(
          child: Text(
            'Are you sure you want to delete this item? This action cannot be undone.',
          ),
        ),

        // ---- ACTIONS ----
        actions: <Widget>[
          // Cancel button
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // Confirm button with red color for dangerous action
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
            onPressed: () {
              // Perform delete action here
              Navigator.of(context).pop();
              // Show feedback
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item deleted!')),
              );
            },
          ),
        ],
      );
    },
  );
}

// ============================================================================
// EXAMPLE 3: Custom Styled Dialog
// ============================================================================
// A beautifully styled dialog with custom appearance
Future<void> _showCustomDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,

    // Custom barrier color (the overlay behind the dialog)
    barrierColor: Colors.black54,

    builder: (BuildContext context) {
      return AlertDialog(
        // ---- BACKGROUND COLOR ----
        backgroundColor: Colors.white,

        // ---- ELEVATION (Shadow) ----
        elevation: 20,

        // ---- SHAPE ----
        // Rounded corners for modern look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        // ---- TITLE with custom styling ----
        title: const Text('💍 Special Message'),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),

        // ---- CONTENT with multiple widgets ----
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Hello there!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text(
                'This is a custom styled dialog with rounded corners, custom colors, and beautiful design.',
              ),
            ],
          ),
        ),

        // ---- ACTIONS ALIGNMENT ----
        actionsAlignment: MainAxisAlignment.spaceEvenly,

        // ---- ACTIONS ----
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Maybe Later'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Accept'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
