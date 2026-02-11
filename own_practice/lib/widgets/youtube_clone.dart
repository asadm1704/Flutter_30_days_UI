/*
 * ============================================================================
 * YOUTUBE CLONE - COMPLETE UI IMPLEMENTATION WITH DETAILED EXPLANATIONS
 * ============================================================================
 * 
 * This file creates a pixel-perfect YouTube clone UI in Flutter.
 * Every widget and property is explained in detail for learning purposes.
 * 
 * ============================================================================
 * WHAT YOU WILL LEARN:
 * ============================================================================
 * 
 * 1. SCAFFOLD - The skeleton/structure of the app
 *    - AppBar: The top bar with logo, search, notifications
 *    - Body: The main content area
 *    - BottomNavigationBar: Bottom tabs (Home, Shorts, Create, etc.)
 *    - Drawer: Sidebar menu (optional)
 * 
 * 2. LISTVIEW.BUILDER - For scrollable video lists
 *    - Creates items lazily (only when visible) for better performance
 *    - Infinite scroll capability
 * 
 * 3. GRIDVIEW - For channel chips/categories
 *    - Horizontal scrolling category pills
 * 
 * 4. STACK - For overlaying elements
 *    - Video duration on thumbnail
 *    - Live badges
 * 
 * 5. ROW & COLUMN - For layouts
 *    - Horizontal layout (Row)
 *    - Vertical layout (Column)
 * 
 * 6. CONTAINER - For styling and spacing
 *    - BoxDecoration for borders, colors, shadows
 *    - Padding and margin
 * 
 * 7. CIRCLEAVATAR - For profile pictures
 *    - Round profile images
 * 
 * 8. INKWELL/GESTUREDETECTOR - For tap interactions
 *    - Making widgets clickable
 * 
 * 9. NAVIGATOR - For page navigation
 *    - Push to new screens
 *    - Pop to go back
 * 
 * ============================================================================
 * YOUTUBE APP STRUCTURE:
 * ============================================================================
 * 
 * ┌─────────────────────────────────────────┐
 * │  APP BAR (YouTube logo, search, cast,   │
 * │           notifications, profile)        │
 * ├─────────────────────────────────────────┤
 * │  CATEGORY CHIPS (All, Gaming, Music...) │
 * ├─────────────────────────────────────────┤
 * │                                         │
 * │  VIDEO LIST                             │
 * │  ┌─────────────────────────────────┐   │
 * │  │  THUMBNAIL (with duration)       │   │
 * │  ├─────────────────────────────────┤   │
 * │  │ [Avatar] Title                   │   │
 * │  │          Channel • Views • Date  │   │
 * │  └─────────────────────────────────┘   │
 * │                                         │
 * │  (More videos...)                       │
 * │                                         │
 * ├─────────────────────────────────────────┤
 * │  BOTTOM NAV (Home, Shorts, +, Subs,     │
 * │              Library)                    │
 * └─────────────────────────────────────────┘
 * 
 * ============================================================================
 */

import 'package:flutter/material.dart';
import 'package:flutter_test12/functions/auth_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ============================================================================
// MAIN YOUTUBE CLONE WIDGET
// ============================================================================
// 
// This is the ENTRY POINT of our YouTube clone.
// It's a StatefulWidget because:
// - We need to track which tab is selected (Home, Shorts, etc.)
// - We need to track which category chip is selected
// - State changes trigger UI rebuilds
//
// StatelessWidget vs StatefulWidget:
// - StatelessWidget: UI doesn't change (static)
// - StatefulWidget: UI can change based on user interaction or data
// ============================================================================

class YouTubeClone extends StatefulWidget {
  const YouTubeClone({Key? key}) : super(key: key);

  @override
  State<YouTubeClone> createState() => _YouTubeCloneState();
}

class _YouTubeCloneState extends State<YouTubeClone> {
  // ============================================================================
  // STATE VARIABLES
  // ============================================================================
  // 
  // These variables store data that can CHANGE during the app's lifetime.
  // When we call setState(), Flutter rebuilds the UI with new values.
  // ============================================================================

  // Currently selected bottom navigation tab
  // 0 = Home, 1 = Shorts, 2 = Create, 3 = Subscriptions, 4 = Library
  int _selectedIndex = 0;

  // Currently selected category chip
  // 0 = All, 1 = Gaming, 2 = Music, etc.
  int _selectedCategoryIndex = 0;

  // ============================================================================
  // SAMPLE DATA - VIDEO LIST
  // ============================================================================
  // 
  // In a real app, this data would come from:
  // - YouTube API (network request)
  // - Local database (cached videos)
  // - State management (Provider, Bloc, etc.)
  // 
  // Each video has:
  // - thumbnail: URL of the video preview image
  // - title: Video title
  // - channel: Channel name
  // - channelAvatar: Profile picture URL
  // - views: View count
  // - uploadTime: When it was uploaded
  // - duration: Video length
  // ============================================================================

  final List<Map<String, dynamic>> _videos = [
    {
      'thumbnail': 'https://images.unsplash.com/photo-1611162617474-5b21e879e113?w=800',
      'title': 'Flutter Tutorial for Beginners - Build Your First App in 2024',
      'channel': 'Flutter Academy',
      'channelAvatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
      'views': '2.5M views',
      'uploadTime': '3 weeks ago',
      'duration': '24:35',
      'isLive': false,
    },
    {
      'thumbnail': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800',
      'title': 'Complete Dart Programming Course - From Zero to Hero',
      'channel': 'Code With Me',
      'channelAvatar': 'https://images.unsplash.com/photo-1599566150163-29194dcabd36?w=100',
      'views': '1.2M views',
      'uploadTime': '1 month ago',
      'duration': '3:45:20',
      'isLive': false,
    },
    {
      'thumbnail': 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800',
      'title': '🔴 LIVE: Building a Full Stack App with Flutter & Firebase',
      'channel': 'Tech Stream',
      'channelAvatar': 'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=100',
      'views': '15K watching',
      'uploadTime': 'Started 2 hours ago',
      'duration': 'LIVE',
      'isLive': true,
    },
    {
      'thumbnail': 'https://images.unsplash.com/photo-1504639725590-34d0984388bd?w=800',
      'title': 'State Management in Flutter - Provider vs Bloc vs Riverpod',
      'channel': 'Flutter Explained',
      'channelAvatar': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100',
      'views': '890K views',
      'uploadTime': '2 weeks ago',
      'duration': '18:42',
      'isLive': false,
    },
    {
      'thumbnail': 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=800',
      'title': 'Build a Beautiful UI in Flutter - Complete Design Tutorial',
      'channel': 'Design Masters',
      'channelAvatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
      'views': '567K views',
      'uploadTime': '5 days ago',
      'duration': '32:15',
      'isLive': false,
    },
    {
      'thumbnail': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800',
      'title': 'REST API Integration in Flutter - HTTP, Dio & Retrofit',
      'channel': 'Mobile Dev Pro',
      'channelAvatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
      'views': '432K views',
      'uploadTime': '1 week ago',
      'duration': '45:10',
      'isLive': false,
    },
    {
      'thumbnail': 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=800',
      'title': 'Flutter Animations Masterclass - Make Your Apps Beautiful',
      'channel': 'Animation Guru',
      'channelAvatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
      'views': '789K views',
      'uploadTime': '4 days ago',
      'duration': '1:15:30',
      'isLive': false,
    },
    {
      'thumbnail': 'https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=800',
      'title': 'Clean Architecture in Flutter - Best Practices 2024',
      'channel': 'Code Architecture',
      'channelAvatar': 'https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?w=100',
      'views': '234K views',
      'uploadTime': '2 days ago',
      'duration': '55:00',
      'isLive': false,
    },
  ];

  // ============================================================================
  // CATEGORY CHIPS DATA
  // ============================================================================
  // 
  // These are the filter pills shown below the app bar.
  // Tapping on them would filter videos by category.
  // ============================================================================

  final List<String> _categories = [
    'All',
    'Gaming',
    'Music',
    'Flutter',
    'Programming',
    'Live',
    'News',
    'Comedy',
    'Sports',
    'Education',
    'Tech',
    'Podcasts',
  ];

  // ============================================================================
  // BUILD METHOD - THE UI BLUEPRINT
  // ============================================================================
  // 
  // This method returns the widget tree that describes the UI.
  // Flutter calls this method whenever:
  // - Widget is first inserted into the tree
  // - setState() is called
  // - Parent rebuilds with different config
  // ============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ========================================================================
      // SCAFFOLD WIDGET
      // ========================================================================
      // 
      // Scaffold is the SKELETON of a material design app.
      // It provides the basic structure:
      // - appBar: Top bar
      // - body: Main content
      // - bottomNavigationBar: Bottom tabs
      // - drawer: Side menu
      // - floatingActionButton: Floating button
      // 
      // Think of it as the FRAME of a house!
      // ========================================================================

      backgroundColor: Colors.black, // YouTube dark theme background

      // APP BAR - The top bar of the app
      appBar: _buildAppBar(),

      // BODY - The main content area
      body: _buildBody(),

      // BOTTOM NAVIGATION - The tabs at the bottom
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ============================================================================
  // APP BAR BUILDER
  // ============================================================================
  // 
  // The AppBar contains:
  // - YouTube logo (left)
  // - Cast button
  // - Notifications button
  // - Search button
  // - Profile picture (right)
  // 
  // PreferredSizeWidget is used because AppBar has a preferred height.
  // ============================================================================

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      // ========================================================================
      // AppBar Properties:
      // ========================================================================
      // 
      // backgroundColor: Background color of the app bar
      // elevation: Shadow depth (0 = flat, higher = more shadow)
      // title: Main content (usually Text widget)
      // leading: Widget at the start (usually menu icon)
      // actions: List of widgets at the end (buttons)
      // centerTitle: Whether to center the title
      // ========================================================================

      backgroundColor: Colors.black,
      elevation: 0, // No shadow for flat look

      // TITLE: YouTube logo
      // We use an Image or Icon + Text combination
      title: Row(
        // ======================================================================
        // ROW WIDGET
        // ======================================================================
        // 
        // Row arranges children HORIZONTALLY (left to right).
        // 
        // MainAxisAlignment: How to distribute space horizontally
        //   - start: Pack at left
        //   - end: Pack at right
        //   - center: Pack at center
        //   - spaceBetween: Equal space between children
        //   - spaceEvenly: Equal space including edges
        //   - spaceAround: Half space at edges
        // 
        // CrossAxisAlignment: How to align vertically
        //   - start: Align to top
        //   - end: Align to bottom
        //   - center: Center vertically
        //   - stretch: Stretch to fill height
        // ======================================================================

        mainAxisSize: MainAxisSize.min, // Take minimum horizontal space
        children: [
          // YouTube Play Icon (red)
          Icon(
            Icons.play_circle_filled,
            color: Colors.red,
            size: 28,
          ),

          // SizedBox adds space between widgets
          // Think of it as an invisible box with a fixed size
          const SizedBox(width: 4),

          // YouTube Text
          const Text(
            'YouTube',
            style: TextStyle(
              // ================================================================
              // TextStyle Properties:
              // ================================================================
              // 
              // fontSize: Size of the text
              // fontWeight: How bold (normal, bold, w100-w900)
              // fontStyle: Normal or italic
              // color: Text color
              // letterSpacing: Space between letters
              // wordSpacing: Space between words
              // height: Line height multiplier
              // decoration: Underline, overline, lineThrough
              // fontFamily: Font to use
              // ================================================================

              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -1, // Slightly tighter text
            ),
          ),
        ],
      ),

      // ACTIONS: Buttons on the right side of the app bar
      actions: [
        // Cast Button (for casting to TV)
        IconButton(
          // ==================================================================
          // IconButton Properties:
          // ==================================================================
          // 
          // icon: The icon to display
          // onPressed: Callback when pressed (null = disabled)
          // tooltip: Text shown on long press
          // color: Icon color
          // iconSize: Size of the icon
          // splashRadius: Size of the splash effect
          // padding: Padding around the icon
          // ==================================================================

          icon: const Icon(Icons.cast, color: Colors.white),
          onPressed: () {
            // Show a message when cast is pressed
            _showSnackBar('Cast to device');
          },
          tooltip: 'Cast',
        ),

        // Notifications Button
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.white),
          onPressed: () {
            _showSnackBar('Notifications');
          },
          tooltip: 'Notifications',
        ),

        // Search Button
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Navigate to search page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const YouTubeSearchPage()),
            );
          },
          tooltip: 'Search',
        ),

        // Profile Picture
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            // ================================================================
            // GestureDetector vs InkWell
            // ================================================================
            // 
            // GestureDetector: Detects gestures without visual feedback
            //   - onTap, onDoubleTap, onLongPress
            //   - onPanUpdate (dragging)
            //   - onScaleUpdate (pinch zoom)
            // 
            // InkWell: Detects taps WITH ripple effect (Material design)
            //   - Has splash and highlight colors
            //   - Better for buttons
            // 
            // Use GestureDetector when you don't want visual feedback.
            // Use InkWell for standard Material buttons.
            // ================================================================

            onTap: () {
              _showProfileOptions();
            },
            child: StreamBuilder<User?>(
              stream: AuthFunctions.authStateChanges(),
              builder: (context, snapshot) {
                final user = snapshot.data;
                return CircleAvatar(
                  // ==============================================================
                  // CircleAvatar Properties:
                  // ==============================================================
                  // 
                  // radius: Size of the circle
                  // backgroundColor: Background color
                  // backgroundImage: Image to display
                  // foregroundColor: Color for text/icon
                  // child: Widget to display inside (usually Text or Icon)
                  // 
                  // For images, use:
                  //   NetworkImage('url') - From internet
                  //   AssetImage('path') - From assets folder
                  //   FileImage(file) - From device storage
                  // ==============================================================

                  radius: 15,
                  backgroundColor: Colors.grey[800],
                  backgroundImage: user?.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : const NetworkImage(
                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
                        ),
                  child: user == null
                      ? const Icon(Icons.person, size: 18, color: Colors.white)
                      : null,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================================
  // BODY BUILDER - Main Content Area
  // ============================================================================
  // 
  // The body contains:
  // 1. Category chips (horizontal scrolling list)
  // 2. Video list (vertical scrolling list)
  // 
  // We use a Column to stack them vertically.
  // ============================================================================

  Widget _buildBody() {
    return Column(
      // ========================================================================
      // COLUMN WIDGET
      // ========================================================================
      // 
      // Column arranges children VERTICALLY (top to bottom).
      // 
      // It's the opposite of Row!
      // - Row = Horizontal layout
      // - Column = Vertical layout
      // 
      // Same alignment properties as Row:
      // - mainAxisAlignment: Vertical distribution
      // - crossAxisAlignment: Horizontal alignment
      // ========================================================================

      children: [
        // Category Chips (horizontal scrolling)
        _buildCategoryChips(),

        // Divider line
        Container(
          height: 1,
          color: Colors.grey[900],
        ),

        // Video List (takes remaining space)
        // Expanded makes a widget take all available space in Column/Row
        Expanded(
          child: _buildVideoList(),
        ),
      ],
    );
  }

  // ============================================================================
  // CATEGORY CHIPS BUILDER
  // ============================================================================
  // 
  // Horizontal scrolling list of filter chips.
  // Uses ListView with horizontal scroll direction.
  // ============================================================================

  Widget _buildCategoryChips() {
    return Container(
      // ========================================================================
      // CONTAINER WIDGET
      // ========================================================================
      // 
      // Container is the MOST VERSATILE widget in Flutter!
      // It can have:
      // - Size (width, height)
      // - Padding (inside spacing)
      // - Margin (outside spacing)
      // - Decoration (color, border, shadow, gradient)
      // - Transform (rotate, scale, translate)
      // - Alignment (position child)
      // 
      // Think of it as a customizable box!
      // ========================================================================

      height: 50,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: ListView.builder(
        // ======================================================================
        // ListView.builder - LAZY LIST BUILDER
        // ======================================================================
        // 
        // Creates items ONLY when they're visible on screen.
        // This is MUCH more efficient than creating all items at once!
        // 
        // scrollDirection: Which way to scroll
        //   - Axis.vertical (default)
        //   - Axis.horizontal
        // 
        // itemCount: Total number of items
        // itemBuilder: Function that builds each item
        // padding: Padding around the entire list
        // ======================================================================

        scrollDirection: Axis.horizontal, // Scroll left-right
        itemCount: _categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          // Is this chip currently selected?
          final isSelected = _selectedCategoryIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                // Update selected category
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  // ============================================================
                  // BoxDecoration Properties:
                  // ============================================================
                  // 
                  // color: Background color
                  // border: Border around the container
                  // borderRadius: Rounded corners
                  // boxShadow: Drop shadows
                  // gradient: Color gradients
                  // image: Background image
                  // shape: BoxShape.circle or BoxShape.rectangle
                  // ============================================================

                  color: isSelected ? Colors.white : Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================================
  // VIDEO LIST BUILDER
  // ============================================================================
  // 
  // Vertical scrolling list of video cards.
  // Each card has:
  // - Thumbnail image with duration overlay
  // - Channel avatar
  // - Video title
  // - Channel name, views, upload time
  // - More options button
  // ============================================================================

  Widget _buildVideoList() {
    return ListView.builder(
      // padding: Space around the entire list
      padding: const EdgeInsets.only(top: 8),

      // itemCount: How many videos to show
      itemCount: _videos.length,

      // itemBuilder: How to build each video card
      itemBuilder: (context, index) {
        // Get the video data for this index
        final video = _videos[index];

        return _buildVideoCard(video, index);
      },
    );
  }

  // ============================================================================
  // VIDEO CARD BUILDER
  // ============================================================================
  // 
  // A single video card with all its components.
  // This is the main content of YouTube!
  // ============================================================================

  Widget _buildVideoCard(Map<String, dynamic> video, int index) {
    return InkWell(
      // ========================================================================
      // InkWell - Tappable with Ripple Effect
      // ========================================================================
      // 
      // InkWell creates a Material ripple effect when tapped.
      // This is the standard way to make things tappable in Material Design.
      // 
      // Properties:
      // - onTap: Callback when tapped
      // - onLongPress: Callback when long pressed
      // - onDoubleTap: Callback when double tapped
      // - splashColor: Color of the ripple
      // - highlightColor: Color when held down
      // ========================================================================

      onTap: () {
        // Navigate to video player page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YouTubeVideoPlayer(video: video),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // THUMBNAIL with duration overlay
            _buildThumbnail(video),

            // VIDEO INFO section
            _buildVideoInfo(video),
          ],
        ),
      ),
    );
  }

  // ============================================================================
  // THUMBNAIL BUILDER
  // ============================================================================
  // 
  // The video thumbnail with:
  // - Main image
  // - Duration badge (or LIVE badge)
  // - Progress bar (optional)
  // 
  // Uses STACK to overlay the duration on the image.
  // ============================================================================

  Widget _buildThumbnail(Map<String, dynamic> video) {
    return Stack(
      // ========================================================================
      // STACK WIDGET
      // ========================================================================
      // 
      // Stack OVERLAYS widgets on top of each other!
      // Think of it like layers in Photoshop.
      // 
      // The FIRST child is at the BOTTOM.
      // The LAST child is at the TOP.
      // 
      // Use Positioned widget to place children at specific locations:
      //   Positioned(
      //     top: 10,
      //     right: 10,
      //     child: ...
      //   )
      // 
      // alignment: Where to align non-positioned children
      // fit: How children should be sized
      //   - StackFit.loose: Children use their own size
      //   - StackFit.expand: Children expand to fill stack
      // ========================================================================

      children: [
        // BOTTOM LAYER: Thumbnail Image
        AspectRatio(
          // ==================================================================
          // AspectRatio Widget
          // ==================================================================
          // 
          // Forces a widget to have a specific aspect ratio (width/height).
          // 
          // 16/9 = Standard widescreen video ratio
          // 4/3 = Old TV ratio
          // 1/1 = Square
          // 9/16 = Phone portrait (YouTube Shorts)
          // ==================================================================

          aspectRatio: 16 / 9,
          child: Image.network(
            video['thumbnail'],
            fit: BoxFit.cover, // Cover the entire area
            // ================================================================
            // BoxFit Values:
            // ================================================================
            // 
            // - fill: Stretch to fill (may distort)
            // - contain: Fit inside, maintain ratio (may have gaps)
            // - cover: Cover entire area, maintain ratio (may crop)
            // - fitWidth: Fit width, maintain ratio
            // - fitHeight: Fit height, maintain ratio
            // - none: Original size
            // - scaleDown: Like contain, but only scales down
            // ================================================================

            // Show loading indicator while image loads
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[900],
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.red,
                  ),
                ),
              );
            },
            // Show placeholder if image fails to load
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(Icons.error, color: Colors.grey),
                ),
              );
            },
          ),
        ),

        // TOP LAYER: Duration Badge
        Positioned(
          // Position at bottom-right corner
          bottom: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: video['isLive'] ? Colors.red : Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              video['duration'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        // LIVE indicator (if live)
        if (video['isLive'])
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.sensors, color: Colors.white, size: 14),
                  SizedBox(width: 4),
                  Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  // ============================================================================
  // VIDEO INFO BUILDER
  // ============================================================================
  // 
  // Shows the channel avatar, title, and metadata.
  // Layout:
  // [Avatar] [Title and metadata] [More options]
  // ============================================================================

  Widget _buildVideoInfo(Map<String, dynamic> video) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Row(
        // Align items to the top
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CHANNEL AVATAR
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[800],
            backgroundImage: NetworkImage(video['channelAvatar']),
          ),

          const SizedBox(width: 12),

          // TITLE AND METADATA
          // Expanded takes remaining horizontal space
          Expanded(
            // ================================================================
            // Expanded Widget
            // ================================================================
            // 
            // Expands to fill available space in Row/Column.
            // 
            // flex: How much space to take relative to other Expanded widgets
            //   - Default is 1
            //   - If two Expanded have flex: 1, they share space 50-50
            //   - If one has flex: 2, it gets twice as much space
            // ================================================================

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // VIDEO TITLE
                Text(
                  video['title'],
                  maxLines: 2, // Maximum 2 lines
                  overflow: TextOverflow.ellipsis, // Show ... if too long
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.3, // Line height
                  ),
                ),

                const SizedBox(height: 4),

                // CHANNEL NAME • VIEWS • TIME
                Text(
                  '${video['channel']} • ${video['views']} • ${video['uploadTime']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // MORE OPTIONS BUTTON (three dots)
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 20),
            onPressed: () {
              _showVideoOptions(video);
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  // ============================================================================
  // BOTTOM NAVIGATION BUILDER
  // ============================================================================
  // 
  // The bottom tab bar with:
  // - Home
  // - Shorts
  // - Create (+)
  // - Subscriptions
  // - Library
  // ============================================================================

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      // ========================================================================
      // BottomNavigationBar Properties:
      // ========================================================================
      // 
      // items: List of BottomNavigationBarItem (min 2)
      // currentIndex: Currently selected tab
      // onTap: Callback when tab is tapped
      // type: fixed or shifting
      // backgroundColor: Background color
      // selectedItemColor: Color when selected
      // unselectedItemColor: Color when not selected
      // showSelectedLabels: Show label when selected
      // showUnselectedLabels: Show label when not selected
      // iconSize: Size of icons
      // elevation: Shadow depth
      // ========================================================================

      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        
        // Show which tab was selected
        final tabs = ['Home', 'Shorts', 'Create', 'Subscriptions', 'Library'];
        if (index != 0) {
          _showSnackBar('${tabs[index]} tab selected');
        }
      },
      type: BottomNavigationBarType.fixed, // All items same size
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        // HOME TAB
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home_filled),
          label: 'Home',
        ),

        // SHORTS TAB
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          activeIcon: Icon(Icons.video_library),
          label: 'Shorts',
        ),

        // CREATE TAB (the plus button in the middle)
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline, size: 40),
          activeIcon: Icon(Icons.add_circle, size: 40),
          label: '',
        ),

        // SUBSCRIPTIONS TAB
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions_outlined),
          activeIcon: Icon(Icons.subscriptions),
          label: 'Subscriptions',
        ),

        // LIBRARY TAB
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_outlined),
          activeIcon: Icon(Icons.video_library),
          label: 'Library',
        ),
      ],
    );
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  // Show a snackbar message
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.grey[800],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // Show profile options - Login/Signup or Account info
  void _showProfileOptions() {
    final user = AuthFunctions.getCurrentUser();

    if (user != null) {
      // User is logged in - show account options
      _showAccountOptions(user);
    } else {
      // User is not logged in - show login dialog
      showAuthDialog(context);
    }
  }

  // Show account options for logged-in user
  void _showAccountOptions(User user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // User info header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[800],
                      backgroundImage: user.photoURL != null
                          ? NetworkImage(user.photoURL!)
                          : null,
                      child: user.photoURL == null
                          ? const Icon(Icons.person, size: 30, color: Colors.white)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.displayName ?? 'User',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user.email ?? '',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                          if (!user.emailVerified)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  Icon(Icons.warning, color: Colors.orange[400], size: 14),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Email not verified',
                                    style: TextStyle(
                                      color: Colors.orange[400],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Colors.grey),

              // Account options
              _buildAccountOptionTile(Icons.person_outline, 'Your channel'),
              _buildAccountOptionTile(Icons.history, 'Watch history'),
              _buildAccountOptionTile(Icons.download_outlined, 'Downloads'),
              _buildAccountOptionTile(Icons.subscriptions_outlined, 'Your subscriptions'),
              
              const Divider(color: Colors.grey),

              // Sign out button
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Sign out', style: TextStyle(color: Colors.red)),
                onTap: () async {
                  Navigator.pop(context);
                  final result = await AuthFunctions.signOut();
                  if (result == true) {
                    _showSnackBar('Signed out successfully');
                  } else {
                    _showSnackBar(result.toString());
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Build account option tile
  Widget _buildAccountOptionTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        _showSnackBar(title);
      },
    );
  }

  // Show video options bottom sheet
  void _showVideoOptions(Map<String, dynamic> video) {
    showModalBottomSheet(
      // ========================================================================
      // showModalBottomSheet
      // ========================================================================
      // 
      // Shows a modal sheet that slides up from the bottom.
      // 
      // context: BuildContext for the sheet
      // builder: Function that builds the sheet content
      // backgroundColor: Background color
      // shape: Shape of the sheet (for rounded corners)
      // isScrollControlled: If true, sheet can be full screen
      // enableDrag: If true, can drag to dismiss
      // ========================================================================

      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Video info at top
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    video['thumbnail'],
                    width: 80,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  video['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                subtitle: Text(
                  video['channel'],
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ),

              const Divider(color: Colors.grey),

              // Options list
              _buildOptionTile(Icons.access_time, 'Save to Watch later'),
              _buildOptionTile(Icons.playlist_add, 'Save to playlist'),
              _buildOptionTile(Icons.download_outlined, 'Download video'),
              _buildOptionTile(Icons.share, 'Share'),
              _buildOptionTile(Icons.block, 'Not interested'),
              _buildOptionTile(Icons.flag_outlined, 'Report'),
            ],
          ),
        );
      },
    );
  }

  // Build a single option tile for the bottom sheet
  Widget _buildOptionTile(IconData icon, String title) {
    return ListTile(
      // ========================================================================
      // ListTile Widget
      // ========================================================================
      // 
      // A single fixed-height row with optional leading, title, and trailing.
      // Great for lists of options!
      // 
      // Properties:
      // - leading: Widget at the start (usually icon or avatar)
      // - title: Primary content
      // - subtitle: Secondary content below title
      // - trailing: Widget at the end
      // - onTap: Callback when tapped
      // - contentPadding: Padding around content
      // - dense: If true, uses less vertical space
      // ========================================================================

      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context); // Close the bottom sheet
        _showSnackBar(title);
      },
    );
  }
}


// ============================================================================
// SEARCH PAGE
// ============================================================================
// 
// A separate page for searching videos.
// Demonstrates navigation and TextField usage.
// ============================================================================

class YouTubeSearchPage extends StatefulWidget {
  const YouTubeSearchPage({Key? key}) : super(key: key);

  @override
  State<YouTubeSearchPage> createState() => _YouTubeSearchPageState();
}

class _YouTubeSearchPageState extends State<YouTubeSearchPage> {
  // Controller for the search text field
  final TextEditingController _searchController = TextEditingController();

  // Recent searches (sample data)
  final List<String> _recentSearches = [
    'Flutter tutorial',
    'Dart programming',
    'Build apps',
    'UI design',
    'State management',
  ];

  @override
  void dispose() {
    // Always dispose controllers when done!
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        // Back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        // Search TextField
        title: TextField(
          // ====================================================================
          // TextField Widget
          // ====================================================================
          // 
          // A text input field.
          // 
          // Properties:
          // - controller: TextEditingController to get/set text
          // - decoration: InputDecoration for styling
          // - style: TextStyle for the input text
          // - onChanged: Callback when text changes
          // - onSubmitted: Callback when Enter is pressed
          // - autofocus: If true, focuses automatically
          // - keyboardType: Type of keyboard to show
          // ====================================================================

          controller: _searchController,
          autofocus: true, // Auto-focus when page opens
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Search YouTube',
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Searching for: $value')),
              );
            }
          },
        ),

        // Voice search button
        actions: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Voice search')),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _recentSearches.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history, color: Colors.grey),
            title: Text(
              _recentSearches[index],
              style: const TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.north_west, color: Colors.grey),
              onPressed: () {
                _searchController.text = _recentSearches[index];
              },
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Searching: ${_recentSearches[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}


// ============================================================================
// VIDEO PLAYER PAGE
// ============================================================================
// 
// The page that plays a video.
// Shows video player, title, channel info, and comments.
// ============================================================================

class YouTubeVideoPlayer extends StatelessWidget {
  final Map<String, dynamic> video;

  const YouTubeVideoPlayer({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        // ======================================================================
        // SafeArea Widget
        // ======================================================================
        // 
        // Ensures content doesn't overlap with system UI (notch, status bar).
        // Always wrap your main content in SafeArea for proper display!
        // 
        // Properties:
        // - top: Avoid top inset (default: true)
        // - bottom: Avoid bottom inset (default: true)
        // - left: Avoid left inset
        // - right: Avoid right inset
        // ======================================================================

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // VIDEO PLAYER AREA
            _buildVideoPlayer(context),

            // SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                // ==============================================================
                // SingleChildScrollView
                // ==============================================================
                // 
                // Makes a single widget scrollable.
                // Use when you have content that might overflow the screen.
                // 
                // For lists, use ListView instead (more efficient).
                // ==============================================================

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video Title
                    _buildVideoTitle(),

                    // Channel Info
                    _buildChannelInfo(),

                    // Action Buttons (Like, Dislike, Share, etc.)
                    _buildActionButtons(),

                    // Divider
                    Divider(color: Colors.grey[800], height: 32),

                    // Comments Section
                    _buildCommentsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Stack(
      children: [
        // Video thumbnail (in real app, this would be a video player)
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            video['thumbnail'],
            fit: BoxFit.cover,
          ),
        ),

        // Play button overlay
        Positioned.fill(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 48,
              ),
            ),
          ),
        ),

        // Back button
        Positioned(
          top: 8,
          left: 8,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // Minimize button
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // Video controls overlay (at bottom)
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              children: [
                // Progress bar
                LinearProgressIndicator(
                  value: 0.3, // 30% watched
                  backgroundColor: Colors.grey[700],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                const SizedBox(height: 4),
                // Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '7:23',
                      style: TextStyle(color: Colors.grey[300], fontSize: 12),
                    ),
                    Text(
                      video['duration'],
                      style: TextStyle(color: Colors.grey[300], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoTitle() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video['title'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${video['views']} • ${video['uploadTime']}',
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(video['channelAvatar']),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video['channel'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '2.5M subscribers',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Subscribe'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _buildActionButton(Icons.thumb_up_outlined, '45K'),
            _buildActionButton(Icons.thumb_down_outlined, 'Dislike'),
            _buildActionButton(Icons.share, 'Share'),
            _buildActionButton(Icons.download_outlined, 'Download'),
            _buildActionButton(Icons.content_cut, 'Clip'),
            _buildActionButton(Icons.playlist_add, 'Save'),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Comments header
          Row(
            children: [
              const Text(
                'Comments',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '1.2K',
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Sample comment
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=100',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@user123 • 2 hours ago',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'This tutorial is amazing! Finally understood Flutter properly. Thanks for the great content! 🔥',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.thumb_up_outlined, color: Colors.grey[400], size: 16),
                        const SizedBox(width: 4),
                        Text('234', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        const SizedBox(width: 16),
                        Icon(Icons.thumb_down_outlined, color: Colors.grey[400], size: 16),
                        const SizedBox(width: 16),
                        Text('Reply', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 100), // Extra space at bottom
        ],
      ),
    );
  }
}
