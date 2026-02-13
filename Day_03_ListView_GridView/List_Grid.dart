import 'package:flutter/material.dart';

// ============================================================================
// LISTVIEW & GRIDVIEW - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT ARE LISTVIEW AND GRIDVIEW?
// --------------------------------
// ListView: A scrollable list of widgets arranged in a single column
// GridView: A scrollable grid of widgets arranged in rows and columns
//
// Both are essential for displaying collections of data in Flutter!
//
// ============================================================================
// LISTVIEW TYPES (4 Constructors)
// ============================================================================
//
// 1. ListView() - Default Constructor
//    - Creates ALL items immediately
//    - Best for: Small, fixed lists (10-20 items)
//    - Uses: children: [Widget1, Widget2, ...]
//
// 2. ListView.builder() - MOST COMMON ⭐
//    - Creates items LAZILY (only when visible)
//    - Best for: Large or infinite lists
//    - Uses: itemBuilder callback function
//    - RECOMMENDED for performance!
//
// 3. ListView.separated()
//    - Like builder, but with separators between items
//    - Best for: Lists with dividers
//    - Uses: itemBuilder AND separatorBuilder
//
// 4. ListView.custom()
//    - Maximum control with SliverChildDelegate
//    - Best for: Advanced custom behavior
//
// ============================================================================
// LISTVIEW PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// SCROLL PROPERTIES:
// ------------------
// 1. scrollDirection: Axis
//    - Direction of scrolling
//    - Values: Axis.vertical (default), Axis.horizontal
//
// 2. reverse: bool
//    - If true, scroll starts from bottom/right (default: false)
//
// 3. controller: ScrollController?
//    - Control scroll position programmatically
//    - Useful for: scroll to top, listen to scroll
//
// 4. physics: ScrollPhysics?
//    - Scroll behavior
//    - Values:
//      - AlwaysScrollableScrollPhysics(): Always scrollable
//      - NeverScrollableScrollPhysics(): Disable scrolling
//      - BouncingScrollPhysics(): iOS-style bounce
//      - ClampingScrollPhysics(): Android-style clamp
//
// 5. primary: bool?
//    - If true, uses PrimaryScrollController
//
// PADDING & SPACING:
// ------------------
// 6. padding: EdgeInsetsGeometry?
//    - Padding around the entire list
//
// 7. itemExtent: double?
//    - Fixed height for each item (improves performance)
//
// 8. prototypeItem: Widget?
//    - Widget to measure item height (alternative to itemExtent)
//
// BUILDER PROPERTIES (for ListView.builder):
// ------------------------------------------
// 9. itemCount: int?
//    - Total number of items (null = infinite)
//
// 10. itemBuilder: Widget Function(BuildContext, int)
//     - Function that builds each item
//     - Parameters: context, index
//
// OTHER PROPERTIES:
// -----------------
// 11. shrinkWrap: bool
//     - If true, takes only needed space (default: false)
//     - WARNING: Can be slow for large lists
//
// 12. addAutomaticKeepAlives: bool
//     - Keep items alive when scrolled off screen (default: true)
//
// 13. addRepaintBoundaries: bool
//     - Wrap items in RepaintBoundary (default: true)
//
// 14. cacheExtent: double?
//     - How far to pre-build items off-screen
//
// 15. clipBehavior: Clip
//     - How to clip content (default: Clip.hardEdge)
//
// ============================================================================
// GRIDVIEW TYPES (4 Constructors)
// ============================================================================
//
// 1. GridView() - Default Constructor
//    - Creates ALL items immediately
//    - Requires gridDelegate
//
// 2. GridView.builder() - MOST COMMON ⭐
//    - Creates items LAZILY
//    - Best for: Large grids
//    - RECOMMENDED for performance!
//
// 3. GridView.count()
//    - Quick way to create grid with fixed column count
//    - Uses: crossAxisCount parameter
//
// 4. GridView.extent()
//    - Grid where each item has max width
//    - Uses: maxCrossAxisExtent parameter
//
// ============================================================================
// GRIDVIEW DELEGATE TYPES
// ============================================================================
//
// 1. SliverGridDelegateWithFixedCrossAxisCount
//    - Fixed number of columns (most common)
//    - Properties:
//      - crossAxisCount: int - Number of columns (required)
//      - mainAxisSpacing: double - Vertical space between items
//      - crossAxisSpacing: double - Horizontal space between items
//      - childAspectRatio: double - Width/height ratio (default: 1.0)
//      - mainAxisExtent: double? - Fixed height for items
//
// 2. SliverGridDelegateWithMaxCrossAxisExtent
//    - Items have maximum width
//    - Properties:
//      - maxCrossAxisExtent: double - Max item width (required)
//      - mainAxisSpacing, crossAxisSpacing, childAspectRatio: same as above
//
// ============================================================================
// LISTTILE WIDGET (Common list item)
// ============================================================================
//
// ListTile is a pre-built list item widget with standard layout.
//
// Properties:
// - title: Widget - Main text/content
// - subtitle: Widget? - Secondary text below title
// - leading: Widget? - Widget at start (icon, avatar)
// - trailing: Widget? - Widget at end (icon, switch)
// - onTap: VoidCallback? - Tap callback
// - onLongPress: VoidCallback? - Long press callback
// - selected: bool - If item is selected
// - selectedColor: Color? - Color when selected
// - tileColor: Color? - Background color
// - shape: ShapeBorder? - Shape of the tile
// - dense: bool - If true, reduces height
// - enabled: bool - If false, item is disabled
//
// ============================================================================

class List_Grid extends StatefulWidget {
  const List_Grid({super.key});

  @override
  State<List_Grid> createState() => _List_GridState();
}

class _List_GridState extends State<List_Grid> {
  // Sample data: List of fruit names
  List<String> fruits = [
    'Apple',
    'Banana',
    'Mango',
    'Orange',
    'Pineapple',
    'Grapes',
    'Watermelon',
    'Papaya',
    'Strawberry',
    'Blueberry',
  ];

  // Sample data: Map with fruits and persons lists
  Map<String, List<String>> fruitsPerson = {
    'fruits': ['Apple', 'Banana', 'Mango', 'Orange', 'Pineapple', 'Grapes'],
    'person': ['Asad', 'Wazir', 'Khan', 'Hello', 'World', 'Flutter'],
  };

  // Colors for items
  List<Color> cardColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.amber,
    Colors.cyan,
  ];

  // ScrollController for Example 8
  final ScrollController _scrollController = ScrollController();

  // Track which example to show
  int selectedExample = 0;

  // Example labels for buttons
  final List<String> exampleLabels = [
    '1. ListView.builder',
    '2. ListView.separated',
    '3. ListView() Default',
    '4. ListView.custom',
    '5. Horizontal ListView',
    '6. Reverse ListView',
    '7. ListView itemExtent',
    '8. ListView ScrollController',
    '9. ListView shrinkWrap',
    '10. GridView.builder',
    '11. GridView.count',
    '12. GridView.extent',
    '13. GridView() Default',
    '14. GridView MaxExtent',
    '15. GridView.custom',
    '16. Horizontal GridView',
    '17. GridView mainAxisExtent',
    '18. GridView childAspectRatio',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView & GridView - 18 Examples'),
        backgroundColor: const Color.fromARGB(255, 105, 240, 213),
        elevation: 0,
      ),
      body: Column(
        children: [
          // ================================================================
          // EXAMPLE SELECTOR (Scrollable list of buttons)
          // ================================================================
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: exampleLabels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _buildExampleButton(exampleLabels[index], index),
                );
              },
            ),
          ),

          const Divider(height: 1),

          // ================================================================
          // EXAMPLE DISPLAY
          // ================================================================
          Expanded(
            child: _buildSelectedExample(),
          ),
        ],
      ),
    );
  }

  // Button to select example
  Widget _buildExampleButton(String label, int index) {
    final bool isSelected = selectedExample == index;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey.shade300,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        setState(() {
          selectedExample = index;
        });
      },
      child: Text(label, style: const TextStyle(fontSize: 11)),
    );
  }

  // Helper: Build example header
  Widget _buildExampleHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // Build the selected example
  Widget _buildSelectedExample() {
    switch (selectedExample) {
      case 0:
        return _example1_ListViewBuilder();
      case 1:
        return _example2_ListViewSeparated();
      case 2:
        return _example3_ListViewDefault();
      case 3:
        return _example4_ListViewCustom();
      case 4:
        return _example5_HorizontalListView();
      case 5:
        return _example6_ReverseListView();
      case 6:
        return _example7_ListViewItemExtent();
      case 7:
        return _example8_ListViewScrollController();
      case 8:
        return _example9_ListViewShrinkWrap();
      case 9:
        return _example10_GridViewBuilder();
      case 10:
        return _example11_GridViewCount();
      case 11:
        return _example12_GridViewExtent();
      case 12:
        return _example13_GridViewDefault();
      case 13:
        return _example14_GridViewMaxExtent();
      case 14:
        return _example15_GridViewCustom();
      case 15:
        return _example16_HorizontalGridView();
      case 16:
        return _example17_GridViewMainAxisExtent();
      case 17:
        return _example18_GridViewChildAspectRatio();
      default:
        return _example1_ListViewBuilder();
    }
  }

  // ========================================================================
  // EXAMPLE 1: ListView.builder
  // ========================================================================
  // Creates items LAZILY - only builds items when they become visible
  // BEST FOR: Large lists with many items
  Widget _example1_ListViewBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 1: ListView.builder ⭐',
          'Creates items lazily (on-demand). Best for large/infinite lists.',
        ),
        Expanded(
          child: ListView.builder(
            // Total number of items
            itemCount: fruitsPerson['fruits']!.length,
            // Padding around the list
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // Builder: builds each item only when visible on screen
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Colors.primaries[index % Colors.primaries.length],
                    child: Text(
                      fruitsPerson['fruits']![index][0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(fruitsPerson['fruits']![index]),
                  subtitle: Text('By: ${fruitsPerson['person']![index]}'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Tapped: ${fruitsPerson['fruits']![index]}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 2: ListView.separated
  // ========================================================================
  // Like builder, but automatically adds separators between items
  Widget _example2_ListViewSeparated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 2: ListView.separated',
          'Like builder but adds a separator widget between each item.',
        ),
        Expanded(
          child: ListView.separated(
            itemCount: fruits.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // Build each item
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.local_florist, color: Colors.green),
                title: Text(fruits[index]),
                subtitle: Text('Fruit index: $index'),
                trailing: Text('#${index + 1}'),
              );
            },
            // Build separator between items
            separatorBuilder: (context, index) {
              // Alternate between divider and a colored gap
              return index.isEven
                  ? const Divider(height: 1, thickness: 1, color: Colors.grey)
                  : Container(
                      height: 4,
                      color: Colors.blue.shade50,
                    );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 3: ListView() - Default Constructor
  // ========================================================================
  // Creates ALL items immediately (not lazy)
  // Best for: Small, fixed lists with known widgets
  Widget _example3_ListViewDefault() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 3: ListView() Default Constructor',
          'Creates ALL children immediately. Best for small, fixed lists.',
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            // All children are created at once — use for small lists only
            children: [
              Card(
                color: Colors.red.shade100,
                child: const ListTile(
                  leading: Icon(Icons.looks_one, color: Colors.red),
                  title: Text('First Item'),
                  subtitle: Text('This is a hardcoded item'),
                ),
              ),
              Card(
                color: Colors.green.shade100,
                child: const ListTile(
                  leading: Icon(Icons.looks_two, color: Colors.green),
                  title: Text('Second Item'),
                  subtitle: Text('Another hardcoded item'),
                ),
              ),
              Card(
                color: Colors.blue.shade100,
                child: const ListTile(
                  leading: Icon(Icons.looks_3, color: Colors.blue),
                  title: Text('Third Item'),
                  subtitle: Text('One more fixed item'),
                ),
              ),
              Card(
                color: Colors.orange.shade100,
                child: const ListTile(
                  leading: Icon(Icons.looks_4, color: Colors.orange),
                  title: Text('Fourth Item'),
                  subtitle: Text('Last hardcoded item'),
                ),
              ),
              Card(
                color: Colors.purple.shade100,
                child: const ListTile(
                  leading: Icon(Icons.looks_5, color: Colors.purple),
                  title: Text('Fifth Item'),
                  subtitle: Text('All items built at once!'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 4: ListView.custom
  // ========================================================================
  // Maximum control using SliverChildDelegate
  // Best for: Advanced custom behavior
  Widget _example4_ListViewCustom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 4: ListView.custom',
          'Uses SliverChildBuilderDelegate for maximum control.',
        ),
        Expanded(
          child: ListView.custom(
            padding: const EdgeInsets.all(12),
            // SliverChildBuilderDelegate works like builder
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            cardColors[index % cardColors.length],
                            cardColors[index % cardColors.length]
                                .withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    title: Text(fruits[index]),
                    subtitle: const Text('Built with SliverChildBuilderDelegate'),
                    trailing: Icon(Icons.chevron_right,
                        color: cardColors[index % cardColors.length]),
                  ),
                );
              },
              childCount: fruits.length, // required for custom
            ),
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 5: Horizontal ListView
  // ========================================================================
  // Scrolls horizontally instead of vertically
  Widget _example5_HorizontalListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 5: Horizontal ListView',
          'scrollDirection: Axis.horizontal — items scroll left/right.',
        ),
        const SizedBox(height: 8),
        // Horizontal list needs a fixed height container
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // <-- horizontal scroll
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      cardColors[index % cardColors.length],
                      cardColors[index % cardColors.length].withOpacity(0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: cardColors[index % cardColors.length]
                          .withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.fastfood, color: Colors.white, size: 40),
                    const SizedBox(height: 8),
                    Text(
                      fruits[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Second horizontal list for variety
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Another Horizontal List:',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length]
                      .shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(
                      color: Colors.primaries[index % Colors.primaries.length],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 6: Reverse ListView
  // ========================================================================
  // Scrolls from bottom to top (like a chat)
  Widget _example6_ReverseListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 6: Reverse ListView',
          'reverse: true — list starts from the bottom (chat-style).',
        ),
        Expanded(
          child: ListView.builder(
            reverse: true, // <-- starts from bottom
            padding: const EdgeInsets.all(12),
            itemCount: 20,
            itemBuilder: (context, index) {
              // Simulating a chat-like UI
              final bool isMe = index % 2 == 0;
              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue.shade100 : Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft:
                          isMe ? const Radius.circular(16) : Radius.zero,
                      bottomRight:
                          isMe ? Radius.zero : const Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Message ${index + 1}: ${isMe ? "Hello!" : "Hi there!"}',
                    style: TextStyle(
                      color: isMe ? Colors.blue.shade900 : Colors.black87,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 7: ListView with itemExtent
  // ========================================================================
  // Fixed height per item — improves scroll performance
  Widget _example7_ListViewItemExtent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 7: ListView with itemExtent',
          'itemExtent: 80 — every item has fixed height. Faster scrolling!',
        ),
        Expanded(
          child: ListView.builder(
            itemExtent: 80, // <-- fixed height for every item
            padding: const EdgeInsets.all(12),
            itemCount: 30,
            itemBuilder: (context, index) {
              return Card(
                color:
                    Colors.primaries[index % Colors.primaries.length].shade100,
                margin: const EdgeInsets.symmetric(vertical: 2),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.primaries[index % Colors.primaries.length],
                      child: Text('${index + 1}',
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text('Item ${index + 1}'),
                    subtitle: const Text('Fixed height: 80px'),
                    trailing: const Icon(Icons.height),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 8: ListView with ScrollController
  // ========================================================================
  // Programmatically scroll to top or bottom
  Widget _example8_ListViewScrollController() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 8: ListView + ScrollController',
          'Use ScrollController to scroll to top/bottom programmatically.',
        ),
        // Control buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Scroll to top with animation
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.arrow_upward, size: 16),
                label: const Text('Scroll to Top'),
              ),
              const SizedBox(width: 8),
              ElevatedButton.icon(
                onPressed: () {
                  // Scroll to bottom with animation
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.arrow_downward, size: 16),
                label: const Text('Scroll to Bottom'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            controller: _scrollController, // <-- attach controller
            padding: const EdgeInsets.all(12),
            itemCount: 50,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 3),
                child: ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text('Scrollable Item ${index + 1}'),
                  subtitle: Text(index == 0
                      ? '👆 TOP'
                      : index == 49
                          ? '👇 BOTTOM'
                          : 'Scroll me!'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 9: ListView with shrinkWrap (Nested)
  // ========================================================================
  // shrinkWrap: true — takes only as much space as its children need
  // Useful when ListView is inside another scrollable widget
  Widget _example9_ListViewShrinkWrap() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Example 9: ListView + shrinkWrap',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'shrinkWrap: true + NeverScrollableScrollPhysics() for nesting.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          // Section 1
          const Text('🍎 Fruits:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          // Nested ListView with shrinkWrap
          ListView.builder(
            shrinkWrap: true, // <-- only takes needed space
            physics:
                const NeverScrollableScrollPhysics(), // <-- disable inner scroll
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.local_florist, color: Colors.green),
                  title: Text(fruits[index]),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          // Section 2
          const Text('👤 People:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          // Another nested ListView
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: fruitsPerson['person']!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.amber.shade50,
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.blue),
                  title: Text(fruitsPerson['person']![index]),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          const Text('⬆️ Both lists are inside a SingleChildScrollView!',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  // ========================================================================
  // EXAMPLE 10: GridView.builder (RECOMMENDED)
  // ========================================================================
  // Creates grid items LAZILY for better performance
  Widget _example10_GridViewBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 10: GridView.builder ⭐',
          'Creates grid items lazily - best for large grids.',
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            // Grid layout configuration
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                color: Colors.primaries[index % Colors.primaries.length],
                shadowColor: Colors
                    .primaries[index % Colors.primaries.length]
                    .withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: ${fruits[index]}')),
                    );
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.local_florist,
                            color: Colors.white, size: 40),
                        const SizedBox(height: 8),
                        Text(
                          fruits[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 11: GridView.count
  // ========================================================================
  // Quick way to create a grid with fixed number of columns
  Widget _example11_GridViewCount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 11: GridView.count',
          'Quick shorthand: crossAxisCount defines columns. Children built at once.',
        ),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(12),
            crossAxisCount: 3, // 3 columns
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            // All items are created at once (not lazy)
            children: List.generate(fruits.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue),
                ),
                child: Center(
                  child: Text(
                    fruits[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 12: GridView.extent
  // ========================================================================
  // Each tile has a maximum cross-axis extent (width in vertical grids)
  Widget _example12_GridViewExtent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 12: GridView.extent',
          'maxCrossAxisExtent: 150 — items have max width, columns auto-calculated.',
        ),
        Expanded(
          child: GridView.extent(
            padding: const EdgeInsets.all(12),
            maxCrossAxisExtent: 150, // <-- max width per item
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(fruits.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.primaries[index % Colors.primaries.length]
                          .shade200,
                      Colors.primaries[index % Colors.primaries.length]
                          .shade400,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,
                          color: Colors.white, size: 28),
                      const SizedBox(height: 4),
                      Text(
                        fruits[index],
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 13: GridView() Default Constructor
  // ========================================================================
  // Default constructor with explicit gridDelegate
  Widget _example13_GridViewDefault() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 13: GridView() Default',
          'Default constructor with explicit gridDelegate and children list.',
        ),
        Expanded(
          child: GridView(
            padding: const EdgeInsets.all(12),
            // Must provide gridDelegate
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            // Direct children (all built at once)
            children: [
              _buildGridTile('Home', Icons.home, Colors.blue),
              _buildGridTile('Search', Icons.search, Colors.green),
              _buildGridTile('Profile', Icons.person, Colors.orange),
              _buildGridTile('Settings', Icons.settings, Colors.purple),
              _buildGridTile('Camera', Icons.camera_alt, Colors.red),
              _buildGridTile('Music', Icons.music_note, Colors.teal),
              _buildGridTile('Video', Icons.videocam, Colors.indigo),
              _buildGridTile('Map', Icons.map, Colors.brown),
            ],
          ),
        ),
      ],
    );
  }

  // Helper for Example 13
  Widget _buildGridTile(String label, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: color, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // ========================================================================
  // EXAMPLE 14: GridView.builder with MaxCrossAxisExtent Delegate
  // ========================================================================
  // Uses SliverGridDelegateWithMaxCrossAxisExtent instead of FixedCrossAxisCount
  Widget _example14_GridViewMaxExtent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 14: GridView.builder + MaxCrossAxisExtent',
          'SliverGridDelegateWithMaxCrossAxisExtent: adaptive column count.',
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120, // <-- max width per tile
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.85,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length]
                      .shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.primaries[index % Colors.primaries.length]
                          .withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Colors.primaries[index % Colors.primaries.length],
                      child: Text('${index + 1}',
                          style: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tile ${index + 1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 15: GridView.custom
  // ========================================================================
  // Maximum control with SliverChildDelegate + SliverGridDelegate
  Widget _example15_GridViewCustom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 15: GridView.custom',
          'SliverChildBuilderDelegate + SliverGridDelegate for full control.',
        ),
        Expanded(
          child: GridView.custom(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.0,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
                final color = cardColors[index % cardColors.length];
                return Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [color.withOpacity(0.7), color],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          [
                            Icons.favorite,
                            Icons.star,
                            Icons.thumb_up,
                            Icons.bolt,
                            Icons.diamond,
                            Icons.eco,
                            Icons.pets,
                            Icons.sunny,
                            Icons.water_drop,
                            Icons.cloud,
                          ][index % 10],
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          fruits[index % fruits.length],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 15,
            ),
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 16: Horizontal GridView
  // ========================================================================
  // Grid that scrolls horizontally
  Widget _example16_HorizontalGridView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 16: Horizontal GridView',
          'scrollDirection: Axis.horizontal — grid scrolls left/right.',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('2-row horizontal grid:',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 220,
          child: GridView.builder(
            scrollDirection: Axis.horizontal, // <-- horizontal
            padding: const EdgeInsets.symmetric(horizontal: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 rows (cross axis is vertical here)
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.widgets, color: Colors.white, size: 30),
                      const SizedBox(height: 4),
                      Text(
                        'H-${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('3-row horizontal grid:',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 250,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 rows
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.accents[index % Colors.accents.length]
                      .withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 17: GridView with mainAxisExtent
  // ========================================================================
  // mainAxisExtent overrides childAspectRatio to set a fixed height
  Widget _example17_GridViewMainAxisExtent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleHeader(
          'Example 17: GridView + mainAxisExtent',
          'mainAxisExtent: 200 — fixed height per tile (overrides aspectRatio).',
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 200, // <-- fixed height, ignores childAspectRatio
            ),
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      cardColors[index % cardColors.length].withOpacity(0.8),
                      cardColors[index % cardColors.length],
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: cardColors[index % cardColors.length]
                          .withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.eco,
                            color: Colors.white, size: 32),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fruits[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Height: 200px fixed',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 18: GridView with Different childAspectRatio
  // ========================================================================
  // Demonstrates how childAspectRatio changes tile proportions
  Widget _example18_GridViewChildAspectRatio() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Example 18: GridView + childAspectRatio',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Compare different ratios: 0.6 (tall), 1.0 (square), 2.0 (wide).',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Ratio 0.6 — tall tiles
          const Text('childAspectRatio: 0.6 (Tall tiles)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.6, // <-- tall
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepPurple),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.rectangle_outlined,
                        color: Colors.deepPurple, size: 30),
                    const SizedBox(height: 4),
                    Text(fruits[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    const Text('Ratio: 0.6',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          // Ratio 1.0 — square tiles
          const Text('childAspectRatio: 1.0 (Square tiles)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.0, // <-- square
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.crop_square,
                        color: Colors.teal, size: 30),
                    const SizedBox(height: 4),
                    Text(fruits[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    const Text('Ratio: 1.0',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          // Ratio 2.0 — wide tiles
          const Text('childAspectRatio: 2.0 (Wide tiles)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.0, // <-- wide
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.panorama_wide_angle,
                        color: Colors.orange, size: 24),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(fruits[index],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('Ratio: 2.0',
                            style:
                                TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
