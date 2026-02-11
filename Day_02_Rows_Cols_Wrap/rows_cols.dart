import 'package:flutter/material.dart';

// ============================================================================
// ROW, COLUMN & WRAP - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT ARE ROW AND COLUMN?
// ------------------------
// Row and Column are the fundamental layout widgets in Flutter.
// - Row: Arranges children HORIZONTALLY (left to right) →
// - Column: Arranges children VERTICALLY (top to bottom) ↓
//
// They are "Flex" widgets, meaning they flex/expand to fill available space.
//
// WHEN TO USE:
// ------------
// - Row: For horizontal layouts (icons in a toolbar, buttons side by side)
// - Column: For vertical layouts (form fields, list of items)
// - Wrap: When items might overflow and need to wrap to next line
//
// KEY CONCEPT - MAIN AXIS vs CROSS AXIS:
// --------------------------------------
// Main Axis: The primary direction of layout
// Cross Axis: The perpendicular direction
//
// For Row:
//   - Main Axis = Horizontal (left ↔ right)
//   - Cross Axis = Vertical (top ↕ bottom)
//
// For Column:
//   - Main Axis = Vertical (top ↕ bottom)
//   - Cross Axis = Horizontal (left ↔ right)
//
// ============================================================================
// ROW & COLUMN PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// ALIGNMENT PROPERTIES:
// ---------------------
// 1. mainAxisAlignment: MainAxisAlignment
//    - How children are aligned along the MAIN axis
//    - Values:
//      - .start: Children at the start (default)
//      - .end: Children at the end
//      - .center: Children in the center
//      - .spaceBetween: Even space between children
//      - .spaceAround: Even space around children (half at edges)
//      - .spaceEvenly: Equal space between and around children
//
// 2. crossAxisAlignment: CrossAxisAlignment
//    - How children are aligned along the CROSS axis
//    - Values:
//      - .start: Align to start of cross axis
//      - .end: Align to end of cross axis
//      - .center: Center on cross axis (default)
//      - .stretch: Stretch to fill cross axis
//      - .baseline: Align text baselines (Row only)
//
// 3. textBaseline: TextBaseline
//    - Required if crossAxisAlignment is .baseline
//    - Values: .alphabetic, .ideographic
//
// SIZE PROPERTIES:
// ----------------
// 4. mainAxisSize: MainAxisSize
//    - How much space the Row/Column takes on main axis
//    - Values:
//      - .max: Take as much space as possible (default)
//      - .min: Take only as much space as children need
//
// DIRECTION PROPERTIES:
// ---------------------
// 5. textDirection: TextDirection
//    - Direction for Row layout (left-to-right or right-to-left)
//    - Values: .ltr, .rtl
//
// 6. verticalDirection: VerticalDirection
//    - Direction for Column layout
//    - Values: .down (default), .up
//
// CHILDREN PROPERTY:
// ------------------
// 7. children: List<Widget>
//    - The list of widgets to display
//    - Example: children: [Text('A'), Text('B'), Text('C')]
//
// ============================================================================
// EXPANDED & FLEXIBLE WIDGETS
// ============================================================================
//
// Expanded: Makes a child take all available space
// - flex: int - How much space relative to other Expanded widgets
//
// Flexible: Like Expanded, but child can be smaller than available space
// - flex: int - Flex factor
// - fit: FlexFit.tight (like Expanded) or FlexFit.loose (can be smaller)
//
// Example:
//   Row(children: [
//     Expanded(flex: 2, child: Container(color: Colors.red)),
//     Expanded(flex: 1, child: Container(color: Colors.blue)),
//   ])
//   // Red takes 2/3, Blue takes 1/3
//
// ============================================================================
// WRAP WIDGET PROPERTIES
// ============================================================================
//
// Wrap is like Row/Column, but wraps to next line when it runs out of space.
//
// 1. direction: Axis
//    - Primary axis direction
//    - Values: Axis.horizontal (default), Axis.vertical
//
// 2. alignment: WrapAlignment
//    - How to align children on main axis
//    - Same values as MainAxisAlignment
//
// 3. spacing: double
//    - Space between children on main axis
//
// 4. runAlignment: WrapAlignment
//    - How to align runs (lines) on cross axis
//
// 5. runSpacing: double
//    - Space between runs (lines)
//
// 6. crossAxisAlignment: WrapCrossAlignment
//    - How to align children within a run
//    - Values: .start, .end, .center
//
// ============================================================================
// SPACER WIDGET
// ============================================================================
//
// Spacer: An empty expanded widget that takes up space
// - Useful for pushing items apart
// - flex: int - How much space relative to other Spacers/Expanded
//
// Example:
//   Row(children: [
//     Text('Left'),
//     Spacer(),  // Pushes Right to the end
//     Text('Right'),
//   ])
//
// ============================================================================

class Rows_Cols extends StatelessWidget {
  const Rows_Cols({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rows, Columns & Layout'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // EXAMPLE 1: Basic Row
            // ==============================================================
            const Text(
              '1. Basic Row (Horizontal Layout)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Children arranged horizontally:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: Row(
                // Align children on main (horizontal) axis
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const SizedBox(width: 10), // Spacing between items
                  Container(width: 50, height: 50, color: Colors.green),
                  const SizedBox(width: 10),
                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 2: MainAxisAlignment Options
            // ==============================================================
            const Text(
              '2. MainAxisAlignment Options',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Different ways to align children on main axis:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // .start
            _buildAlignmentExample('start', MainAxisAlignment.start),
            const SizedBox(height: 8),

            // .center
            _buildAlignmentExample('center', MainAxisAlignment.center),
            const SizedBox(height: 8),

            // .end
            _buildAlignmentExample('end', MainAxisAlignment.end),
            const SizedBox(height: 8),

            // .spaceBetween
            _buildAlignmentExample(
              'spaceBetween',
              MainAxisAlignment.spaceBetween,
            ),
            const SizedBox(height: 8),

            // .spaceAround
            _buildAlignmentExample(
              'spaceAround',
              MainAxisAlignment.spaceAround,
            ),
            const SizedBox(height: 8),

            // .spaceEvenly
            _buildAlignmentExample(
              'spaceEvenly',
              MainAxisAlignment.spaceEvenly,
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 3: Basic Column
            // ==============================================================
            const Text(
              '3. Basic Column (Vertical Layout)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Children arranged vertically:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              height: 200,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(8),
              child: Column(
                // Spread children evenly
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // Center on horizontal axis
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 100, height: 40, color: Colors.red),
                  Container(width: 100, height: 40, color: Colors.green),
                  Container(width: 100, height: 40, color: Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 4: CrossAxisAlignment
            // ==============================================================
            const Text(
              '4. CrossAxisAlignment Options',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Align items on the cross (perpendicular) axis:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // .start
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.yellow.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 40, height: 20, color: Colors.red),
                          Container(width: 60, height: 20, color: Colors.green),
                          Container(width: 30, height: 20, color: Colors.blue),
                        ],
                      ),
                    ),
                    const Text('start', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // .center
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.yellow.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(width: 40, height: 20, color: Colors.red),
                          Container(width: 60, height: 20, color: Colors.green),
                          Container(width: 30, height: 20, color: Colors.blue),
                        ],
                      ),
                    ),
                    const Text('center', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // .end
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.yellow.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(width: 40, height: 20, color: Colors.red),
                          Container(width: 60, height: 20, color: Colors.green),
                          Container(width: 30, height: 20, color: Colors.blue),
                        ],
                      ),
                    ),
                    const Text('end', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 5: Expanded Widget
            // ==============================================================
            const Text(
              '5. Expanded Widget',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Expanded makes children fill available space:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              height: 50,
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  // Takes 2 parts of available space
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          'flex: 2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // Takes 1 part of available space
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          'flex: 1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // Takes 1 part of available space
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'flex: 1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.purple,
                      child: const Center(
                        child: Text(
                          'flex: 1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 6: Spacer Widget
            // ==============================================================
            const Text(
              '6. Spacer Widget',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Spacer pushes items apart:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.pink.shade200,
                border: Border.all(color: Colors.purple.shade200),
                borderRadius: BorderRadius.circular(15),
              ),

              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Icon(Icons.menu, color: Colors.black),
                  const Spacer(), // Pushes everything else to the right
                  const Icon(Icons.search, color: Colors.black),
                  const SizedBox(width: 16),
                  const Icon(Icons.more_vert, color: Colors.black),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 7: Wrap Widget
            // ==============================================================
            const Text(
              '7. Wrap Widget',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Wrap creates a new line when space runs out:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green.shade200),
                borderRadius: BorderRadius.circular(15),
              ),

              padding: const EdgeInsets.all(20),
              child: Wrap(
                // Space between items horizontally
                spacing: 10,
                // Space between rows
                runSpacing: 10,
                // How to align items
                alignment: WrapAlignment.start,
                children: [
                  _buildChip('Muskano'),
                  _buildChip('Will'),
                  _buildChip('you '),
                  _buildChip('Make'),
                  _buildChip('Babies'),
                  _buildChip('With'),
                  _buildChip('ME'),
                  _buildChip(' ?'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 8: Social Media Post Header (Row)
            // Real-life: Facebook/Instagram post header
            // ==============================================================
            _buildSectionTitle('8. Social Media Post Header (Row)'),
            const Text('Avatar + Name + Time — like Instagram/Facebook',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 4, offset: const Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.purple,
                    child: Text('AW', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Asad Wazir', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('2 hours ago', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 9: Product Card (Row + Column)
            // Real-life: E-commerce product listing
            // ==============================================================
            _buildSectionTitle('9. E-Commerce Product Card (Row + Column)'),
            const Text('Image left, details right — like Amazon/Daraz',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.shopping_bag, size: 40, color: Colors.orange),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Wireless Bluetooth Headphones',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star_half, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text('(4.5)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Text('Rs. 2,499',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
                            SizedBox(width: 8),
                            Text('Rs. 4,999',
                                style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 10: Settings List Item (Row)
            // Real-life: Phone settings screen
            // ==============================================================
            _buildSectionTitle('10. Settings Screen Items (Row)'),
            const Text('Icon + Label + Toggle — like phone Settings app',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  _buildSettingsItem(Icons.wifi, 'Wi-Fi', 'Connected', true),
                  const Divider(height: 1),
                  _buildSettingsItem(Icons.bluetooth, 'Bluetooth', 'Off', false),
                  const Divider(height: 1),
                  _buildSettingsItem(Icons.dark_mode, 'Dark Mode', 'System', true),
                  const Divider(height: 1),
                  _buildSettingsItem(Icons.notifications, 'Notifications', 'On', true),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 11: Chat Message Bubble (Column)
            // Real-life: WhatsApp / Messenger chat
            // ==============================================================
            _buildSectionTitle('11. Chat Message Bubbles (Column + Row)'),
            const Text('Sender & receiver messages — like WhatsApp',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 240),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Hey! How are you doing?'),
                            SizedBox(height: 4),
                            Text('10:30 AM', style: TextStyle(fontSize: 10, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 240),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text("I'm great! Working on Flutter 💙",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 4),
                            Text('10:32 AM', style: TextStyle(fontSize: 10, color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 12: Profile Header (Column centered)
            // Real-life: Instagram/LinkedIn profile header
            // ==============================================================
            _buildSectionTitle('12. Profile Header (Column)'),
            const Text('Centered avatar, name, bio — like Instagram profile',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue.shade400, Colors.purple.shade400]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 45, color: Colors.blue),
                  ),
                  const SizedBox(height: 12),
                  const Text('Asad Wazir',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  const Text('Flutter Developer | Pakistan 🇵🇰',
                      style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileStat('120', 'Posts'),
                      _buildProfileStat('5.2K', 'Followers'),
                      _buildProfileStat('340', 'Following'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 13: Dashboard Stats (Row + Expanded)
            // Real-life: Admin dashboard stats cards
            // ==============================================================
            _buildSectionTitle('13. Dashboard Stats Cards (Row + Expanded)'),
            const Text('Equal-width stat cards — like admin dashboards',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildStatCard('Users', '1,245', Icons.people, Colors.blue),
                const SizedBox(width: 10),
                _buildStatCard('Orders', '832', Icons.shopping_cart, Colors.green),
                const SizedBox(width: 10),
                _buildStatCard('Revenue', '₨45K', Icons.attach_money, Colors.orange),
              ],
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 14: Social Media Action Bar (Row)
            // Real-life: Like, Comment, Share buttons
            // ==============================================================
            _buildSectionTitle('14. Social Media Action Bar (Row)'),
            const Text('Like, Comment, Share — like Facebook post actions',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.thumb_up_outlined, 'Like', Colors.blue),
                  _buildActionButton(Icons.comment_outlined, 'Comment', Colors.green),
                  _buildActionButton(Icons.share_outlined, 'Share', Colors.orange),
                  _buildActionButton(Icons.bookmark_outline, 'Save', Colors.purple),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 15: Wrap of Skill Tags
            // Real-life: Skills section on LinkedIn / Resume
            // ==============================================================
            _buildSectionTitle('15. Skill Tags (Wrap)'),
            const Text('Skills/Interests chips — like LinkedIn skills',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildSkillChip('Flutter', Colors.blue),
                  _buildSkillChip('Dart', Colors.teal),
                  _buildSkillChip('Firebase', Colors.orange),
                  _buildSkillChip('Python', Colors.green),
                  _buildSkillChip('REST API', Colors.purple),
                  _buildSkillChip('Git', Colors.red),
                  _buildSkillChip('UI/UX', Colors.pink),
                  _buildSkillChip('SQL', Colors.indigo),
                  _buildSkillChip('MongoDB', Colors.green),
                  _buildSkillChip('Node.js', Colors.lime),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 16: Login Form Layout (Column)
            // Real-life: Any app login screen
            // ==============================================================
            _buildSectionTitle('16. Login Form Layout (Column)'),
            const Text('Fields stacked vertically — every app login screen',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, 3)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Welcome Back!',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Forgot Password?', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Login', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Don't have an account? "),
                      Text('Sign Up', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 17: Notification List Item (Row + Column)
            // Real-life: Notification panel in any app
            // ==============================================================
            _buildSectionTitle('17. Notification Items (Row + Column)'),
            const Text('Icon + message + time — app notification list',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  _buildNotificationItem(Icons.favorite, Colors.red, 'Ali liked your post', '5 min ago', true),
                  const Divider(height: 1),
                  _buildNotificationItem(Icons.comment, Colors.blue, 'Sara commented on your photo', '1 hour ago', true),
                  const Divider(height: 1),
                  _buildNotificationItem(Icons.person_add, Colors.green, 'Ahmed started following you', '3 hours ago', false),
                  const Divider(height: 1),
                  _buildNotificationItem(Icons.shopping_bag, Colors.orange, 'Your order has been shipped!', 'Yesterday', false),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 18: Weather Card (Column + Row)
            // Real-life: Weather app display
            // ==============================================================
            _buildSectionTitle('18. Weather Card (Column + Row)'),
            const Text('Temperature, icon, details — like weather apps',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Islamabad', style: TextStyle(color: Colors.white, fontSize: 20)),
                      Icon(Icons.location_on, color: Colors.white70),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.wb_sunny, color: Colors.yellow, size: 60),
                      SizedBox(width: 16),
                      Text('32°C',
                          style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Sunny', style: TextStyle(color: Colors.white70, fontSize: 18)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildWeatherDetail(Icons.water_drop, '45%', 'Humidity'),
                      _buildWeatherDetail(Icons.air, '12 km/h', 'Wind'),
                      _buildWeatherDetail(Icons.visibility, '10 km', 'Visibility'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 19: Music Player Controls (Row)
            // Real-life: Spotify / Music player bottom bar
            // ==============================================================
            _buildSectionTitle('19. Music Player Controls (Row)'),
            const Text('Play controls — like Spotify bottom player',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.music_note, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Shape of You',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text('Ed Sheeran', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      const Icon(Icons.favorite_border, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.shuffle, color: Colors.white54, size: 22),
                      Icon(Icons.skip_previous, color: Colors.white, size: 32),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.play_arrow, color: Colors.black, size: 30),
                      ),
                      Icon(Icons.skip_next, color: Colors.white, size: 32),
                      Icon(Icons.repeat, color: Colors.white54, size: 22),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 20: Food Order Card (Row + Column)
            // Real-life: Foodpanda / UberEats food item
            // ==============================================================
            _buildSectionTitle('20. Food Order Card (Row + Column)'),
            const Text('Food item with image, name, price — like Foodpanda',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 6, offset: const Offset(0, 2)),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.fastfood, size: 40, color: Colors.red),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Zinger Burger',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text('Crispy chicken with cheese & sauce',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        SizedBox(height: 6),
                        Text('Rs. 550',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.remove, color: Colors.white, size: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        Icon(Icons.add, color: Colors.white, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 21: Contact Info Card (Column + Row)
            // Real-life: Contact details page
            // ==============================================================
            _buildSectionTitle('21. Contact Info Card (Column of Rows)'),
            const Text('Phone, email, address — contact/about page',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  _buildContactRow(Icons.phone, 'Phone', '+92 300 1234567', Colors.green),
                  const Divider(),
                  _buildContactRow(Icons.email, 'Email', 'asad@example.com', Colors.blue),
                  const Divider(),
                  _buildContactRow(Icons.location_on, 'Address', 'Islamabad, Pakistan', Colors.red),
                  const Divider(),
                  _buildContactRow(Icons.language, 'Website', 'www.asaddev.com', Colors.purple),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 22: Image Gallery Grid (Wrap)
            // Real-life: Photo gallery / Instagram grid
            // ==============================================================
            _buildSectionTitle('22. Image Gallery Grid (Wrap)'),
            const Text('Wrapping image tiles — like Instagram photo grid',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: List.generate(
                9,
                (index) => Container(
                  width: (MediaQuery.of(context).size.width - 48) / 3,
                  height: (MediaQuery.of(context).size.width - 48) / 3,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length].shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      [
                        Icons.photo, Icons.landscape, Icons.pets,
                        Icons.restaurant, Icons.flight, Icons.beach_access,
                        Icons.camera_alt, Icons.music_note, Icons.sports_soccer,
                      ][index],
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 23: Pricing Plan Card (Column)
            // Real-life: SaaS / Subscription pricing page
            // ==============================================================
            _buildSectionTitle('23. Pricing Plan Card (Column)'),
            const Text('Subscription plan — like Netflix/Spotify plans',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple.shade300],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('PRO PLAN',
                      style: TextStyle(color: Colors.white70, fontSize: 14, letterSpacing: 2)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Rs.', style: TextStyle(color: Colors.white70, fontSize: 18)),
                      Text('999', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                      Text('/mo', style: TextStyle(color: Colors.white70, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...['✓ Unlimited Access', '✓ No Ads', '✓ Download Offline', '✓ 4K Quality', '✓ 5 Devices']
                      .map((feature) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(feature, style: const TextStyle(color: Colors.white, fontSize: 15)),
                          )),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Subscribe Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 24: Review / Testimonial Card (Column + Row)
            // Real-life: App store reviews / Google reviews
            // ==============================================================
            _buildSectionTitle('24. Review / Testimonial (Column + Row)'),
            const Text('Star rating + review text — like Google Play reviews',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 4, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.teal,
                        child: Text('FK', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Fatima Khan', style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(
                              children: List.generate(
                                5,
                                (i) => Icon(i < 4 ? Icons.star : Icons.star_border, color: Colors.amber, size: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text('2 days ago', style: TextStyle(color: Colors.grey, fontSize: 11)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Amazing app! Very user-friendly interface and smooth performance. Highly recommended for beginners learning Flutter.',
                    style: TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 25: Bottom Navigation Bar (Row)
            // Real-life: Tab bar at bottom of apps
            // ==============================================================
            _buildSectionTitle('25. Bottom Navigation Bar (Row)'),
            const Text('Tab icons with labels — bottom of every app',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: const Offset(0, -2)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', true),
                  _buildNavItem(Icons.search, 'Search', false),
                  _buildNavItem(Icons.add_circle_outline, 'Post', false),
                  _buildNavItem(Icons.favorite_outline, 'Activity', false),
                  _buildNavItem(Icons.person_outline, 'Profile', false),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 26: Category Filter Chips (Wrap)
            // Real-life: E-commerce category filters / YouTube tags
            // ==============================================================
            _buildSectionTitle('26. Category Filters (Wrap)'),
            const Text('Selectable filters — like YouTube/Amazon categories',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildFilterChip('All', true),
                _buildFilterChip('Electronics', false),
                _buildFilterChip('Clothing', false),
                _buildFilterChip('Books', false),
                _buildFilterChip('Home & Kitchen', false),
                _buildFilterChip('Sports', false),
                _buildFilterChip('Beauty', false),
                _buildFilterChip('Toys', false),
              ],
            ),
            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 27: Timeline / Activity Feed (Column)
            // Real-life: Order tracking / Activity history
            // ==============================================================
            _buildSectionTitle('27. Order Tracking Timeline (Column)'),
            const Text('Step-by-step progress — like Daraz order tracking',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  _buildTimelineItem('Order Placed', 'Feb 10, 2026', true, true),
                  _buildTimelineItem('Payment Confirmed', 'Feb 10, 2026', true, true),
                  _buildTimelineItem('Shipped', 'Feb 11, 2026', true, false),
                  _buildTimelineItem('Out for Delivery', 'Pending', false, false),
                  _buildTimelineItem('Delivered', 'Pending', false, false),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  SizedBox(height: 8),
                  Text('• Row = Horizontal, Column = Vertical'),
                  Text('• MainAxisAlignment = along the direction'),
                  Text('• CrossAxisAlignment = perpendicular'),
                  Text('• Use Expanded to fill available space'),
                  Text('• Use Spacer to push items apart'),
                  Text('• Use Wrap when items might overflow'),
                  Text('• SizedBox for fixed spacing between items'),
                  Text('• Nested Row inside Column = complex layouts'),
                  Text('• Wrap + Chip = perfect for tags/filters'),
                  Text('• Row + Expanded = equal-width cards'),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ==================================================================
  // HELPER METHODS
  // ==================================================================

  /// Section title builder
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  // Helper method to build alignment example row
  Widget _buildAlignmentExample(String label, MainAxisAlignment alignment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('.$label:', style: const TextStyle(fontSize: 12)),
        Container(
          color: Colors.yellow.shade100,
          height: 40,
          child: Row(
            mainAxisAlignment: alignment,
            children: [
              Container(width: 40, height: 30, color: Colors.red),
              Container(width: 40, height: 30, color: Colors.green),
              Container(width: 40, height: 30, color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to build chip for Wrap example
  Widget _buildChip(String label) {
    return Chip(label: Text(label), backgroundColor: Colors.blue.shade100);
  }

  /// Settings item row: icon + label + subtitle + switch
  Widget _buildSettingsItem(IconData icon, String title, String subtitle, bool isOn) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 26),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Switch(value: isOn, onChanged: null),
        ],
      ),
    );
  }

  /// Profile stat widget
  Widget _buildProfileStat(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  /// Dashboard stat card
  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  /// Social action button (like, comment, share)
  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 11)),
      ],
    );
  }

  /// Skill chip with color
  Widget _buildSkillChip(String label, Color color) {
    return Chip(
      label: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }

  /// Notification item row
  Widget _buildNotificationItem(IconData icon, Color color, String text, String time, bool isNew) {
    return Container(
      color: isNew ? Colors.blue.shade50 : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: TextStyle(fontWeight: isNew ? FontWeight.bold : FontWeight.normal)),
                const SizedBox(height: 2),
                Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          if (isNew)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            ),
        ],
      ),
    );
  }

  /// Weather detail widget
  Widget _buildWeatherDetail(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 22),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
      ],
    );
  }

  /// Contact info row
  Widget _buildContactRow(IconData icon, String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Bottom nav item
  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? Colors.blue : Colors.grey, size: 26),
        const SizedBox(height: 2),
        Text(label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            )),
      ],
    );
  }

  /// Category filter chip
  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 13,
        ),
      ),
    );
  }

  /// Timeline / order tracking item
  Widget _buildTimelineItem(String title, String time, bool isDone, bool hasNextDone) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isDone ? Colors.green : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: isDone ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
            ),
            if (title != 'Delivered')
              Container(
                width: 2,
                height: 40,
                color: hasNextDone ? Colors.green : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(fontWeight: FontWeight.w600, color: isDone ? Colors.black : Colors.grey)),
                Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
