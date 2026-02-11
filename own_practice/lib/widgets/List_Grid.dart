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

  // Track which example to show
  int selectedExample = 2; // Default to GridView.builder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView & GridView Examples'),
        backgroundColor: const Color.fromARGB(255, 105, 240, 213),
        elevation: 0,
      ),
      body: Column(
        children: [
          // ================================================================
          // EXAMPLE SELECTOR
          // ================================================================
          Container(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildExampleButton('ListView.builder', 0),
                _buildExampleButton('ListView.separated', 1),
                _buildExampleButton('GridView.builder', 2),
                _buildExampleButton('GridView.count', 3),
              ],
            ),
          ),

          const Divider(),

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedExample == index ? Colors.blue : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          selectedExample = index;
        });
      },
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }

  // Build the selected example
  Widget _buildSelectedExample() {
    switch (selectedExample) {
      case 0:
        return _buildListViewBuilder();
      case 1:
        return _buildListViewSeparated();
      case 2:
        return _buildGridViewBuilder();
      case 3:
        return _buildGridViewCount();
      default:
        return _buildGridViewBuilder();
    }
  }

  // ========================================================================
  // EXAMPLE 1: ListView.builder
  // ========================================================================
  // Creates items LAZILY - only builds items when they become visible
  // BEST FOR: Large lists with many items
  Widget _buildListViewBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ListView.builder',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Creates items lazily (on-demand) for better performance',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            // Total number of items
            itemCount: fruitsPerson['fruits']!.length,

            // Padding around the list
            padding: const EdgeInsets.symmetric(horizontal: 12),

            // This function builds each item when it becomes visible
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  // Icon at the start
                  leading: CircleAvatar(
                    backgroundColor: Colors.primaries[index % Colors.primaries.length],
                    child: Text(
                      fruitsPerson['fruits']![index][0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  // Main text
                  title: Text(fruitsPerson['fruits']![index]),
                  // Secondary text
                  subtitle: Text('By: ${fruitsPerson['person']![index]}'),
                  // Icon at the end
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  // Tap action
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tapped: ${fruitsPerson['fruits']![index]}'),
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
  Widget _buildListViewSeparated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ListView.separated',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Adds dividers/separators between items automatically',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
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
                trailing: Text('#${index + 1}'),
              );
            },

            // Build separator between items
            separatorBuilder: (context, index) {
              return const Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              );
            },
          ),
        ),
      ],
    );
  }

  // ========================================================================
  // EXAMPLE 3: GridView.builder (RECOMMENDED)
  // ========================================================================
  // Creates grid items LAZILY for better performance
  Widget _buildGridViewBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GridView.builder ⭐ RECOMMENDED',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Creates grid items lazily - best for large grids',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(12),

            // Grid layout configuration
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 columns
              mainAxisSpacing: 10, // Vertical space
              crossAxisSpacing: 10, // Horizontal space
              childAspectRatio: 1.2, // Width / Height ratio
            ),

            // Total number of items
            itemCount: fruits.length,

            // Build each grid item
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                color: Colors.primaries[index % Colors.primaries.length],
                shadowColor: Colors.primaries[index % Colors.primaries.length].withOpacity(0.4),
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
                        const Icon(
                          Icons.local_florist,
                          color: Colors.white,
                          size: 40,
                        ),
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
  // EXAMPLE 4: GridView.count
  // ========================================================================
  // Quick way to create a grid with fixed number of columns
  Widget _buildGridViewCount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GridView.count',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Quick shorthand for fixed column count grids',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(12),

            // Number of columns
            crossAxisCount: 3,

            // Spacing
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,

            // Items (creates ALL at once - less efficient)
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
}
