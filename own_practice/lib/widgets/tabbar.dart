import 'package:flutter/material.dart';

// ============================================================================
// TABBAR WIDGET - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS A TABBAR?
// ------------------
// A TabBar is a horizontal row of tabs that allows users to switch between
// different views or sections within the same screen. Think of it like tabs
// in a web browser - you click a tab to see different content!
//
// COMPONENTS OF TAB NAVIGATION:
// -----------------------------
// 1. TabController - Manages the state and animation between tabs
// 2. TabBar - The row of clickable tab buttons
// 3. TabBarView - The content that changes when tabs are selected
//
// HOW TABS WORK TOGETHER:
// -----------------------
// TabController connects TabBar and TabBarView:
//
// ┌─────────────────────────────────┐
// │  Tab 1  │  Tab 2  │  Tab 3     │  ← TabBar (clickable tabs)
// ├─────────────────────────────────┤
// │                                 │
// │       Content for Tab 1        │  ← TabBarView (swipeable content)
// │                                 │
// └─────────────────────────────────┘
//
// WAYS TO CREATE TABCONTROLLER:
// -----------------------------
// Method 1: DefaultTabController (easier, recommended for beginners)
//   DefaultTabController(
//     length: 3,  // Number of tabs
//     child: Scaffold(
//       appBar: AppBar(bottom: TabBar(...)),
//       body: TabBarView(...),
//     ),
//   )
//
// Method 2: TabController with SingleTickerProviderStateMixin (more control)
//   class _MyState extends State<MyWidget> with SingleTickerProviderStateMixin {
//     late TabController _tabController;
//     @override
//     void initState() {
//       _tabController = TabController(length: 3, vsync: this);
//     }
//   }
//
// ============================================================================
// TABBAR WIDGET PROPERTIES
// ============================================================================
//
// 1. tabs: List<Widget> (required)
//    - The tab widgets to display (usually Tab widgets)
//    - Must match the length of TabController
//    - Example: tabs: [Tab(text: 'Home'), Tab(text: 'Profile')]
//
// 2. controller: TabController?
//    - Controls tab selection and animation
//    - If null, uses DefaultTabController from ancestor
//
// 3. isScrollable: bool (default: false)
//    - If true, tabs can scroll horizontally
//    - Useful when you have many tabs
//
// 4. padding: EdgeInsetsGeometry?
//    - Padding around the entire TabBar
//
// 5. indicatorColor: Color?
//    - Color of the line under the selected tab
//    - Default: same as labelColor
//
// 6. indicatorWeight: double (default: 2.0)
//    - Thickness of the indicator line
//
// 7. indicatorPadding: EdgeInsetsGeometry (default: EdgeInsets.zero)
//    - Padding for the indicator
//
// 8. indicator: Decoration?
//    - Custom decoration for the indicator
//    - Can be BoxDecoration for rounded, colored, etc.
//
// 9. indicatorSize: TabBarIndicatorSize?
//    - Size of the indicator:
//      • TabBarIndicatorSize.tab - Full tab width
//      • TabBarIndicatorSize.label - Only label width
//
// 10. dividerColor: Color?
//     - Color of the divider line below TabBar
//
// 11. dividerHeight: double?
//     - Height of the divider (0 to hide)
//
// 12. labelColor: Color?
//     - Color of the selected tab's text/icon
//
// 13. labelStyle: TextStyle?
//     - Text style for selected tab label
//
// 14. labelPadding: EdgeInsetsGeometry?
//     - Padding around each tab label
//
// 15. unselectedLabelColor: Color?
//     - Color of unselected tabs' text/icon
//
// 16. unselectedLabelStyle: TextStyle?
//     - Text style for unselected tab labels
//
// 17. overlayColor: MaterialStateProperty<Color?>?
//     - Color shown when tab is pressed/hovered
//
// 18. splashFactory: InteractiveInkFeatureFactory?
//     - Splash effect when tab is tapped
//
// 19. splashBorderRadius: BorderRadius?
//     - Border radius for the splash effect
//
// 20. onTap: ValueChanged<int>?
//     - Callback when a tab is tapped
//     - Receives the index of the tapped tab
//
// 21. enableFeedback: bool?
//     - Whether to play sounds/haptics on tap
//
// 22. physics: ScrollPhysics?
//     - Scroll physics when isScrollable is true
//
// 23. tabAlignment: TabAlignment?
//     - Alignment of tabs within the TabBar
//     - Values: start, startOffset, center, fill
//
// ============================================================================
// TAB WIDGET PROPERTIES
// ============================================================================
//
// Tab is the individual tab item used inside TabBar.
//
// 1. text: String?
//    - Text label for the tab
//
// 2. icon: Widget?
//    - Icon to display in the tab
//
// 3. iconMargin: EdgeInsetsGeometry (default: EdgeInsets.only(bottom: 10))
//    - Spacing between icon and text
//
// 4. height: double?
//    - Height of the tab
//
// 5. child: Widget?
//    - Custom widget instead of text/icon
//    - Cannot be used with text or icon
//
// ============================================================================
// TABBARVIEW PROPERTIES
// ============================================================================
//
// TabBarView displays content for each tab.
//
// 1. children: List<Widget> (required)
//    - Content widgets for each tab
//    - Must match TabController length
//
// 2. controller: TabController?
//    - Same controller as TabBar
//
// 3. physics: ScrollPhysics?
//    - Swipe behavior (e.g., NeverScrollableScrollPhysics to disable)
//
// 4. dragStartBehavior: DragStartBehavior
//    - How drag gestures start
//
// 5. viewportFraction: double (default: 1.0)
//    - Fraction of viewport each child occupies
//
// 6. clipBehavior: Clip (default: Clip.hardEdge)
//    - How to clip overflowing content
//
// ============================================================================
// TABCONTROLLER PROPERTIES & METHODS
// ============================================================================
//
// Properties:
// - index: int - Current selected tab index
// - previousIndex: int - Previously selected tab
// - length: int - Number of tabs
// - animation: Animation<double> - Tab switch animation
//
// Methods:
// - animateTo(int index) - Animate to a specific tab
// - dispose() - Clean up the controller
//
// ============================================================================

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

// ===========================================================================
// EXAMPLE 1: Using DefaultTabController (Simplest Approach)
// ===========================================================================
class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    // DefaultTabController wraps everything and manages tab state
    return DefaultTabController(
      length: 4, // Number of tabs - MUST match tabs list length
      initialIndex: 0, // Which tab to show first (0-based)
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Examples'),
          backgroundColor: Colors.indigo,

          // TabBar placed in the bottom of AppBar
          bottom: TabBar(
            // List of tabs - must have exactly 4 items (matching length)
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Search',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
            ],

            // === INDICATOR STYLING ===
            indicatorColor: Colors.red, // Color of underline
            indicatorWeight: 4, // Thickness of underline
            indicatorSize: TabBarIndicatorSize.tab, // Full tab width

            // === LABEL STYLING ===
            labelColor: Colors.black, // Selected tab color
            unselectedLabelColor: Colors.white, // Unselected tab color
            labelStyle: const TextStyle(fontWeight: FontWeight.bold), // Selected tab style
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),

            // === DIVIDER ===
            dividerColor: Colors.amber, // Hide divider

            // === CALLBACK ===
            onTap: (index) {
              // Called when user taps a tab
              print('Tab $index tapped');
            },
          ),
        ),

        // TabBarView shows content for the selected tab
        body: TabBarView(
          // physics: NeverScrollableScrollPhysics(), // Uncomment to disable swipe
          children: [
            // === TAB 1: Home ===
            _buildTabContent(
              icon: Icons.home,
              title: 'Home Tab',
              color: Colors.blue,
              description: 'Welcome to the Home tab! This is the first tab.',
            ),

            // === TAB 2: Search ===
            _buildTabContent(
              icon: Icons.search,
              title: 'Search Tab',
              color: Colors.green,
              description: 'Search for anything here. This is the second tab.',
            ),

            // === TAB 3: Favorites ===
            _buildTabContent(
              icon: Icons.favorite,
              title: 'Favorites Tab',
              color: Colors.red,
              description: 'Your favorite items appear here. Third tab content.',
            ),

            // === TAB 4: Profile ===
            _buildTabContent(
              icon: Icons.person,
              title: 'Profile Tab',
              color: Colors.purple,
              description: 'User profile and settings. Fourth tab content.',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build tab content
  Widget _buildTabContent({
    required IconData icon,
    required String title,
    required Color color,
    required String description,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: color),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// EXAMPLE 2: Custom TabController (More Control)
// ===========================================================================
class CustomTabControllerExample extends StatefulWidget {
  const CustomTabControllerExample({super.key});

  @override
  State<CustomTabControllerExample> createState() =>
      _CustomTabControllerExampleState();
}

// SingleTickerProviderStateMixin is REQUIRED for TabController animation
class _CustomTabControllerExampleState extends State<CustomTabControllerExample>
    with SingleTickerProviderStateMixin {
  // Declare TabController
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController
    _tabController = TabController(
      length: 3, // Number of tabs
      vsync: this, // Required for animation (from SingleTickerProviderStateMixin)
      initialIndex: 0, // Starting tab
    );

    // Listen to tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Tab animation completed
        print('Tab changed to: ${_tabController.index}');
      }
    });
  }

  @override
  void dispose() {
    // IMPORTANT: Always dispose the controller
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom TabController'),
        backgroundColor: Colors.teal,
        bottom: TabBar(
          controller: _tabController, // Attach custom controller
          tabs: const [
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Calls'),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Same controller for TabBarView
        children: const [
          Center(child: Text('Chats Content', style: TextStyle(fontSize: 24))),
          Center(child: Text('Status Content', style: TextStyle(fontSize: 24))),
          Center(child: Text('Calls Content', style: TextStyle(fontSize: 24))),
        ],
      ),
      // Floating action button to change tabs programmatically
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Move to next tab with animation
          int nextIndex = (_tabController.index + 1) % 3;
          _tabController.animateTo(nextIndex);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

// ===========================================================================
// EXAMPLE 3: Scrollable TabBar (Many Tabs)
// ===========================================================================
class ScrollableTabBarExample extends StatelessWidget {
  const ScrollableTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10, // Many tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scrollable Tabs'),
          backgroundColor: Colors.deepOrange,
          bottom: TabBar(
            isScrollable: true, // Enable horizontal scrolling
            tabAlignment: TabAlignment.start, // Align tabs to start
            tabs: List.generate(
              10,
              (index) => Tab(text: 'Category ${index + 1}'),
            ),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black87,
          ),
        ),
        body: TabBarView(
          children: List.generate(
            10,
            (index) => Center(
              child: Text(
                'Content for Category ${index + 1}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ===========================================================================
// EXAMPLE 4: Custom Styled TabBar
// ===========================================================================
class StyledTabBarExample extends StatelessWidget {
  const StyledTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Styled TabBar'),
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            // Custom rounded indicator
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            indicatorPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            // Label colors
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            // Splash effect
            splashBorderRadius: BorderRadius.circular(50),
            // Tabs
            tabs: const [
              Tab(text: 'Photos'),
              Tab(text: 'Videos'),
              Tab(text: 'Music'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Icon(Icons.photo, size: 100, color: Colors.blue)),
            Center(child: Icon(Icons.videocam, size: 100, color: Colors.red)),
            Center(child: Icon(Icons.music_note, size: 100, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

// ===========================================================================
// EXAMPLE 5: TabBar NOT in AppBar (Body TabBar)
// ===========================================================================
class BodyTabBarExample extends StatelessWidget {
  const BodyTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar in Body'),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [
            // Some content above TabBar
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.pink.shade50,
              child: const Text(
                'TabBar can be placed anywhere, not just in AppBar!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),

            // TabBar in the body
            Container(
              color: Colors.pink,
              child: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car), text: 'Car'),
                  Tab(icon: Icon(Icons.directions_transit), text: 'Transit'),
                  Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.white,
              ),
            ),

            // TabBarView takes remaining space
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Car directions', style: TextStyle(fontSize: 24))),
                  Center(child: Text('Transit routes', style: TextStyle(fontSize: 24))),
                  Center(child: Text('Bike paths', style: TextStyle(fontSize: 24))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===========================================================================
// EXAMPLE 6: TabBar with Badges
// ===========================================================================
class TabBarWithBadgesExample extends StatelessWidget {
  const TabBarWithBadgesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabs with Badges'),
          backgroundColor: Colors.indigo,
          bottom: TabBar(
            tabs: [
              const Tab(text: 'Messages'),
              // Tab with badge
              Tab(
                child: Badge(
                  label: const Text('5'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Notifications'),
                  ),
                ),
              ),
              const Tab(text: 'Settings'),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Messages')),
            Center(child: Text('Notifications')),
            Center(child: Text('Settings')),
          ],
        ),
      ),
    );
  }
}

// ===========================================================================
// MAIN DEMO - Shows all examples
// ===========================================================================
class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Examples'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Choose an Example:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Example buttons
          _buildExampleButton(
            context,
            'Basic TabBar (DefaultTabController)',
            const TabBarWidget(),
            Colors.indigo,
          ),
          _buildExampleButton(
            context,
            'Custom TabController',
            const CustomTabControllerExample(),
            Colors.teal,
          ),
          _buildExampleButton(
            context,
            'Scrollable TabBar (Many Tabs)',
            const ScrollableTabBarExample(),
            Colors.deepOrange,
          ),
          _buildExampleButton(
            context,
            'Styled TabBar (Custom Indicator)',
            const StyledTabBarExample(),
            Colors.grey.shade900,
          ),
          _buildExampleButton(
            context,
            'TabBar in Body',
            const BodyTabBarExample(),
            Colors.pink,
          ),
          _buildExampleButton(
            context,
            'TabBar with Badges',
            const TabBarWithBadgesExample(),
            Colors.indigo,
          ),
        ],
      ),
    );
  }

  Widget _buildExampleButton(
    BuildContext context,
    String title,
    Widget page,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
