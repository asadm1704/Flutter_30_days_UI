import 'package:flutter/material.dart';

// ============================================================================
// DRAWER WIDGET - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS A DRAWER?
// -----------------
// A Drawer is a panel that slides in from the edge of the screen (usually left).
// It's commonly used for navigation menus, settings, or user profile access.
// Think of it as a hidden side menu in apps like Gmail, YouTube, or Facebook!
//
// HOW TO USE A DRAWER:
// --------------------
// Add the drawer property to a Scaffold widget:
//   Scaffold(
//     drawer: Drawer(...),      // Left drawer (default)
//     endDrawer: Drawer(...),   // Right drawer
//   )
//
// HOW TO OPEN/CLOSE:
// ------------------
// Open:
//   - Swipe from the edge of the screen
//   - Tap the hamburger menu icon (if you have one)
//   - Programmatically: Scaffold.of(context).openDrawer()
//
// Close:
//   - Swipe back
//   - Tap outside the drawer
//   - Tap back button
//   - Programmatically: Navigator.pop(context)
//
// ============================================================================
// DRAWER WIDGET PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// 1. child: Widget?
//    - The content inside the drawer
//    - Usually a Column, ListView, or SafeArea with menu items
//
// 2. backgroundColor: Color?
//    - Background color of the drawer
//    - Example: backgroundColor: Colors.blue
//
// 3. elevation: double?
//    - Shadow depth of the drawer (default: 16.0)
//
// 4. shadowColor: Color?
//    - Color of the drawer's shadow
//
// 5. surfaceTintColor: Color?
//    - Tint color applied to the surface (Material 3)
//
// 6. shape: ShapeBorder?
//    - Shape of the drawer
//    - Example: shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   bottomRight: Radius.circular(20)))
//
// 7. width: double?
//    - Width of the drawer
//    - Default: depends on screen size (usually 304 logical pixels)
//
// 8. semanticLabel: String?
//    - Accessibility label for screen readers
//
// 9. clipBehavior: Clip?
//    - How to clip the drawer's content
//
// ============================================================================
// DRAWER HEADER WIDGET PROPERTIES
// ============================================================================
//
// DrawerHeader is a convenient widget for the top section of a Drawer.
//
// 1. child: Widget (required)
//    - Content of the header (avatar, name, email, etc.)
//
// 2. decoration: Decoration?
//    - Background decoration (color, image, gradient)
//    - Example: decoration: BoxDecoration(color: Colors.blue)
//
// 3. padding: EdgeInsetsGeometry
//    - Padding inside the header (default: EdgeInsets.fromLTRB(16, 16, 16, 8))
//
// 4. margin: EdgeInsetsGeometry
//    - Margin around the header (default: EdgeInsets.only(bottom: 8))
//
// 5. duration: Duration
//    - Animation duration for decoration changes
//
// 6. curve: Curve
//    - Animation curve for decoration changes
//
// ============================================================================
// USERACCOUNTSDRAWERHEADER WIDGET PROPERTIES
// ============================================================================
//
// UserAccountsDrawerHeader is a specialized header for showing user info.
//
// 1. currentAccountPicture: Widget?
//    - Main profile picture (usually CircleAvatar)
//
// 2. otherAccountsPictures: List<Widget>?
//    - Smaller pictures for other accounts
//
// 3. accountName: Widget? (required if onDetailsPressed is null)
//    - Widget showing user's name
//
// 4. accountEmail: Widget? (required if onDetailsPressed is null)
//    - Widget showing user's email
//
// 5. onDetailsPressed: VoidCallback?
//    - Callback when details arrow is pressed
//
// 6. decoration: Decoration?
//    - Background decoration
//
// 7. margin: EdgeInsetsGeometry
//    - Margin around the header
//
// 8. arrowColor: Color?
//    - Color of the dropdown arrow
//
// ============================================================================
// LISTTILE FOR DRAWER MENU ITEMS
// ============================================================================
//
// ListTile is commonly used for drawer menu items.
//
// Key properties:
// - leading: Widget? - Icon at the start
// - title: Widget? - Main text
// - subtitle: Widget? - Secondary text
// - trailing: Widget? - Widget at the end
// - onTap: VoidCallback? - Action when tapped
// - selected: bool - If this item is selected
// - selectedColor: Color? - Color when selected
// - selectedTileColor: Color? - Background when selected
//
// ============================================================================
// COMMON DRAWER PATTERNS
// ============================================================================
//
// Pattern 1: Basic Navigation Drawer
// -----------------------------------
// Drawer(
//   child: ListView(
//     children: [
//       DrawerHeader(child: Text('Menu')),
//       ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: () {}),
//       ListTile(leading: Icon(Icons.settings), title: Text('Settings'), onTap: () {}),
//     ],
//   ),
// )
//
// Pattern 2: With User Account Header
// ------------------------------------
// Drawer(
//   child: ListView(
//     children: [
//       UserAccountsDrawerHeader(
//         currentAccountPicture: CircleAvatar(child: Text('A')),
//         accountName: Text('Asad'),
//         accountEmail: Text('asad@email.com'),
//       ),
//       ListTile(...),
//     ],
//   ),
// )
//
// ============================================================================

class Drawer_ extends StatefulWidget {
  const Drawer_({super.key});

  @override
  State<Drawer_> createState() => _Drawer_State();
}

class _Drawer_State extends State<Drawer_> {
  // Track which menu item is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==================================================================
      // DRAWER - The side navigation panel
      // ==================================================================
      drawer: Drawer(
        // Elevation adds shadow depth
        elevation: 12,

        // Shape with rounded corners on right side
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),

        // Drawer content
        child: Container(
          // Gradient background decoration
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigo.shade900, Colors.blue.shade600],
            ),
          ),

          // SafeArea prevents content from overlapping system UI
          child: SafeArea(
            child: Column(
              children: [
                // ============================================================
                // DRAWER HEADER - User info section at top
                // ============================================================
                DrawerHeader(
                  // Header background decoration
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.shade400.withOpacity(0.9),
                        Colors.indigo.shade800.withOpacity(0.9),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),

                  // Header content - Stack for positioning badge
                  child: Stack(
                    children: [
                      // Badge at top right
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified,
                                color: Colors.lightGreenAccent,
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Pro Member',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // User info - avatar, name, email
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Avatar with ring decoration
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.15),
                            ),
                            child: const CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=3',
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          // User name
                          const Text(
                            'Asad Wazir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // User email
                          const Text(
                            'asad@example.com',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ============================================================
                // MENU ITEMS - Navigation options
                // ============================================================
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    // Apply consistent styling to all ListTiles
                    child: ListTileTheme(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      dense: true,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          // Menu Item 1: Home
                          _buildMenuItem(
                            index: 0,
                            icon: Icons.home_outlined,
                            selectedIcon: Icons.home,
                            title: 'Home',
                            onTap: () => _onMenuItemTap(0),
                          ),

                          // Menu Item 2: Profile
                          _buildMenuItem(
                            index: 1,
                            icon: Icons.person_outline,
                            selectedIcon: Icons.person,
                            title: 'Profile',
                            onTap: () => _onMenuItemTap(1),
                          ),

                          // Menu Item 3: Settings
                          _buildMenuItem(
                            index: 2,
                            icon: Icons.settings_outlined,
                            selectedIcon: Icons.settings,
                            title: 'Settings',
                            onTap: () => _onMenuItemTap(2),
                          ),

                          // Menu Item 4: Contact Us
                          _buildMenuItem(
                            index: 3,
                            icon: Icons.contact_mail_outlined,
                            selectedIcon: Icons.contact_mail,
                            title: 'Contact Us',
                            onTap: () => _onMenuItemTap(3),
                          ),

                          // Menu Item 5: About
                          _buildMenuItem(
                            index: 4,
                            icon: Icons.info_outline,
                            selectedIcon: Icons.info,
                            title: 'About',
                            onTap: () => _onMenuItemTap(4),
                          ),

                          // Divider before sign out
                          const Divider(
                            color: Colors.white24,
                            height: 24,
                            thickness: 1,
                          ),

                          // Sign out button (special styling)
                          ListTile(
                            leading: const Icon(
                              Icons.logout,
                              color: Colors.redAccent,
                            ),
                            title: const Text(
                              'Sign out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: Colors.redAccent,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            onTap: () {
                              // Close drawer
                              Navigator.pop(context);
                              // Show sign out confirmation
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sign out tapped!'),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ============================================================
                // FOOTER - App version or other info
                // ============================================================
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'App Version 1.0.0',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ==================================================================
      // APP BAR - Top bar with menu button
      // ==================================================================
      appBar: AppBar(
        title: const Text('Drawer Widget Example'),
        backgroundColor: Colors.indigo,
        // The drawer icon (hamburger menu) is added automatically
        // when Scaffold has a drawer
      ),

      // ==================================================================
      // BODY - Main content
      // ==================================================================
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.swipe_right, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Swipe from left edge\nor tap the menu icon',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Button to open drawer programmatically
            ElevatedButton.icon(
              icon: const Icon(Icons.menu),
              label: const Text('Open Drawer'),
              onPressed: () {
                // Open drawer programmatically
                Scaffold.of(context).openDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build menu items
  Widget _buildMenuItem({
    required int index,
    required IconData icon,
    required IconData selectedIcon,
    required String title,
    required VoidCallback onTap,
  }) {
    final isSelected = selectedIndex == index;

    return ListTile(
      leading: Icon(
        isSelected ? selectedIcon : icon,
        color: isSelected ? Colors.lightBlueAccent : Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.lightBlueAccent : Colors.white,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: isSelected ? Colors.lightBlueAccent : Colors.white70,
      ),
      selected: isSelected,
      selectedTileColor: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onTap: onTap,
    );
  }

  // Handle menu item tap
  void _onMenuItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    // Close the drawer
    Navigator.pop(context);
    // Show feedback
    final menuNames = ['Home', 'Profile', 'Settings', 'Contact Us', 'About'];
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigated to ${menuNames[index]}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
