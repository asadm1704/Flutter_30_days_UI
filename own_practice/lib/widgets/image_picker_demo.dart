/*
 * ============================================================================
 * IMAGE PICKER PACKAGE - COMPLETE DOCUMENTATION
 * ============================================================================
 * 
 * Package: image_picker
 * Purpose: A Flutter plugin for iOS and Android for picking images/videos 
 *          from the image library, and taking new photos/videos with the camera.
 * 
 * ============================================================================
 * MAIN CLASS: ImagePicker
 * ============================================================================
 * 
 * The ImagePicker class is the main entry point for picking images and videos.
 * 
 * METHODS:
 * --------
 * 
 * 1. pickImage({required ImageSource source, ...})
 *    - Returns: Future<XFile?>
 *    - Purpose: Pick a single image from gallery or camera
 *    - Parameters:
 *      • source (required): ImageSource.gallery or ImageSource.camera
 *      • maxWidth: Maximum width of the image (in pixels)
 *      • maxHeight: Maximum height of the image (in pixels)
 *      • imageQuality: Quality of the image (0-100, where 100 is original quality)
 *      • preferredCameraDevice: CameraDevice.front or CameraDevice.rear
 *      • requestFullMetadata: Whether to request full metadata (default: true)
 * 
 * 2. pickMultiImage({...})
 *    - Returns: Future<List<XFile>>
 *    - Purpose: Pick multiple images from gallery
 *    - Parameters:
 *      • maxWidth: Maximum width of each image
 *      • maxHeight: Maximum height of each image
 *      • imageQuality: Quality of images (0-100)
 *      • limit: Maximum number of images to pick
 *      • requestFullMetadata: Whether to request full metadata
 * 
 * 3. pickVideo({required ImageSource source, ...})
 *    - Returns: Future<XFile?>
 *    - Purpose: Pick a video from gallery or record from camera
 *    - Parameters:
 *      • source (required): ImageSource.gallery or ImageSource.camera
 *      • preferredCameraDevice: CameraDevice.front or CameraDevice.rear
 *      • maxDuration: Maximum duration of the video
 * 
 * 4. pickMedia({...})
 *    - Returns: Future<XFile?>
 *    - Purpose: Pick either image or video from gallery
 *    - Parameters: Similar to pickImage
 * 
 * 5. pickMultipleMedia({...})
 *    - Returns: Future<List<XFile>>
 *    - Purpose: Pick multiple images and/or videos from gallery
 * 
 * ============================================================================
 * ENUMS
 * ============================================================================
 * 
 * ImageSource:
 *   • ImageSource.camera - Opens the device camera
 *   • ImageSource.gallery - Opens the device gallery/photo library
 * 
 *   Definition:
 *   ```dart
 *   enum ImageSource {
 *     /// Opens the device camera to capture a new image or video.
 *     camera,
 *     
 *     /// Opens the device gallery/photo library to select an existing image or video.
 *     gallery,
 *   }
 *   ```
 * 
 * CameraDevice:
 *   • CameraDevice.front - Uses front-facing camera
 *   • CameraDevice.rear - Uses rear-facing camera (default)
 * 
 *   Definition:
 *   ```dart
 *   enum CameraDevice {
 *     /// The rear/back-facing camera of the device.
 *     /// This is the default camera used when not specified.
 *     rear,
 *     
 *     /// The front-facing/selfie camera of the device.
 *     front,
 *   }
 *   ```
 * 
 * ============================================================================
 * XFile CLASS (Return Type)
 * ============================================================================
 * 
 * Properties:
 *   • path: String - The file path of the picked file
 *   • name: String - The name of the file
 *   • mimeType: String? - The MIME type of the file
 * 
 * Methods:
 *   • readAsBytes(): Future<Uint8List> - Read file as bytes
 *   • readAsString(): Future<String> - Read file as string
 *   • length(): Future<int> - Get file size in bytes
 *   • lastModified(): Future<DateTime> - Get last modified date
 *   • openRead(): Stream<Uint8List> - Read file as stream
 * 
 * ============================================================================
 * PLATFORM CONFIGURATION
 * ============================================================================
 * 
 * ANDROID (android/app/src/main/AndroidManifest.xml):
 *   No additional configuration needed for API 29+ (scoped storage)
 *   For older APIs, add:
 *   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
 *   <uses-permission android:name="android.permission.CAMERA"/>
 * 
 * iOS (ios/Runner/Info.plist):
 *   <key>NSPhotoLibraryUsageDescription</key>
 *   <string>We need access to your photo library to pick images</string>
 *   <key>NSCameraUsageDescription</key>
 *   <string>We need access to your camera to take photos</string>
 *   <key>NSMicrophoneUsageDescription</key>
 *   <string>We need access to your microphone for video recording</string>
 * 
 * ============================================================================
 * BEST PRACTICES
 * ============================================================================
 * 
 * 1. Always handle null returns (user can cancel selection)
 * 2. Use imageQuality to reduce file size for uploads
 * 3. Use maxWidth/maxHeight to limit image dimensions
 * 4. Handle permissions gracefully with user-friendly messages
 * 5. Consider using try-catch for error handling
 * 6. For large images, consider showing loading indicators
 * 
 * ============================================================================
 */

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({Key? key}) : super(key: key);

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  // Instance of ImagePicker
  final ImagePicker _picker = ImagePicker();

  // Store picked image
  XFile? _selectedImage;

  // Store multiple picked images
  List<XFile> _selectedImages = [];

  // Store picked video
  XFile? _selectedVideo;

  // Loading state
  bool _isLoading = false;

  // Pick single image from gallery
  Future<void> _pickImageFromGallery() async {
    setState(() => _isLoading = true);

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800, // Limit width to 1800 pixels
        maxHeight: 1800, // Limit height to 1800 pixels
        imageQuality: 85, // 85% quality (reduces file size)
        requestFullMetadata: true, // Get full EXIF metadata
      );

      if (image != null) {
        setState(() {
          _selectedImage = image;
          _selectedImages = [];
          _selectedVideo = null;
        });
        _showImageInfo(image);
      }
    } catch (e) {
      _showErrorSnackBar('Failed to pick image: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Pick single image from camera
  Future<void> _pickImageFromCamera() async {
    setState(() => _isLoading = true);

    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear, // Use back camera
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = image;
          _selectedImages = [];
          _selectedVideo = null;
        });
        _showImageInfo(image);
      }
    } catch (e) {
      _showErrorSnackBar('Failed to capture image: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Pick multiple images from gallery
  Future<void> _pickMultipleImages() async {
    setState(() => _isLoading = true);

    try {
      final List<XFile> images = await _picker.pickMultiImage(
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 80,
        limit: 10, // Maximum 10 images
      );

      if (images.isNotEmpty) {
        setState(() {
          _selectedImages = images;
          _selectedImage = null;
          _selectedVideo = null;
        });
        _showSnackBar('Selected ${images.length} images');
      }
    } catch (e) {
      _showErrorSnackBar('Failed to pick images: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Pick video from gallery
  Future<void> _pickVideoFromGallery() async {
    setState(() => _isLoading = true);

    try {
      final XFile? video = await _picker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: const Duration(minutes: 5), // Max 5 minutes
      );

      if (video != null) {
        setState(() {
          _selectedVideo = video;
          _selectedImage = null;
          _selectedImages = [];
        });
        _showSnackBar('Video selected: ${video.name}');
      }
    } catch (e) {
      _showErrorSnackBar('Failed to pick video: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Record video from camera
  Future<void> _recordVideoFromCamera() async {
    setState(() => _isLoading = true);

    try {
      final XFile? video = await _picker.pickVideo(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        maxDuration: const Duration(seconds: 30), // Max 30 seconds
      );

      if (video != null) {
        setState(() {
          _selectedVideo = video;
          _selectedImage = null;
          _selectedImages = [];
        });
        _showSnackBar('Video recorded: ${video.name}');
      }
    } catch (e) {
      _showErrorSnackBar('Failed to record video: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Show image info dialog
  Future<void> _showImageInfo(XFile image) async {
    final int fileSize = await image.length();
    final String fileSizeStr = _formatFileSize(fileSize);

    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Image Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Name', image.name),
              _buildInfoRow('Path', image.path),
              _buildInfoRow('Size', fileSizeStr),
              if (image.mimeType != null)
                _buildInfoRow('Type', image.mimeType!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _clearSelection() {
    setState(() {
      _selectedImage = null;
      _selectedImages = [];
      _selectedVideo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          if (_selectedImage != null ||
              _selectedImages.isNotEmpty ||
              _selectedVideo != null)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _clearSelection,
              tooltip: 'Clear Selection',
            ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image Picker Section
                _buildSectionCard(
                  title: 'Pick Single Image',
                  icon: Icons.image,
                  children: [
                    _buildActionButton(
                      icon: Icons.photo_library,
                      label: 'From Gallery',
                      color: Colors.blue,
                      onPressed: _pickImageFromGallery,
                    ),
                    const SizedBox(height: 10),
                    _buildActionButton(
                      icon: Icons.camera_alt,
                      label: 'From Camera',
                      color: Colors.green,
                      onPressed: _pickImageFromCamera,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Multiple Images Section
                _buildSectionCard(
                  title: 'Pick Multiple Images',
                  icon: Icons.photo_library_outlined,
                  children: [
                    _buildActionButton(
                      icon: Icons.collections,
                      label: 'Select Multiple (Max 10)',
                      color: Colors.orange,
                      onPressed: _pickMultipleImages,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Video Picker Section
                _buildSectionCard(
                  title: 'Pick Video',
                  icon: Icons.videocam,
                  children: [
                    _buildActionButton(
                      icon: Icons.video_library,
                      label: 'From Gallery',
                      color: Colors.purple,
                      onPressed: _pickVideoFromGallery,
                    ),
                    const SizedBox(height: 10),
                    _buildActionButton(
                      icon: Icons.videocam,
                      label: 'Record Video',
                      color: Colors.red,
                      onPressed: _recordVideoFromCamera,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Display Selected Media
                if (_selectedImage != null) ...[
                  const Text(
                    'Selected Image:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(_selectedImage!.path),
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _selectedImage!.name,
                    style: TextStyle(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],

                if (_selectedImages.isNotEmpty) ...[
                  Text(
                    'Selected Images (${_selectedImages.length}):',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(_selectedImages[index].path),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ],

                if (_selectedVideo != null) ...[
                  const Text(
                    'Selected Video:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.video_file,
                            color: Colors.white,
                            size: 64,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _selectedVideo!.name,
                            style: const TextStyle(color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 50),
              ],
            ),
          ),

          // Loading Overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
