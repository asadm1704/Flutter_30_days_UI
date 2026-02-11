import 'package:flutter/material.dart';

// ============================================================================
// DISMISSIBLE WIDGET - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS DISMISSIBLE?
// --------------------
// Dismissible is a widget that can be swiped/dismissed in a direction.
// When the user swipes, the widget animates out and can trigger an action.
// Think of it like swiping emails in your inbox to delete or archive them!
//
// WHEN TO USE DISMISSIBLE:
// ------------------------
// - Swipe to delete items (todo lists, messages, emails)
// - Swipe to reveal actions (archive, mark as read)
// - Any "swipe away" gesture interaction
//
// HOW IT WORKS:
// -------------
// 1. Wrap your item (Card, ListTile, etc.) with Dismissible
// 2. Provide a UNIQUE key for each item (required!)
// 3. Define onDismissed callback to handle what happens after swipe
// 4. Optionally add background widgets behind the swipe
//
// ============================================================================
// DISMISSIBLE PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// REQUIRED PROPERTIES:
// --------------------
// 1. key: Key (required)
//    - UNIQUE identifier for each dismissible item
//    - MUST be unique - use ValueKey or UniqueKey
//    - Example: key: Key(item.id.toString())
//
// 2. child: Widget (required)
//    - The widget that can be swiped away
//    - Example: child: ListTile(title: Text('Item'))
//
// CALLBACK PROPERTIES:
// --------------------
// 3. onDismissed: void Function(DismissDirection)?
//    - Called AFTER the item is fully swiped away
//    - Use this to actually delete/remove the item from data
//    - Receives the direction of the swipe
//
// 4. onUpdate: void Function(DismissUpdateDetails)?
//    - Called repeatedly during the swipe gesture
//    - Provides progress, direction, and other details
//
// 5. confirmDismiss: Future<bool?> Function(DismissDirection)?
//    - Called to confirm if dismiss should happen
//    - Return true to allow dismiss, false to cancel
//    - Perfect for showing confirmation dialogs!
//
// 6. onResize: VoidCallback?
//    - Called when the item starts resizing after dismiss
//
// DIRECTION PROPERTIES:
// ---------------------
// 7. direction: DismissDirection
//    - Which directions the item can be swiped
//    - Values:
//      - DismissDirection.horizontal: Left OR right
//      - DismissDirection.startToEnd: Only left to right →
//      - DismissDirection.endToStart: Only right to left ←
//      - DismissDirection.vertical: Up OR down
//      - DismissDirection.up: Only up ↑
//      - DismissDirection.down: Only down ↓
//      - DismissDirection.none: Disable dismiss
//    - Default: DismissDirection.horizontal
//
// BACKGROUND PROPERTIES:
// ----------------------
// 8. background: Widget?
//    - Widget shown BEHIND the item when swiping startToEnd (→)
//    - Usually a colored container with icon
//
// 9. secondaryBackground: Widget?
//    - Widget shown BEHIND the item when swiping endToStart (←)
//    - If not set, background is used for both directions
//
// THRESHOLD PROPERTIES:
// ---------------------
// 10. dismissThresholds: Map<DismissDirection, double>?
//     - How far user must swipe to trigger dismiss (0.0 to 1.0)
//     - Default: 0.4 (40% of width)
//     - Example: {DismissDirection.startToEnd: 0.6}
//
// 11. movementDuration: Duration
//     - Duration of the slide animation
//     - Default: Duration(milliseconds: 200)
//
// 12. resizeDuration: Duration?
//     - Duration of the resize animation after dismiss
//     - Default: Duration(milliseconds: 300)
//
// VISUAL PROPERTIES:
// ------------------
// 13. crossAxisEndOffset: double
//     - How much the item moves perpendicular to swipe
//     - Default: 0.0
//
// 14. dragStartBehavior: DragStartBehavior
//     - When drag gesture starts
//     - Values: .start, .down
//
// 15. behavior: HitTestBehavior
//     - How hit testing behaves
//     - Default: HitTestBehavior.opaque
//
// ============================================================================
// DISMISS DIRECTION VALUES
// ============================================================================
//
// DismissDirection.horizontal   → ← (swipe left or right)
// DismissDirection.vertical     ↑ ↓ (swipe up or down)
// DismissDirection.endToStart   ← (swipe right to left only)
// DismissDirection.startToEnd   → (swipe left to right only)
// DismissDirection.up           ↑ (swipe up only)
// DismissDirection.down         ↓ (swipe down only)
// DismissDirection.none         (disable swiping)
//
// ============================================================================
// COMMON PATTERNS
// ============================================================================
//
// Pattern 1: Delete on swipe
// --------------------------
// Dismissible(
//   key: Key(item.id),
//   onDismissed: (direction) {
//     setState(() => items.remove(item));
//   },
//   child: ListTile(title: Text(item.name)),
// )
//
// Pattern 2: Confirm before delete
// --------------------------------
// Dismissible(
//   key: Key(item.id),
//   confirmDismiss: (direction) async {
//     return await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Delete?'),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context, false), child: Text('No')),
//           TextButton(onPressed: () => Navigator.pop(context, true), child: Text('Yes')),
//         ],
//       ),
//     );
//   },
//   onDismissed: (direction) => items.remove(item),
//   child: ListTile(title: Text(item.name)),
// )
//
// ============================================================================

class Dismissable1 extends StatefulWidget {
  const Dismissable1({super.key});

  @override
  State<Dismissable1> createState() => _Dismissable1State();
}

class _Dismissable1State extends State<Dismissable1> {
  // List of fruits that can be swiped away
  List<String> fruits = [
    "Apple",
    "Banana",
    "Orange",
    "Grapes",
    "Pineapple",
    "Mango",
    "Watermelon",
    "Strawberry",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible Widget Example"),
        backgroundColor: Colors.deepOrange,
        actions: [
          // Reset button
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                fruits = [
                  "Apple",
                  "Banana",
                  "Orange",
                  "Grapes",
                  "Pineapple",
                  "Mango",
                  "Watermelon",
                  "Strawberry",
                ];
              });
            },
            tooltip: 'Reset list',
          ),
        ],
      ),

      body: Column(
        children: [
          // Instructions
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.orange.shade50,
            child: const Column(
              children: [
                Text(
                  'Swipe items left or right to dismiss them!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '→ Swipe right = Archive (green)\n← Swipe left = Delete (red)',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          // List of dismissible items
          Expanded(
            child: fruits.isEmpty
                ? const Center(
                    child: Text(
                      'All items dismissed!\nTap refresh to reset.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: fruits.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      final fruit = fruits[index];

                      return Dismissible(
                        // REQUIRED: Unique key for each item
                        // This helps Flutter track which item is being dismissed
                        key: Key(fruit),

                        // DIRECTION: Which ways can we swipe?
                        // horizontal = both left and right
                        direction: DismissDirection.horizontal,

                        // BACKGROUND: Shown when swiping LEFT to RIGHT (→)
                        // This is the "archive" action
                        background: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Row(
                            children: [
                              Icon(Icons.archive, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Archive',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // SECONDARY BACKGROUND: Shown when swiping RIGHT to LEFT (←)
                        // This is the "delete" action
                        secondaryBackground: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.delete, color: Colors.white),
                            ],
                          ),
                        ),

                        // CONFIRM DISMISS: Ask for confirmation before dismissing
                        // Return true to allow dismiss, false to cancel
                        confirmDismiss: (direction) async {
                          // For delete (left swipe), ask for confirmation
                          if (direction == DismissDirection.endToStart) {
                            return await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Item?'),
                                content: Text(
                                  'Are you sure you want to delete "$fruit"?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ),
                                    onPressed: () => Navigator.pop(context, true),
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          }
                          // For archive (right swipe), just allow it
                          return true;
                        },

                        // ON DISMISSED: Called after item is fully dismissed
                        // This is where you actually remove the item from your data
                        onDismissed: (direction) {
                          // Remove from list
                          setState(() {
                            fruits.removeAt(index);
                          });

                          // Show feedback based on swipe direction
                          if (direction == DismissDirection.startToEnd) {
                            // Swiped RIGHT → Archive
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$fruit archived'),
                                backgroundColor: Colors.green,
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      fruits.insert(index, fruit);
                                    });
                                  },
                                ),
                              ),
                            );
                          } else if (direction == DismissDirection.endToStart) {
                            // Swiped LEFT → Delete
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$fruit deleted'),
                                backgroundColor: Colors.red,
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      fruits.insert(index, fruit);
                                    });
                                  },
                                ),
                              ),
                            );
                          }
                        },

                        // CHILD: The actual widget that gets swiped
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: Text(
                                fruit[0],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              fruit,
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: const Text('Swipe to dismiss'),
                            trailing: const Icon(Icons.swipe),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Summary box
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📝 Quick Tips:',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                SizedBox(height: 4),
                Text('• Each Dismissible needs a UNIQUE key'),
                Text('• Use confirmDismiss for confirmation dialogs'),
                Text('• background = swipe right, secondaryBackground = swipe left'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

