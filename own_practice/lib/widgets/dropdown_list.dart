import 'package:flutter/material.dart';

// ============================================================================
// DROPDOWN BUTTON - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS DROPDOWN BUTTON?
// ------------------------
// A DropdownButton is a material design button that displays a list of items
// when pressed. The user can select one item from the list, and the selected
// item is displayed on the button. It's like a combo box or select element
// in web development.
//
// WHEN TO USE IT?
// ---------------
// - When you have a list of options and user needs to pick one
// - For forms where user selects from predefined choices
// - Examples: Country selection, Gender, Category, Priority level, etc.
//
// KEY COMPONENTS:
// ---------------
// 1. DropdownButton<T> - The main widget (T is the data type of items)
// 2. DropdownMenuItem<T> - Each item in the dropdown list
// 3. DropdownButtonFormField<T> - Dropdown with form validation support
//
// ============================================================================
// DROPDOWN BUTTON PROPERTIES (COMPLETE LIST):
// ============================================================================
//
// REQUIRED PROPERTIES:
// --------------------
// 1. items: List<DropdownMenuItem<T>>
//    - The list of items to display in the dropdown
//    - Each item is a DropdownMenuItem with a value and child widget
//
// 2. onChanged: void Function(T? value)
//    - Callback when user selects an item
//    - Receives the selected item's value
//    - If null, the dropdown is disabled
//
// COMMON PROPERTIES:
// ------------------
// 3. value: T?
//    - The currently selected value
//    - Must match one of the items' values, or be null
//    - If null, hint is displayed
//
// 4. hint: Widget?
//    - Widget displayed when no item is selected (value is null)
//    - Example: Text('Select an option')
//
// 5. disabledHint: Widget?
//    - Widget displayed when dropdown is disabled (onChanged is null)
//
// 6. selectedItemBuilder: List<Widget> Function(BuildContext)?
//    - Custom widget to display for selected item
//    - Useful when you want different display in button vs dropdown
//
// STYLING PROPERTIES:
// -------------------
// 7. style: TextStyle?
//    - Text style for the dropdown items
//
// 8. underline: Widget?
//    - Widget to display below the button
//    - Default is a 1px line
//    - Set to SizedBox.shrink() to remove
//
// 9. icon: Widget?
//    - The dropdown arrow icon (default: Icons.arrow_drop_down)
//
// 10. iconSize: double
//     - Size of the dropdown icon (default: 24.0)
//
// 11. iconEnabledColor: Color?
//     - Color of icon when dropdown is enabled
//
// 12. iconDisabledColor: Color?
//     - Color of icon when dropdown is disabled
//
// 13. dropdownColor: Color?
//     - Background color of the dropdown menu
//
// 14. focusColor: Color?
//     - Color when the dropdown is focused
//
// LAYOUT PROPERTIES:
// ------------------
// 15. elevation: int
//     - Shadow elevation of the dropdown menu (default: 8)
//
// 16. padding: EdgeInsetsGeometry?
//     - Padding around the dropdown button
//
// 17. isExpanded: bool
//     - If true, dropdown takes full width of parent (default: false)
//
// 18. isDense: bool
//     - If true, reduces the button's height (default: false)
//
// 19. itemHeight: double?
//     - Height of each dropdown menu item (default: kMinInteractiveDimension)
//
// 20. menuMaxHeight: double?
//     - Maximum height of the dropdown menu
//     - If items exceed this, menu becomes scrollable
//
// BEHAVIOR PROPERTIES:
// --------------------
// 21. autofocus: bool
//     - If true, dropdown gets focus when widget is built (default: false)
//
// 22. focusNode: FocusNode?
//     - Controls focus for keyboard navigation
//
// 23. enableFeedback: bool?
//     - Whether to play sounds/haptics on interaction
//
// 24. alignment: AlignmentGeometry
//     - Alignment of the selected item in the button (default: AlignmentDirectional.centerStart)
//
// 25. borderRadius: BorderRadius?
//     - Border radius of the dropdown menu
//
// ============================================================================
// DROPDOWN MENU ITEM PROPERTIES:
// ============================================================================
//
// 1. value: T?
//    - The value this item represents
//
// 2. child: Widget
//    - The widget to display (usually Text)
//
// 3. enabled: bool
//    - Whether this item can be selected (default: true)
//
// 4. alignment: AlignmentGeometry
//    - Alignment of child within the item (default: AlignmentDirectional.centerStart)
//
// ============================================================================

class DropdownList extends StatefulWidget {
  const DropdownList({super.key});

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  // ---- STATE VARIABLES ----
  // These store the currently selected values for each dropdown

  // Example 1: Simple string dropdown
  String? selectedFruit;

  // Example 2: Dropdown with custom styling
  String? selectedCountry;

  // Example 3: Dropdown with icons
  String? selectedCategory;

  // Example 4: Dropdown with objects
  Color? selectedColor;

  // ---- DATA LISTS ----
  // Lists of items to display in dropdowns

  // Simple list of strings
  final List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grapes',
    'Watermelon',
  ];

  // List of countries
  final List<String> countries = [
    'Pakistan',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
  ];

  // List of categories with icons
  final List<Map<String, dynamic>> categories = [
    {'name': 'Food', 'icon': Icons.restaurant},
    {'name': 'Travel', 'icon': Icons.flight},
    {'name': 'Shopping', 'icon': Icons.shopping_cart},
    {'name': 'Entertainment', 'icon': Icons.movie},
    {'name': 'Education', 'icon': Icons.school},
  ];

  // List of colors (using actual Color objects)
  final List<Map<String, dynamic>> colorOptions = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Purple', 'color': Colors.purple},
    {'name': 'Orange', 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---- APP BAR ----
      appBar: AppBar(
        title: const Text('Dropdown Button Explanation'),
        backgroundColor: Theme.of(context).primaryColor,
      ),

      // ---- BODY ----
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================================================================
            // EXAMPLE 1: BASIC DROPDOWN
            // ================================================================
            const Text(
              '1. Basic Dropdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Simple dropdown with string values:',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 8),

            // Basic DropdownButton
            DropdownButton<String>(
              // The currently selected value
              value: selectedFruit,

              // Hint shown when no item is selected
              hint:  Text('Select a fruit'),

              // Generate dropdown items from our list
              items: fruits.map((String fruit) {
                return DropdownMenuItem<String>(
                  value: fruit, // The value when this item is selected
                  child: Text(fruit), // What to display
                );
              }).toList(),

              // Called when user selects an item
              onChanged: (String? newValue) {
                setState(() {
                  selectedFruit = newValue;
                });
              },
            ),

            // Show selected value
            if (selectedFruit != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'fuck You for selecting $selectedFruit MF: ',
                  style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                ),
              ),

            const Divider(height: 60),

            // ================================================================
            // EXAMPLE 2: STYLED DROPDOWN WITH FULL WIDTH
            // ================================================================
            const Text(
              '2. Styled Full-Width Dropdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Dropdown with custom colors and expanded width:',
              style: TextStyle(color: Color.fromARGB(141, 158, 158, 158)),
            ),
            const SizedBox(height: 8),

            // Container for styling
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedCountry,
                hint: const Text('Select your country'),

                // IMPORTANT: Makes dropdown take full width of parent
                isExpanded: true,

                // Remove the default underline
                underline: const SizedBox.shrink(),

                // Custom dropdown icon
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 30,
                iconEnabledColor: Colors.blue,

                // Dropdown menu styling
                dropdownColor: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),

                // Text style for items
                style: const TextStyle(color: Colors.black, fontSize: 16),

                // Menu elevation (shadow)
                elevation: 16,

                // Generate items
                items: countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue;
                  });
                },
              ),
            ),

            const Divider(height: 40),

            // ================================================================
            // EXAMPLE 3: DROPDOWN WITH ICONS
            // ================================================================
            const Text(
              '3. Dropdown with Icons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Each item has an icon alongside text:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: selectedCategory,
                hint: const Text('Select a category'),
                isExpanded: true,
                underline: const SizedBox.shrink(),

                // Custom icon with animation
                icon: const Icon(Icons.expand_more),
                iconSize: 28,

                // Generate items with icons
                items: categories.map((Map<String, dynamic> category) {
                  return DropdownMenuItem<String>(
                    value: category['name'],
                    // Row with icon and text
                    child: Row(
                      children: [
                        Icon(category['icon'], color: Colors.blue, size: 24),
                        const SizedBox(width: 12),
                        Text(category['name']),
                      ],
                    ),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
              ),
            ),

            const Divider(height: 40),

            // ================================================================
            // EXAMPLE 4: DROPDOWN WITH COLOR PREVIEW
            // ================================================================
            const Text(
              '4. Dropdown with Color Objects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Working with non-string values (Color objects):',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<Color>(
                value: selectedColor,
                hint: const Text('Pick a color'),
                isExpanded: true,
                underline: const SizedBox.shrink(),

                // Limit dropdown menu height (makes it scrollable if needed)
                menuMaxHeight: 200,

                items: colorOptions.map((Map<String, dynamic> option) {
                  return DropdownMenuItem<Color>(
                    value: option['color'],
                    child: Row(
                      children: [
                        // Color preview box
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: option['color'],
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(option['name']),
                      ],
                    ),
                  );
                }).toList(),

                onChanged: (Color? newValue) {
                  setState(() {
                    selectedColor = newValue;
                  });
                },
              ),
            ),

            // Show color preview when selected
            if (selectedColor != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Selected Color Preview',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            const Divider(height: 40),

            // ================================================================
            // EXAMPLE 5: DROPDOWN BUTTON FORM FIELD (For Forms)
            // ================================================================
            const Text(
              '5. DropdownButtonFormField',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Use this in forms for validation support:',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),

            // DropdownButtonFormField has built-in decoration
            DropdownButtonFormField<String>(
              value: null,
              hint: const Text('Select priority'),

              // InputDecoration for form field styling
              decoration: InputDecoration(
                labelText: 'Priority Level',
                prefixIcon: const Icon(Icons.flag),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),

              items: const [
                DropdownMenuItem(value: 'low', child: Text('🟢 Low')),
                DropdownMenuItem(value: 'medium', child: Text('🟡 Medium')),
                DropdownMenuItem(value: 'high', child: Text('🟠 High')),
                DropdownMenuItem(value: 'urgent', child: Text('🔴 Urgent')),
              ],

              // Validation (works with Form widget)
              validator: (value) {
                if (value == null) {
                  return 'Please select a priority';
                }
                return null;
              },

              onChanged: (String? newValue) {
                // Handle selection
              },
            ),

            const SizedBox(height: 40),

            // ================================================================
            // QUICK REFERENCE CARD
            // ================================================================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📝 Quick Reference',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('• Use DropdownButton for simple dropdowns'),
                  Text('• Use DropdownButtonFormField in forms'),
                  Text('• Set isExpanded: true for full width'),
                  Text('• Use underline: SizedBox.shrink() to remove line'),
                  Text('• value must match one of items\' values'),
                  Text('• onChanged: null makes dropdown disabled'),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
