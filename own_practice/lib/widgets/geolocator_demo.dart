/*
 * ============================================================================
 * GEOLOCATOR PACKAGE - COMPLETE DOCUMENTATION (Easy Explanation)
 * ============================================================================
 * 
 * Package: geolocator
 * Purpose: A Flutter plugin to easily get the device's current location 
 *          (latitude, longitude) and track location changes in real-time.
 * 
 * Think of it like: A GPS system for your Flutter app that tells you 
 *                   exactly where the user is on Earth!
 * 
 * ============================================================================
 * ⚠️ REQUIRED PERMISSIONS (MUST ADD THESE FOR GEOLOCATOR TO WORK!)
 * ============================================================================
 * 
 * Geolocator needs 3 main permissions to work properly:
 * 
 * 1. ACCESS_FINE_LOCATION (Precise/Exact Location)
 *    - What it does: Gives you GPS-level accuracy (within 1-10 meters)
 *    - When to use: Navigation apps, finding nearby places
 *    - Easy: "I need to know EXACTLY where you are"
 * 
 * 2. ACCESS_COARSE_LOCATION (Approximate Location)
 *    - What it does: Gives you rough location (within 100+ meters)
 *    - When to use: Weather apps, city-level features
 *    - Easy: "I just need to know which area you're in"
 * 
 * 3. ACCESS_BACKGROUND_LOCATION (Location when app is closed)
 *    - What it does: Tracks location even when app is in background
 *    - When to use: Fitness trackers, delivery tracking, navigation
 *    - Easy: "I need to track you even when you're not using the app"
 *    - Note: This requires extra approval on Play Store!
 * 
 * ---------------------------------------------------------
 * ANDROID: Add to android/app/src/main/AndroidManifest.xml
 * ---------------------------------------------------------
 * Add these lines inside the <manifest> tag (before <application>):
 * 
 * ```xml
 * <!-- Permission 1: Precise location (GPS) -->
 * <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
 * 
 * <!-- Permission 2: Approximate location (Network/WiFi) -->
 * <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
 * 
 * <!-- Permission 3: Background location (OPTIONAL - only if needed) -->
 * <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
 * ```
 * 
 * ---------------------------------------------------------
 * iOS: Add to ios/Runner/Info.plist
 * ---------------------------------------------------------
 * Add these lines inside the <dict> tag:
 * 
 * ```xml
 * <!-- Permission 1: Location when app is open -->
 * <key>NSLocationWhenInUseUsageDescription</key>
 * <string>We need your location to show nearby places</string>
 * 
 * <!-- Permission 2: Location always (background) -->
 * <key>NSLocationAlwaysUsageDescription</key>
 * <string>We need your location to track your journey</string>
 * 
 * <!-- Permission 3: Both when in use and always -->
 * <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
 * <string>We need your location for navigation features</string>
 * ```
 * 
 * ============================================================================
 * WHAT CAN GEOLOCATOR DO?
 * ============================================================================
 * 
 * 1. Get current location (Where am I right now?)
 * 2. Track location in real-time (Follow me as I move)
 * 3. Calculate distance between two points (How far is it?)
 * 4. Check if location services are enabled
 * 5. Request location permissions from user
 * 
 * ============================================================================
 * MAIN CLASS: Geolocator
 * ============================================================================
 * 
 * The Geolocator class is like a helper that does all the location work.
 * 
 * KEY METHODS (Functions you can use):
 * ------------------------------------
 * 
 * 1. getCurrentPosition()
 *    - What it does: Gets your current location RIGHT NOW
 *    - Returns: Position object (contains latitude, longitude, etc.)
 *    - Example: Like asking "Where am I standing right now?"
 * 
 * 2. getLastKnownPosition()
 *    - What it does: Gets the last saved location (faster, but might be old)
 *    - Returns: Position? (can be null if no previous location)
 *    - Example: Like checking your last known address
 * 
 * 3. getPositionStream()
 *    - What it does: Continuously tracks your location as you move
 *    - Returns: Stream<Position> (keeps sending new locations)
 *    - Example: Like a GPS navigation that updates as you drive
 * 
 * 4. isLocationServiceEnabled()
 *    - What it does: Checks if GPS/Location is turned ON on the device
 *    - Returns: true or false
 *    - Example: "Is the GPS switch turned on?"
 * 
 * 5. checkPermission()
 *    - What it does: Checks if the app has permission to use location
 *    - Returns: LocationPermission (denied, allowed, etc.)
 *    - Example: "Did the user say YES to location access?"
 * 
 * 6. requestPermission()
 *    - What it does: Shows a popup asking user for location permission
 *    - Returns: LocationPermission (what the user chose)
 *    - Example: Shows "Allow this app to access your location?"
 * 
 * 7. openLocationSettings()
 *    - What it does: Opens the phone's location settings page
 *    - Returns: true if settings opened successfully
 *    - Example: Takes user to Settings > Location
 * 
 * 8. openAppSettings()
 *    - What it does: Opens this app's settings page
 *    - Returns: true if settings opened successfully
 *    - Example: Takes user to Settings > Apps > Your App
 * 
 * 9. distanceBetween(lat1, lon1, lat2, lon2)
 *    - What it does: Calculates distance between two points
 *    - Returns: Distance in METERS (double)
 *    - Example: "How far is the restaurant from my home?"
 * 
 * 10. bearingBetween(lat1, lon1, lat2, lon2)
 *     - What it does: Calculates the direction/angle between two points
 *     - Returns: Bearing in DEGREES (0-360)
 *     - Example: "Which direction should I face to reach there?"
 * 
 * ============================================================================
 * POSITION CLASS (The Location Data)
 * ============================================================================
 * 
 * When you get a location, you receive a Position object with these properties:
 * 
 * MAIN PROPERTIES:
 * ----------------
 * 
 * • latitude (double)
 *   - What: North-South position on Earth
 *   - Range: -90 to +90
 *   - Example: 37.7749 (San Francisco)
 *   - Easy: "How far up or down on the map"
 * 
 * • longitude (double)
 *   - What: East-West position on Earth
 *   - Range: -180 to +180
 *   - Example: -122.4194 (San Francisco)
 *   - Easy: "How far left or right on the map"
 * 
 * • accuracy (double)
 *   - What: How accurate the location is (in METERS)
 *   - Example: 10.0 means "within 10 meters of actual location"
 *   - Easy: Lower number = More accurate
 * 
 * • altitude (double)
 *   - What: Height above sea level (in METERS)
 *   - Example: 100.0 means 100 meters above sea
 *   - Easy: "How high up am I?"
 * 
 * • altitudeAccuracy (double)
 *   - What: How accurate the altitude reading is
 *   - Easy: Lower number = More accurate height
 * 
 * • speed (double)
 *   - What: How fast you're moving (in METERS PER SECOND)
 *   - Example: 5.0 means walking speed (~18 km/h)
 *   - Easy: "How fast am I going?"
 * 
 * • speedAccuracy (double)
 *   - What: How accurate the speed reading is
 *   - Easy: Lower number = More accurate speed
 * 
 * • heading (double)
 *   - What: Direction you're facing/moving (in DEGREES)
 *   - Range: 0-360 (0=North, 90=East, 180=South, 270=West)
 *   - Easy: "Which direction am I looking?"
 * 
 * • headingAccuracy (double)
 *   - What: How accurate the heading/direction is
 *   - Easy: Lower number = More accurate direction
 * 
 * • timestamp (DateTime)
 *   - What: When this location was recorded
 *   - Easy: "What time was this location captured?"
 * 
 * • isMocked (bool)
 *   - What: Is this a fake/simulated location?
 *   - Easy: true = Someone is faking their location
 * 
 * ============================================================================
 * ENUMS (Options you can choose from)
 * ============================================================================
 * 
 * LocationPermission:
 * -------------------
 * Tells you what permission level the app has:
 * 
 * ```dart
 * enum LocationPermission {
 *   /// User said NO and we can't ask again
 *   deniedForever,
 *   
 *   /// User said NO (but we can ask again)
 *   denied,
 *   
 *   /// User said YES, but only when app is open
 *   whileInUse,
 *   
 *   /// User said YES for all the time (even in background)
 *   always,
 *   
 *   /// We haven't asked yet
 *   unableToDetermine,
 * }
 * ```
 * 
 * LocationAccuracy:
 * -----------------
 * How precise do you want the location to be?
 * 
 * ```dart
 * enum LocationAccuracy {
 *   /// Very rough location (city level) - Uses less battery
 *   lowest,
 *   
 *   /// Rough location (~10km accuracy)
 *   low,
 *   
 *   /// Medium accuracy (~100m-500m)
 *   medium,
 *   
 *   /// Good accuracy (~10m-100m)
 *   high,
 *   
 *   /// Best possible accuracy (~1m-10m) - Uses more battery
 *   best,
 *   
 *   /// Best for navigation apps
 *   bestForNavigation,
 *   
 *   /// Reduced accuracy for privacy (iOS 14+)
 *   reduced,
 * }
 * ```
 * 
 * ============================================================================
 * LOCATION SETTINGS
 * ============================================================================
 * 
 * LocationSettings:
 * -----------------
 * Configure how location updates work:
 * 
 * • accuracy: How precise (LocationAccuracy enum)
 * • distanceFilter: Minimum distance (meters) before new update
 *   - Example: 10 means only update if moved 10+ meters
 * • timeLimit: Maximum time to wait for location
 * 
 * AndroidSettings (Android-specific):
 * -----------------------------------
 * • intervalDuration: How often to check (Duration)
 * • forceLocationManager: Use older location API
 * • useMSLAltitude: Use mean sea level for altitude
 * 
 * AppleSettings (iOS-specific):
 * -----------------------------
 * • pauseLocationUpdatesAutomatically: Save battery when not moving
 * • showBackgroundLocationIndicator: Show blue bar in status
 * • allowBackgroundLocationUpdates: Work in background
 * 
 * ============================================================================
 * PLATFORM SETUP (VERY IMPORTANT!)
 * ============================================================================
 * 
 * ANDROID Setup (android/app/src/main/AndroidManifest.xml):
 * ---------------------------------------------------------
 * Add these permissions inside <manifest> tag:
 * 
 * ```xml
 * <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
 * <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
 * 
 * <!-- If you need background location (optional): -->
 * <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
 * ```
 * 
 * iOS Setup (ios/Runner/Info.plist):
 * -----------------------------------
 * Add these inside <dict> tag:
 * 
 * ```xml
 * <key>NSLocationWhenInUseUsageDescription</key>
 * <string>We need your location to show nearby places</string>
 * 
 * <key>NSLocationAlwaysUsageDescription</key>
 * <string>We need your location to track your journey</string>
 * 
 * <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
 * <string>We need your location for navigation</string>
 * ```
 * 
 * ============================================================================
 * COMMON USE CASES
 * ============================================================================
 * 
 * 1. "Show my current location on a map"
 *    → Use getCurrentPosition()
 * 
 * 2. "Track delivery driver in real-time"
 *    → Use getPositionStream()
 * 
 * 3. "Find restaurants near me"
 *    → Use getCurrentPosition() + distanceBetween()
 * 
 * 4. "Calculate distance for a running app"
 *    → Use getPositionStream() + distanceBetween()
 * 
 * 5. "Show compass direction"
 *    → Use Position.heading or bearingBetween()
 * 
 * ============================================================================
 * BEST PRACTICES (Tips for Good Code)
 * ============================================================================
 * 
 * 1. ALWAYS check if location services are enabled first
 * 2. ALWAYS request permission before getting location
 * 3. Handle all permission cases (denied, denied forever, etc.)
 * 4. Use appropriate accuracy (don't use "best" if you don't need it)
 * 5. Set distanceFilter to avoid too many updates
 * 6. Cancel position stream when not needed (saves battery!)
 * 7. Show loading indicator while getting location
 * 8. Handle errors gracefully with try-catch
 * 
 * ============================================================================
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorDemo extends StatefulWidget {
  const GeolocatorDemo({Key? key}) : super(key: key);

  @override
  State<GeolocatorDemo> createState() => _GeolocatorDemoState();
}

class _GeolocatorDemoState extends State<GeolocatorDemo> {
  // Store current position
  Position? _currentPosition;

  // Store permission status
  LocationPermission? _permission;

  // Loading state
  bool _isLoading = false;

  // Error message
  String? _errorMessage;

  // Stream subscription for tracking
  StreamSubscription<Position>? _positionStreamSubscription;

  // Is tracking active?
  bool _isTracking = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  @override
  void dispose() {
    // IMPORTANT: Cancel stream when widget is disposed
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  // Step 1: Check if location services are enabled
  Future<bool> _checkLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _errorMessage = 'Location services are disabled. Please enable GPS.';
      });
      return false;
    }
    return true;
  }

  // Step 2: Check and request permission
  Future<bool> _checkPermission() async {
    _permission = await Geolocator.checkPermission();

    if (_permission == LocationPermission.denied) {
      // Ask for permission
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        setState(() {
          _errorMessage = 'Location permission denied. Please allow access.';
        });
        return false;
      }
    }

    if (_permission == LocationPermission.deniedForever) {
      setState(() {
        _errorMessage =
            'Location permission permanently denied. Please enable in settings.';
      });
      return false;
    }

    setState(() {
      _errorMessage = null;
    });
    return true;
  }

  // Get current position (one-time)
  Future<void> _getCurrentPosition() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Check if location service is enabled
      if (!await _checkLocationService()) {
        setState(() => _isLoading = false);
        return;
      }

      // Check permission
      if (!await _checkPermission()) {
        setState(() => _isLoading = false);
        return;
      }

      // Get current position with high accuracy
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );

      setState(() {
        _currentPosition = position;
        _isLoading = false;
      });

      _showSnackBar('Location retrieved successfully!');
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to get location: $e';
        _isLoading = false;
      });
    }
  }

  // Get last known position (faster but might be old)
  Future<void> _getLastKnownPosition() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      Position? position = await Geolocator.getLastKnownPosition();

      if (position != null) {
        setState(() {
          _currentPosition = position;
          _isLoading = false;
        });
        _showSnackBar('Last known location retrieved!');
      } else {
        setState(() {
          _errorMessage = 'No last known position available';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to get last known location: $e';
        _isLoading = false;
      });
    }
  }

  // Start tracking location (real-time)
  void _startTracking() async {
    if (!await _checkLocationService()) return;
    if (!await _checkPermission()) return;

    setState(() {
      _isTracking = true;
      _errorMessage = null;
    });

    // Configure location settings
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // Update every 10 meters
    );

    // Start listening to position stream
    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen(
      (Position position) {
        setState(() {
          _currentPosition = position;
        });
      },
      onError: (error) {
        setState(() {
          _errorMessage = 'Tracking error: $error';
          _isTracking = false;
        });
      },
    );

    _showSnackBar('Location tracking started!');
  }

  // Stop tracking location
  void _stopTracking() {
    _positionStreamSubscription?.cancel();
    setState(() {
      _isTracking = false;
    });
    _showSnackBar('Location tracking stopped!');
  }

  // Calculate distance between current position and a target
  void _calculateDistance() {
    if (_currentPosition == null) {
      _showErrorSnackBar('Get your location first!');
      return;
    }

    // Example: Distance to Eiffel Tower (Paris)
    const double targetLat = 48.8584;
    const double targetLon = 2.2945;

    double distanceInMeters = Geolocator.distanceBetween(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      targetLat,
      targetLon,
    );

    double distanceInKm = distanceInMeters / 1000;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Distance to Eiffel Tower'),
        content: Text(
          'You are ${distanceInKm.toStringAsFixed(2)} km away from the Eiffel Tower in Paris!',
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

  // Open location settings
  Future<void> _openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  // Open app settings
  Future<void> _openAppSettings() async {
    await Geolocator.openAppSettings();
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

  String _getDirectionFromHeading(double heading) {
    if (heading >= 337.5 || heading < 22.5) return 'North';
    if (heading >= 22.5 && heading < 67.5) return 'North-East';
    if (heading >= 67.5 && heading < 112.5) return 'East';
    if (heading >= 112.5 && heading < 157.5) return 'South-East';
    if (heading >= 157.5 && heading < 202.5) return 'South';
    if (heading >= 202.5 && heading < 247.5) return 'South-West';
    if (heading >= 247.5 && heading < 292.5) return 'West';
    return 'North-West';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocator Demo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Permission Status Card
                _buildPermissionCard(),

                const SizedBox(height: 16),

                // Error Message
                if (_errorMessage != null) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error, color: Colors.red),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Get Location Section
                _buildSectionCard(
                  title: 'Get Location',
                  icon: Icons.my_location,
                  children: [
                    _buildActionButton(
                      icon: Icons.location_on,
                      label: 'Get Current Position',
                      color: Colors.blue,
                      onPressed: _getCurrentPosition,
                    ),
                    const SizedBox(height: 10),
                    _buildActionButton(
                      icon: Icons.history,
                      label: 'Get Last Known Position',
                      color: Colors.orange,
                      onPressed: _getLastKnownPosition,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Tracking Section
                _buildSectionCard(
                  title: 'Real-Time Tracking',
                  icon: Icons.track_changes,
                  children: [
                    _buildActionButton(
                      icon: _isTracking ? Icons.stop : Icons.play_arrow,
                      label: _isTracking ? 'Stop Tracking' : 'Start Tracking',
                      color: _isTracking ? Colors.red : Colors.green,
                      onPressed: _isTracking ? _stopTracking : _startTracking,
                    ),
                    if (_isTracking)
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Tracking active...',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                // Distance Section
                _buildSectionCard(
                  title: 'Distance Calculator',
                  icon: Icons.straighten,
                  children: [
                    _buildActionButton(
                      icon: Icons.calculate,
                      label: 'Distance to Eiffel Tower',
                      color: Colors.purple,
                      onPressed: _calculateDistance,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Settings Section
                _buildSectionCard(
                  title: 'Settings',
                  icon: Icons.settings,
                  children: [
                    _buildActionButton(
                      icon: Icons.location_searching,
                      label: 'Open Location Settings',
                      color: Colors.grey,
                      onPressed: _openLocationSettings,
                    ),
                    const SizedBox(height: 10),
                    _buildActionButton(
                      icon: Icons.app_settings_alt,
                      label: 'Open App Settings',
                      color: Colors.grey,
                      onPressed: _openAppSettings,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Current Position Display
                if (_currentPosition != null) _buildPositionCard(),

                const SizedBox(height: 50),
              ],
            ),
          ),

          // Loading Overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 16),
                    Text(
                      'Getting location...',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPermissionCard() {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (_permission) {
      case LocationPermission.always:
        statusColor = Colors.green;
        statusText = 'Always Allowed';
        statusIcon = Icons.check_circle;
        break;
      case LocationPermission.whileInUse:
        statusColor = Colors.blue;
        statusText = 'While In Use';
        statusIcon = Icons.check_circle;
        break;
      case LocationPermission.denied:
        statusColor = Colors.orange;
        statusText = 'Denied';
        statusIcon = Icons.warning;
        break;
      case LocationPermission.deniedForever:
        statusColor = Colors.red;
        statusText = 'Denied Forever';
        statusIcon = Icons.cancel;
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'Unknown';
        statusIcon = Icons.help;
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(statusIcon, color: statusColor, size: 32),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Permission Status',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionCard() {
    return Card(
      elevation: 3,
      color: Colors.teal[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.place, color: Colors.teal),
                SizedBox(width: 8),
                Text(
                  'Current Position',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            _buildInfoRow('Latitude', '${_currentPosition!.latitude}°'),
            _buildInfoRow('Longitude', '${_currentPosition!.longitude}°'),
            _buildInfoRow(
              'Accuracy',
              '${_currentPosition!.accuracy.toStringAsFixed(2)} meters',
            ),
            _buildInfoRow(
              'Altitude',
              '${_currentPosition!.altitude.toStringAsFixed(2)} meters',
            ),
            _buildInfoRow(
              'Speed',
              '${(_currentPosition!.speed * 3.6).toStringAsFixed(2)} km/h',
            ),
            _buildInfoRow(
              'Heading',
              '${_currentPosition!.heading.toStringAsFixed(1)}° (${_getDirectionFromHeading(_currentPosition!.heading)})',
            ),
            _buildInfoRow(
              'Timestamp',
              '${_currentPosition!.timestamp.hour}:${_currentPosition!.timestamp.minute}:${_currentPosition!.timestamp.second}',
            ),
            _buildInfoRow(
              'Is Mocked',
              _currentPosition!.isMocked ? 'Yes ⚠️' : 'No ✓',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(color: Colors.grey[700])),
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
                Icon(icon, color: Colors.teal),
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
