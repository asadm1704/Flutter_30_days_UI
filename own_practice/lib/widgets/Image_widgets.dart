import 'package:flutter/material.dart';

// ============================================================================
// IMAGE WIDGET - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS THE IMAGE WIDGET?
// -------------------------
// The Image widget displays images in your Flutter app. Images can come from
// different sources: network (internet), assets (bundled with app), files
// (device storage), or memory.
//
// TYPES OF IMAGE CONSTRUCTORS:
// ----------------------------
// 1. Image.network() - Load image from URL (internet)
// 2. Image.asset() - Load image from app assets folder
// 3. Image.file() - Load image from device file system
// 4. Image.memory() - Load image from bytes in memory
//
// ============================================================================
// IMAGE.NETWORK() PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// REQUIRED PROPERTY:
// ------------------
// 1. src: String
//    - The URL of the image to load
//    - Example: 'https://example.com/image.png'
//
// SIZE PROPERTIES:
// ----------------
// 2. width: double?
//    - Width of the image widget
//    - If not set, uses image's natural width
//
// 3. height: double?
//    - Height of the image widget
//    - If not set, uses image's natural height
//
// 4. scale: double
//    - Scale factor for the image (default: 1.0)
//
// FIT PROPERTIES:
// ---------------
// 5. fit: BoxFit?
//    - How the image should fit within its container
//    - Values:
//      - BoxFit.fill: Stretch to fill (may distort)
//      - BoxFit.contain: Fit entire image, may have empty space
//      - BoxFit.cover: Cover entire area, may crop edges
//      - BoxFit.fitWidth: Fit width, may overflow/underflow height
//      - BoxFit.fitHeight: Fit height, may overflow/underflow width
//      - BoxFit.none: No resizing (center at original size)
//      - BoxFit.scaleDown: Like contain, but never larger than original
//
// 6. alignment: AlignmentGeometry
//    - How to align image within its bounds (default: Alignment.center)
//
// 7. repeat: ImageRepeat
//    - How to paint empty space if image doesn't fill bounds
//    - Values: noRepeat, repeat, repeatX, repeatY
//
// COLOR/FILTER PROPERTIES:
// ------------------------
// 8. color: Color?
//    - Color to blend with the image
//
// 9. colorBlendMode: BlendMode?
//    - How to blend color with image
//    - Example: BlendMode.multiply, BlendMode.overlay
//
// 10. filterQuality: FilterQuality
//     - Quality of image filtering when scaled
//     - Values: none, low, medium, high
//
// 11. opacity: Animation<double>?
//     - Opacity animation for the image
//
// 12. isAntiAlias: bool
//     - Whether to use anti-aliasing (default: false)
//
// LOADING/ERROR PROPERTIES:
// -------------------------
// 13. loadingBuilder: Widget Function(context, child, loadingProgress)?
//     - Custom widget to show while loading
//     - loadingProgress has bytesLoaded and expectedTotalBytes
//
// 14. errorBuilder: Widget Function(context, error, stackTrace)?
//     - Custom widget to show on error
//     - Example: Show error icon when image fails to load
//
// 15. frameBuilder: Widget Function(context, child, frame, wasSynchronouslyLoaded)?
//     - Custom widget for each frame (useful for GIFs)
//
// SEMANTIC PROPERTIES:
// --------------------
// 16. semanticLabel: String?
//     - Accessibility label for screen readers
//
// 17. excludeFromSemantics: bool
//     - If true, image is hidden from screen readers (default: false)
//
// CACHING PROPERTIES:
// -------------------
// 18. cacheWidth: int?
//     - Cache image at this width to save memory
//
// 19. cacheHeight: int?
//     - Cache image at this height to save memory
//
// 20. headers: Map<String, String>?
//     - HTTP headers to send with the request
//     - Useful for authenticated image URLs
//
// ============================================================================
// IMAGE.ASSET() PROPERTIES
// ============================================================================
//
// 1. name: String (required)
//    - Path to asset (e.g., 'assets/images/logo.png')
//
// 2. package: String?
//    - Package name if loading from a package
//
// Other properties are same as Image.network()
//
// SETUP REQUIRED:
// 1. Put images in a folder (e.g., assets/images/)
// 2. Declare in pubspec.yaml:
//    flutter:
//      assets:
//        - assets/images/
//
// ============================================================================
// DECORATIONIMAGE (For Container backgrounds)
// ============================================================================
//
// When using images as Container backgrounds, use DecorationImage:
//
// Container(
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       image: NetworkImage('url'),  // or AssetImage('path')
//       fit: BoxFit.cover,
//     ),
//   ),
// )
//
// ============================================================================

class Image_Widgets extends StatelessWidget {
  const Image_Widgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Widget Examples'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // EXAMPLE 1: Basic Network Image
            // ==============================================================
            const Text(
              '1. Basic Network Image',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Load image from internet URL:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Basic Image.network
            Center(
              child: Image.network(
                // Image URL
                'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                // Set size
                width: 150,
                height: 150,
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 2: Image with Loading & Error Handling
            // ==============================================================
            const Text(
              '2. Image with Loading & Error Handling',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Show loading indicator and error handling:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                  // How image fits in the container
                  fit: BoxFit.cover,

                  // Loading Builder - shows while image is loading
                  loadingBuilder: (context, child, loadingProgress) {
                    // If loading is complete, show the image
                    if (loadingProgress == null) return child;

                    // Show loading indicator with progress
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            // Show progress if available
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                          const SizedBox(height: 10),
                          const Text('Loading...'),
                        ],
                      ),
                    );
                  },

                  // Error Builder - shows if image fails to load
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 50,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 3: BoxFit Options
            // ==============================================================
            const Text(
              '3. BoxFit Options',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Different ways to fit image in container:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // BoxFit.contain
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade300,
                      child: Image.network(
                        'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                        // Contain: fit entire image, may have empty space
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('contain', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // BoxFit.cover
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade300,
                      child: Image.network(
                        'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                        // Cover: fill container, may crop edges
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('cover', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // BoxFit.fill
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade300,
                      child: Image.network(
                        'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                        // Fill: stretch to fill (may distort)
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('fill', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 4: Image with Color Blend
            // ==============================================================
            const Text(
              '4. Image with Color Blend',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Apply color overlay to images:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Original
                Column(
                  children: [
                    Image.network(
                      'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                      width: 80,
                      height: 80,
                    ),
                    const Text('Original', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // With blue color blend
                Column(
                  children: [
                    Image.network(
                      'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                      width: 80,
                      height: 80,
                      // Color to blend
                      color: Colors.blue,
                      // How to blend
                      colorBlendMode: BlendMode.modulate,
                    ),
                    const Text('Blue Tint', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // Greyscale
                Column(
                  children: [
                    Image.network(
                      'https://freepngimg.com/thumb/doraemon/35165-2-doraemon-hd-thumb.png',
                      width: 80,
                      height: 80,
                      color: Colors.grey,
                      colorBlendMode: BlendMode.saturation,
                    ),
                    const Text('Greyscale', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 5: Circular Image (Avatar Style)
            // ==============================================================
            const Text(
              '5. Circular Image (Avatar Style)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using ClipOval or CircleAvatar for circular images:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Method 1: ClipOval
                Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://i.pravatar.cc/150?img=3',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('ClipOval', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // Method 2: CircleAvatar
                const Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'),
                    ),
                    SizedBox(height: 4),
                    Text('CircleAvatar', style: TextStyle(fontSize: 12)),
                  ],
                ),

                // Method 3: Container with decoration
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: NetworkImage('https://i.pravatar.cc/150?img=7'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.blue, width: 3),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('Container', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ==============================================================
            // EXAMPLE 6: Image in Container Background
            // ==============================================================
            const Text(
              '6. Image as Container Background',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Using DecorationImage for background images:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // Image as background
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1506905925346-21bda4d32df4',
                  ),
                  fit: BoxFit.cover,
                  // Optional color filter
                  colorFilter: ColorFilter.mode(
                    Colors.black38,
                    BlendMode.darken,
                  ),
                ),
              ),
              // Content on top of image
              alignment: Alignment.center,
              child: const Text(
                'Text Over Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('• Always add errorBuilder to handle failed loads'),
                  Text('• Use loadingBuilder to show loading indicator'),
                  Text('• BoxFit.cover is best for filling containers'),
                  Text('• Use CircleAvatar for profile pictures'),
                  Text('• ClipRRect for rounded corners on images'),
                  Text('• Declare asset images in pubspec.yaml'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
