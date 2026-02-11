import 'package:flutter/material.dart';

// ============================================================================
// STACK WIDGET - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS A STACK?
// -----------------
// A Stack is a widget that positions its children on TOP of each other.
// Think of it like stacking cards on a table - each card is placed on top
// of the previous one. The first child is at the bottom, last child on top!
//
// WHEN TO USE STACK:
// ------------------
// - Overlay widgets on top of each other (text over image)
// - Create complex UI with overlapping elements
// - Position badges, labels, or icons over other widgets
// - Build custom cards with floating elements
// - Create profile pictures with status indicators
//
// BASIC STRUCTURE:
// ----------------
// Stack(
//   children: [
//     Widget1(),  // Bottom layer (background)
//     Widget2(),  // Middle layer
//     Widget3(),  // Top layer (foreground)
//   ],
// )
//
// KEY CONCEPT - LAYERS:
// ----------------------
// children[0] = BOTTOM (painted first, behind everything)
// children[1] = MIDDLE
// children[2] = TOP (painted last, in front of everything)
//
// ============================================================================
// STACK WIDGET PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// 1. children: List<Widget>
//    - The widgets to display in the stack
//    - First child is at the bottom, last child is on top
//    - Example: children: [Background(), Foreground()]
//
// 2. alignment: AlignmentGeometry (default: AlignmentDirectional.topStart)
//    - How to align NON-POSITIONED children within the Stack
//    - Common values:
//      • Alignment.topLeft      - Top left corner
//      • Alignment.topCenter    - Top center
//      • Alignment.topRight     - Top right corner
//      • Alignment.centerLeft   - Center left
//      • Alignment.center       - Center of stack
//      • Alignment.centerRight  - Center right
//      • Alignment.bottomLeft   - Bottom left corner
//      • Alignment.bottomCenter - Bottom center
//      • Alignment.bottomRight  - Bottom right corner
//
// 3. fit: StackFit (default: StackFit.loose)
//    - How NON-POSITIONED children should be sized
//    - Values:
//      • StackFit.loose    - Children can be any size up to Stack's size
//      • StackFit.expand   - Children are forced to fill the Stack
//      • StackFit.passthrough - Constraints passed through unchanged
//
// 4. clipBehavior: Clip (default: Clip.hardEdge)
//    - How to clip children that overflow the Stack's bounds
//    - Values:
//      • Clip.none        - No clipping (children can overflow visibly)
//      • Clip.hardEdge    - Clip with hard edges (fast, default)
//      • Clip.antiAlias   - Clip with smooth edges (slower)
//      • Clip.antiAliasWithSaveLayer - Smoothest (slowest)
//
// 5. textDirection: TextDirection?
//    - Direction for resolving alignment (ltr or rtl)
//    - Usually inherited from context
//
// ============================================================================
// POSITIONED WIDGET PROPERTIES
// ============================================================================
//
// Positioned is used INSIDE a Stack to place children at exact positions.
//
// 1. top: double?
//    - Distance from the top edge of the Stack
//    - Example: top: 10 (10 pixels from top)
//
// 2. bottom: double?
//    - Distance from the bottom edge of the Stack
//    - Example: bottom: 10 (10 pixels from bottom)
//
// 3. left: double?
//    - Distance from the left edge of the Stack
//    - Example: left: 10 (10 pixels from left)
//
// 4. right: double?
//    - Distance from the right edge of the Stack
//    - Example: right: 10 (10 pixels from right)
//
// 5. width: double?
//    - Width of the positioned widget
//    - Can't use with both left AND right
//
// 6. height: double?
//    - Height of the positioned widget
//    - Can't use with both top AND bottom
//
// POSITIONED RULES:
// -----------------
// - If you set top AND bottom, the widget stretches vertically
// - If you set left AND right, the widget stretches horizontally
// - At least one horizontal (left/right) AND one vertical (top/bottom) 
//   constraint is recommended
//
// ============================================================================
// POSITIONED CONSTRUCTORS
// ============================================================================
//
// 1. Positioned(...) - Manual positioning
//    Positioned(
//      top: 10,
//      left: 10,
//      child: Widget(),
//    )
//
// 2. Positioned.fill() - Fill entire Stack
//    Positioned.fill(
//      child: Widget(),  // Takes full Stack size
//    )
//
// 3. Positioned.fromRect() - Position from a Rectangle
//    Positioned.fromRect(
//      rect: Rect.fromLTWH(10, 10, 100, 100),
//      child: Widget(),
//    )
//
// 4. Positioned.directional() - RTL-aware positioning
//    Positioned.directional(
//      textDirection: TextDirection.ltr,
//      start: 10,  // left in LTR, right in RTL
//      top: 10,
//      child: Widget(),
//    )
//
// ============================================================================
// INDEXEDSTACK WIDGET
// ============================================================================
//
// IndexedStack shows ONLY ONE child at a time based on index.
// Useful for tabs, page switching, or showing/hiding widgets.
//
// IndexedStack(
//   index: 0,  // Which child to show (0-based)
//   children: [
//     Page1(),  // Shown when index = 0
//     Page2(),  // Shown when index = 1
//     Page3(),  // Shown when index = 2
//   ],
// )
//
// ============================================================================
// COMMON STACK PATTERNS
// ============================================================================
//
// Pattern 1: Text over Image
// ---------------------------
// Stack(
//   children: [
//     Image.network('url'),
//     Positioned(
//       bottom: 10,
//       left: 10,
//       child: Text('Caption'),
//     ),
//   ],
// )
//
// Pattern 2: Badge on Icon
// -------------------------
// Stack(
//   children: [
//     Icon(Icons.shopping_cart, size: 40),
//     Positioned(
//       right: 0,
//       top: 0,
//       child: CircleAvatar(radius: 10, child: Text('3')),
//     ),
//   ],
// )
//
// Pattern 3: Profile with Status
// -------------------------------
// Stack(
//   children: [
//     CircleAvatar(radius: 40, backgroundImage: ...),
//     Positioned(
//       right: 0,
//       bottom: 0,
//       child: Container(
//         width: 20, height: 20,
//         decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//       ),
//     ),
//   ],
// )
//
// ============================================================================

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  // For IndexedStack example
  int _currentIndex = 0;

  // For alignment demo
  Alignment _selectedAlignment = Alignment.center;

  // Alignment options for dropdown
  final Map<String, Alignment> _alignmentOptions = {
    'topLeft': Alignment.topLeft,
    'topCenter': Alignment.topCenter,
    'topRight': Alignment.topRight,
    'centerLeft': Alignment.centerLeft,
    'center': Alignment.center,
    'centerRight': Alignment.centerRight,
    'bottomLeft': Alignment.bottomLeft,
    'bottomCenter': Alignment.bottomCenter,
    'bottomRight': Alignment.bottomRight,
  };

  String _selectedAlignmentKey = 'center';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Widget Examples'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================================================================
            // EXAMPLE 1: Basic Stack - Text Over Image
            // ================================================================
            _buildSectionTitle('1. Basic Stack - Text Over Image'),
            _buildDescription(
              'A Stack places widgets on top of each other. '
              'The first child is at the bottom (background).',
            ),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    blurRadius: 8,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                // STACK: Layers widgets on top of each other
                child: Stack(
                  children: [
                    // LAYER 1 (BOTTOM): Background image
                    Positioned.fill(
                      child: Image.network(
                        'https://picsum.photos/400/200',
                        fit: BoxFit.cover,
                        // Show loading indicator while image loads
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        // Show error widget if image fails to load
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),

                    // LAYER 2: Gradient overlay for better text visibility
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.red.withOpacity(0.4),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // LAYER 3 (TOP): Text positioned at bottom left
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Beautiful Landscape',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Stack makes it easy to overlay text on images',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // ================================================================
            // EXAMPLE 2: Positioned Widget Demo
            // ================================================================
            _buildSectionTitle('2. Positioned Widget Demo'),
            _buildDescription(
              'Positioned allows you to place widgets at exact positions. '
              'Use top, bottom, left, right to position.',
            ),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Stack(
                children: [
                  // Top-Left corner
                  Positioned(
                    top: 10,
                    left: 10,
                    child: _buildPositionedBox('top: 10\nleft: 10', Colors.red),
                  ),

                  // Top-Right corner
                  Positioned(
                    top: 10,
                    right: 10,
                    child: _buildPositionedBox(
                      'top: 10\nright: 10',
                      Colors.blue,
                    ),
                  ),

                  // Center - using alignment
                  Align(
                    alignment: Alignment.center,
                    child: _buildPositionedBox(
                      'Align\ncenter',
                      Colors.purple,
                    ),
                  ),

                  // Bottom-Left corner
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: _buildPositionedBox(
                      'bottom: 10\nleft: 10',
                      Colors.green,
                    ),
                  ),

                  // Bottom-Right corner
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: _buildPositionedBox(
                      'bottom: 10\nright: 10',
                      Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ================================================================
            // EXAMPLE 3: Badge on Icon (Common Pattern)
            // ================================================================
            _buildSectionTitle('3. Badge on Icon'),
            _buildDescription(
              'A common pattern is placing a badge on a shopping cart '
              'or notification icon to show count.',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Shopping cart with badge
                _buildIconWithBadge(
                  icon: Icons.shopping_cart,
                  badgeCount: 3,
                  iconColor: Colors.black,
                  badgeColor: Colors.red,
                ),

                // Notifications with badge
                _buildIconWithBadge(
                  icon: Icons.notifications,
                  badgeCount: 12,
                  iconColor: Colors.amber.shade700,
                  badgeColor: Colors.red,
                ),

                // Messages with badge
                _buildIconWithBadge(
                  icon: Icons.mail,
                  badgeCount: 5,
                  iconColor: Colors.green,
                  badgeColor: Colors.deepPurple,
                ),

                // Favorite with badge
                _buildIconWithBadge(
                  icon: Icons.favorite,
                  badgeCount: 99,
                  iconColor: Colors.pink,
                  badgeColor: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // ================================================================
            // EXAMPLE 4: Profile Picture with Online Status
            // ================================================================
            _buildSectionTitle('4. Profile with Status Indicator'),
            _buildDescription(
              'Stack is perfect for adding status dots to profile pictures.',
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileWithStatus(
                  imageUrl: 'https://i.pravatar.cc/100?img=1',
                  status: 'online',
                  name: 'Asad',
                ),
                _buildProfileWithStatus(
                  imageUrl: 'https://i.pravatar.cc/100?img=2',
                  status: 'away',
                  name: 'Zikria',
                ),
                _buildProfileWithStatus(
                  imageUrl: 'https://i.pravatar.cc/100?img=3',
                  status: 'busy',
                  name: 'Ahmad',
                ),
                _buildProfileWithStatus(
                  imageUrl: 'https://i.pravatar.cc/100?img=4',
                  status: 'offline',
                  name: 'Muskano',
                ),
              ],
            ),
            const SizedBox(height: 32),

            // ================================================================
            // EXAMPLE 5: Stack Alignment Property
            // ================================================================
            _buildSectionTitle('5. Stack Alignment Demo'),
            _buildDescription(
              'The alignment property controls where NON-POSITIONED '
              'children are placed. Try different alignments below!',
            ),

            // Dropdown to select alignment
            DropdownButton<String>(
              value: _selectedAlignmentKey,
              items: _alignmentOptions.keys.map((key) {
                return DropdownMenuItem(
                  value: key,
                  child: Text('Alignment.$key'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedAlignmentKey = value!;
                  _selectedAlignment = _alignmentOptions[value]!;
                });
              },
            ),
            const SizedBox(height: 8),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400),
              ),
              // Stack with dynamic alignment
              child: Stack(
                alignment: _selectedAlignment, // Changes based on dropdown
                children: [
                  // Background (large box)
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Background\n(150x150)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  // Foreground (smaller box) - follows alignment
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Top\n(80x80)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ================================================================
            // EXAMPLE 6: Positioned.fill - Full Coverage
            // ================================================================
            _buildSectionTitle('6. Positioned.fill()'),
            _buildDescription(
              'Positioned.fill() makes a widget fill the entire Stack. '
              'Great for backgrounds and overlays.',
            ),

            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    // Positioned.fill - fills entire stack
                    Positioned.fill(
                      child: Container(
                        color: Colors.teal,
                        child: const Center(
                          child: Text(
                            'Positioned.fill()\nFills the entire Stack',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),

                    // Another Positioned.fill with padding (inset)
                    Positioned.fill(
                      // left, top, right, bottom can be used with fill too
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // ================================================================
            // EXAMPLE 7: IndexedStack - Show One Child at a Time
            // ================================================================
            _buildSectionTitle('7. IndexedStack - One Child at a Time'),
            _buildDescription(
              'IndexedStack shows only ONE child based on the index. '
              'Other children are hidden but maintain their state.',
            ),

            // Buttons to switch between children
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentIndex == index
                          ? Colors.deepOrange
                          : Colors.lightGreenAccent,
                    ),
                    child: Text('Page ${index + 1}'),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),

            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              // IndexedStack shows only one child at a time
              child: IndexedStack(
                index: _currentIndex, // Which child to show
                children: [
                  // Child 0
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.looks_one, size: 50, color: Colors.red),
                          SizedBox(height: 8),
                          Text(
                            'Page 1 Content',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Child 1
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.looks_two, size: 50, color: Colors.green),
                          SizedBox(height: 8),
                          Text(
                            'Page 2 Content',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Child 2
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.looks_3, size: 50, color: Colors.blue),
                          SizedBox(height: 8),
                          Text(
                            'Page 3 Content',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ================================================================
            // EXAMPLE 8: Card with Floating Action
            // ================================================================
            _buildSectionTitle('8. Card with Floating Elements'),
            _buildDescription(
              'Stack is great for creating cards with elements that '
              'overflow the card boundaries.',
            ),

            Stack(
              clipBehavior: Clip.none, // Allow overflow
              children: [
                // Card body
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.6),
                        blurRadius: 15,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'Premium Membership',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Get access to all features with our premium plan.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '\$9.99/month',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),

                // Floating icon - positioned outside card bounds
                Positioned(
                  top: 0, // Above the card
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),

                // "Popular" badge
                Positioned(
                  top: 40,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'POPULAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // HELPER WIDGETS
  // ===========================================================================

  // Section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  // Description text
  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
      ),
    );
  }

  // Positioned demo box
  Widget _buildPositionedBox(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 10),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Icon with badge
  Widget _buildIconWithBadge({
    required IconData icon,
    required int badgeCount,
    required Color iconColor,
    required Color badgeColor,
  }) {
    return Stack(
      clipBehavior: Clip.none, // Allow badge to overflow
      children: [
        // Main icon
        Icon(icon, size: 40, color: iconColor),

        // Badge - positioned at top right
        Positioned(
          right: -8,
          top: -8,
          child: Container(
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Text(
              badgeCount > 99 ? '99+' : '$badgeCount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  // Profile with status indicator
  Widget _buildProfileWithStatus({
    required String imageUrl,
    required String status,
    required String name,
  }) {
    // Status color based on status type
    Color statusColor;
    switch (status) {
      case 'online':
        statusColor = Colors.green;
        break;
      case 'away':
        statusColor = Colors.orange;
        break;
      case 'busy':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Column(
      children: [
        Stack(
          children: [
            // Profile picture
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
              onBackgroundImageError: (exception, stackTrace) {},
              child: const Icon(Icons.person, size: 30),
            ),

            // Status indicator
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
