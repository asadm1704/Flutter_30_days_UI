/*
 * ============================================================================
 * TRAVEL PROFILE UI - Instagram/Pinterest Style Clone
 * ============================================================================
 * 
 * This UI demonstrates:
 * 1. Profile page with stats (Created, Attended, Followers)
 * 2. Grid/List view toggle for photos
 * 3. Detail page with hero image and engagement stats
 * 4. Bottom navigation bar
 * 5. Beautiful card layouts with shadows and rounded corners
 * 
 * Key Widgets Used:
 * - CircleAvatar: For profile pictures
 * - GridView: For photo grid layout
 * - Stack: For overlaying elements
 * - BottomNavigationBar: For navigation
 * - Hero: For smooth page transitions
 * 
 * ============================================================================
 */

import 'package:flutter/material.dart';

class TravelProfileUI extends StatefulWidget {
  const TravelProfileUI({Key? key}) : super(key: key);

  @override
  State<TravelProfileUI> createState() => _TravelProfileUIState();
}

class _TravelProfileUIState extends State<TravelProfileUI> {
  int _selectedIndex = 2; // Profile tab selected
  bool _isGridView = true;

  // Sample travel images (using placeholder URLs)
  final List<Map<String, String>> _travelPosts = [
    {
      'image':
          'https://images.unsplash.com/photo-1534430480872-3498386e7856?w=400',
      'title': 'Madrid city tour for designers',
      'tags': 'city, madrid, españa, designers, ui, ux, travel',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400',
      'title': 'Tokyo Night Lights',
      'tags': 'japan, tokyo, night, lights, travel',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400',
      'title': 'Paris Eiffel Tower',
      'tags': 'paris, france, eiffel, romantic',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=400',
      'title': 'Sydney Opera House',
      'tags': 'sydney, australia, opera, architecture',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=400',
      'title': 'Dubai Skyline',
      'tags': 'dubai, uae, skyline, modern',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1518684079-3c830dcef090?w=400',
      'title': 'Venice Canals',
      'tags': 'venice, italy, canals, romantic',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=400',
      'title': 'San Francisco Bridge',
      'tags': 'san francisco, usa, bridge, iconic',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=400',
      'title': 'New York City',
      'tags': 'nyc, usa, city, urban',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1505761671935-60b3a7427bad?w=400',
      'title': 'London Eye',
      'tags': 'london, uk, eye, landmark',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            _buildProfileHeader(),

            const SizedBox(height: 16),

            // Stats Section
            _buildStatsSection(),

            const SizedBox(height: 16),

            // View Toggle Section
            _buildViewToggle(),

            const SizedBox(height: 8),

            // Photo Grid/List
            _isGridView ? _buildPhotoGrid() : _buildPhotoList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite, color: Colors.redAccent),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black87),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // Profile Picture with blue dot indicator
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 3),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 4,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.9),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          // Name
          const Text(
            'Asad Wazir',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 4),

          // Subtitle
          Text(
            'Ceo & Founder EasyFood',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('23', 'Created'),
          _buildDivider(),
          _buildStatItem('398', 'Attended'),
          _buildDivider(),
          _buildStatItem('936', 'Followers'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(height: 30, width: 1, color: Colors.grey[300]);
  }

  Widget _buildViewToggle() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => setState(() => _isGridView = true),
            child: Icon(
              Icons.grid_view,
              color: _isGridView ? Colors.black87 : Colors.grey[400],
              size: 26,
            ),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () => setState(() => _isGridView = false),
            child: Icon(
              Icons.view_list,
              color: !_isGridView ? Colors.black87 : Colors.grey[400],
              size: 26,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(2.5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: _travelPosts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _openDetailPage(index),
            child: Hero(
              tag: 'image_$index',
              child: Image.network(
                _travelPosts[index]['image']!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, color: Colors.grey),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhotoList() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _travelPosts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _openDetailPage(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Hero(
                    tag: 'image_$index',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        _travelPosts[index]['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _travelPosts[index]['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _travelPosts[index]['tags']!,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _openDetailPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TravelDetailPage(
          post: _travelPosts[index],
          heroTag: 'image_$index',
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// DETAIL PAGE - Shows full post with engagement stats
// ============================================================================

class TravelDetailPage extends StatelessWidget {
  final Map<String, String> post;
  final String heroTag;

  const TravelDetailPage({Key? key, required this.post, required this.heroTag})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image with overlay
            _buildHeroImage(context),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    post['title']!,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Tags
                  Text(
                    post['tags']!,
                    style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                  ),

                  const SizedBox(height: 20),

                  // Engagement Stats
                  _buildEngagementStats(),

                  const SizedBox(height: 24),

                  // Description
                  _buildDescription(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroImage(BuildContext context) {
    return Stack(
      children: [
        // Main Image
        Hero(
          tag: heroTag,
          child: Image.network(
            post['image']!,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
        ),

        // Gradient Overlay
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
              ),
            ),
          ),
        ),

        // Back Button
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 8,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // Favorite Button
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          right: 8,
          child: IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {},
          ),
        ),

        // Profile Avatar
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEngagementStats() {
    return Row(
      children: [
        _buildStatIcon(Icons.favorite_border, '20'),
        const SizedBox(width: 20),
        _buildStatIcon(Icons.share_outlined, '34'),
        const SizedBox(width: 20),
        _buildStatIcon(Icons.chat_bubble_outline, '82'),
        const SizedBox(width: 20),
        _buildStatIcon(Icons.emoji_emotions_outlined, '295'),
      ],
    );
  }

  Widget _buildStatIcon(IconData icon, String count) {
    return Row(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 4),
        Icon(icon, size: 18, color: Colors.grey[600]),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      'Leo ruled for only a few years. Later, Henry III of Castile (1379-1406) rebuilt the city after it was destroyed by fire, and founded El Pardo just outside its walls. The kingdom of Castile controlled the city until the death of King Henry IV of Castile, when the kingdom of Aragon disputed the succession. The marriage of Ferdinand and Isabella united the Crowns of Castile and Aragon. The kingdoms of Castile and Aragón.',
      style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.6),
    );
  }
}
