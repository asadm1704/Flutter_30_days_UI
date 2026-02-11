import 'package:flutter/material.dart';

// ============================================================================
// BOTTOM NAVIGATION BAR - BEGINNER'S GUIDE
// ============================================================================
//
// WHAT IS BOTTOM NAVIGATION BAR?
// ------------------------------
// A BottomNavigationBar is a material widget that displays at the bottom of
// the screen. It allows users to quickly navigate between top-level views
// (screens/pages) in an app with a single tap.
//
// WHEN TO USE IT?
// ---------------
// - When you have 3 to 5 top-level destinations
// - When these destinations need direct access from anywhere in the app
// - Common examples: Home, Search, Profile, Settings, Notifications
//
// KEY PROPERTIES:
// ---------------
// 1. items (required): List of BottomNavigationBarItem widgets (minimum 2)
//    - icon: The icon to display (required)
//    - label: The text label below the icon (required)
//    - activeIcon: Different icon when selected (optional)
//    - backgroundColor: Background color for shifting type (optional)
//
// 2. currentIndex: The index of the currently selected item (default: 0)
//
// 3. onTap: Callback function when an item is tapped
//    - Receives the index of the tapped item
//    - Use setState() to update currentIndex
//
// 4. type: How the items are displayed
//    - BottomNavigationBarType.fixed: All items visible (default for ≤3 items)
//    - BottomNavigationBarType.shifting: Selected item is larger with animation
//
// 5. selectedItemColor: Color of the selected item's icon and label
//
// 6. unselectedItemColor: Color of unselected items
//
// 7. backgroundColor: Background color of the navigation bar
//
// 8. elevation: Shadow depth beneath the navigation bar
//
// 9. iconSize: Size of all icons (default: 24.0)
//
// 10. selectedFontSize: Font size when item is selected (default: 14.0)
//
// 11. unselectedFontSize: Font size when item is not selected (default: 12.0)
//
// 12. showSelectedLabels: Whether to show labels for selected items (default: true)
//
// 13. showUnselectedLabels: Whether to show labels for unselected items
//
// ============================================================================

class BottomNev extends StatefulWidget {
  const BottomNev({super.key});

  @override
  State<BottomNev> createState() => _BottomNevState();
}

class _BottomNevState extends State<BottomNev> {
  // This variable keeps track of which tab/page is currently selected
  // Index 0 = Home, Index 1 = Business, Index 2 = School
  int selectedIndex = 0;

  // List of pages/screens to display when each tab is selected
  // Each index corresponds to a BottomNavigationBarItem
  static const List<Widget> _pages = <Widget>[
    // Page 0: Home Screen
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'HOME PAGE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Welcome to the Home section!'),
        ],
      ),
    ),
    // Page 1: Business Screen
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.business, size: 80, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'BUSINESS PAGE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Explore business content here!'),
        ],
      ),
    ),
    // Page 2: School Screen
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 80, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            'SCHOOL PAGE',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Learn something new today!'),
        ],
      ),
    ),
  ];

  // This function is called when user taps on a navigation item
  // It updates the selectedIndex and rebuilds the widget
  void onItemTapped(int index) {
    setState(() {
      // Update the selected index to show the corresponding page
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---- APP BAR ----
      appBar: AppBar(
        title: const Text('Bottom Navigation Example'),
        backgroundColor: Theme.of(context).primaryColor,
      ),

      // ---- BODY ----
      // Display the page that corresponds to the selected index
      body: _pages[selectedIndex],

      // ---- BOTTOM NAVIGATION BAR ----
      bottomNavigationBar: BottomNavigationBar(
        // REQUIRED: List of navigation items (minimum 2, maximum 5 recommended)
        items: const <BottomNavigationBarItem>[
          // Item 0: Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), // Icon when NOT selected
            activeIcon: Icon(Icons.home), // Icon when selected (optional)
            label: 'Home', // Text label below the icon
          ),
          // Item 1: Business
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined),
            activeIcon: Icon(Icons.business),
            label: 'Business',
          ),
          // Item 2: School
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'School',
          ),
        ],

        // Currently selected item index (connects to our state variable)
        currentIndex: selectedIndex,

        // Callback when an item is tapped
        onTap: onItemTapped,

        // COLOR PROPERTIES
        selectedItemColor: Colors.blue, // Color when item is selected
        unselectedItemColor: Colors.grey, // Color when item is not selected
        backgroundColor: Colors.white, // Background color of the bar
        // TYPE OF NAVIGATION BAR
        // .fixed = all items same size (good for 3-4 items)
        // .shifting = selected item grows with animation
        type: BottomNavigationBarType.fixed,

        // ICON SIZE
        iconSize: 28.0,

        // FONT SIZES
        selectedFontSize: 14.0, // Label size when selected
        unselectedFontSize: 12.0, // Label size when not selected
        // LABEL VISIBILITY
        showSelectedLabels: true, // Show label for selected item
        showUnselectedLabels: true, // Show labels for unselected items
        // ELEVATION (shadow beneath the bar)
        elevation: 8.0,
      ),
    );
  }
}
