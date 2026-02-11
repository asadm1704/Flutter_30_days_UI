import 'package:flutter/material.dart';

// ============================================================================
// FORMS IN FLUTTER - BEGINNER'S COMPLETE GUIDE
// ============================================================================
//
// WHAT IS A FORM?
// ----------------
// A Form is a container widget that groups multiple form fields together.
// It helps you validate, save, and reset all fields at once!
// Think of it like a paper form where you fill in your name, email, password, etc.
//
// WHY USE FORMS?
// --------------
// 1. Validate all fields together (check if inputs are correct)
// 2. Save all field values at once
// 3. Reset all fields to initial values
// 4. Show validation errors automatically
//
// HOW FORMS WORK:
// ---------------
// 1. Wrap your fields in a Form widget
// 2. Give the Form a GlobalKey<FormState> to access its state
// 3. Use TextFormField (not TextField) inside the Form
// 4. Call _formKey.currentState!.validate() to validate
// 5. Call _formKey.currentState!.save() to save values
//
// ============================================================================
// FORM WIDGET PROPERTIES
// ============================================================================
//
// 1. key: Key? (usually GlobalKey<FormState>)
//    - Used to access the form's state for validation/saving
//    - Example: key: _formKey
//
// 2. child: Widget (required)
//    - The form content (usually a Column with TextFormFields)
//
// 3. autovalidateMode: AutovalidateMode?
//    - When to automatically validate the form
//    - Values:
//      • AutovalidateMode.disabled - Only validate when asked (default)
//      • AutovalidateMode.always - Validate on every change
//      • AutovalidateMode.onUserInteraction - Validate after user interacts
//
// 4. onWillPop: WillPopCallback?
//    - Called when user tries to leave the page
//    - Return false to prevent leaving (e.g., unsaved changes warning)
//
// 5. onChanged: VoidCallback?
//    - Called whenever any form field changes
//    - Useful for enabling/disabling submit button
//
// ============================================================================
// FORMSTATE METHODS (accessed via GlobalKey)
// ============================================================================
//
// 1. validate() → bool
//    - Runs all validators and returns true if all pass
//    - Example: if (_formKey.currentState!.validate()) { ... }
//
// 2. save()
//    - Calls onSaved on all TextFormFields
//    - Example: _formKey.currentState!.save();
//
// 3. reset()
//    - Resets all fields to their initial values
//    - Example: _formKey.currentState!.reset();
//
// ============================================================================
// TEXTFORMFIELD WIDGET PROPERTIES (COMPLETE LIST)
// ============================================================================
//
// TextFormField is a TextField wrapped with FormField for form integration.
//
// VALIDATION & SAVING:
// --------------------
// 1. validator: String? Function(String?)?
//    - Function that returns error message if invalid, null if valid
//    - Example: validator: (value) => value!.isEmpty ? 'Required' : null
//
// 2. onSaved: void Function(String?)?
//    - Called when form.save() is called
//    - Example: onSaved: (value) => _name = value!
//
// 3. autovalidateMode: AutovalidateMode?
//    - When to validate this specific field
//
// TEXT INPUT PROPERTIES:
// ----------------------
// 4. controller: TextEditingController?
//    - Controls the text being edited
//    - Example: controller: _emailController
//
// 5. initialValue: String?
//    - Initial text value (don't use with controller)
//
// 6. keyboardType: TextInputType?
//    - Type of keyboard to show
//    - Values:
//      • TextInputType.text (default)
//      • TextInputType.emailAddress (@ and .com buttons)
//      • TextInputType.number (number pad)
//      • TextInputType.phone (phone number pad)
//      • TextInputType.multiline (Enter key for new line)
//      • TextInputType.url (URL keyboard)
//      • TextInputType.visiblePassword
//
// 7. textInputAction: TextInputAction?
//    - Action button on keyboard (Enter key)
//    - Values: done, next, search, send, go, etc.
//
// 8. textCapitalization: TextCapitalization
//    - How to capitalize text
//    - Values: none, words, sentences, characters
//
// 9. obscureText: bool
//    - Hide text (for passwords) - default: false
//
// 10. maxLength: int?
//     - Maximum characters allowed
//
// 11. maxLines: int?
//     - Maximum lines (null = unlimited, 1 = single line)
//
// 12. minLines: int?
//     - Minimum lines to show
//
// 13. enabled: bool?
//     - Whether the field is editable
//
// 14. readOnly: bool
//     - If true, can't edit but can select/copy
//
// DECORATION PROPERTIES:
// ----------------------
// 15. decoration: InputDecoration?
//     - Visual decoration of the field (see InputDecoration below)
//
// 16. style: TextStyle?
//     - Style of the input text
//
// 17. textAlign: TextAlign
//     - Horizontal alignment of text
//
// 18. cursorColor: Color?
//     - Color of the text cursor
//
// CALLBACKS:
// ----------
// 19. onChanged: void Function(String)?
//     - Called whenever text changes
//
// 20. onFieldSubmitted: void Function(String)?
//     - Called when user presses Enter/Done
//
// 21. onTap: void Function()?
//     - Called when field is tapped
//
// 22. onEditingComplete: void Function()?
//     - Called when editing is complete
//
// ============================================================================
// INPUTDECORATION PROPERTIES (STYLING THE FIELD)
// ============================================================================
//
// InputDecoration controls how the TextFormField looks.
//
// LABELS & HINTS:
// ---------------
// 1. labelText: String? - Floating label
// 2. labelStyle: TextStyle? - Label text style
// 3. hintText: String? - Placeholder text
// 4. hintStyle: TextStyle? - Hint text style
// 5. helperText: String? - Helper text below field
// 6. helperStyle: TextStyle? - Helper text style
//
// ICONS:
// ------
// 7. icon: Widget? - Icon before the field
// 8. prefixIcon: Widget? - Icon inside field at start
// 9. suffixIcon: Widget? - Icon inside field at end
// 10. prefix: Widget? - Widget before text (inside)
// 11. suffix: Widget? - Widget after text (inside)
//
// BORDERS:
// --------
// 12. border: InputBorder? - Default border
// 13. enabledBorder: InputBorder? - Border when enabled
// 14. focusedBorder: InputBorder? - Border when focused
// 15. errorBorder: InputBorder? - Border when error
// 16. focusedErrorBorder: InputBorder? - Border when focused with error
// 17. disabledBorder: InputBorder? - Border when disabled
//
// Common border types:
// • OutlineInputBorder() - Box around the field
// • UnderlineInputBorder() - Line under the field (default)
//
// COLORS & FILL:
// --------------
// 18. filled: bool? - Whether to fill background
// 19. fillColor: Color? - Background fill color
// 20. focusColor: Color? - Color when focused
// 21. hoverColor: Color? - Color on hover
//
// ERRORS:
// -------
// 22. errorText: String? - Manual error message
// 23. errorStyle: TextStyle? - Error text style
// 24. errorMaxLines: int? - Max lines for error
//
// SPACING:
// --------
// 25. contentPadding: EdgeInsetsGeometry? - Padding inside field
// 26. isDense: bool? - Reduces height
//
// ============================================================================
// COMMON VALIDATORS
// ============================================================================
//
// Email validator:
// validator: (value) {
//   if (value == null || value.isEmpty) return 'Email required';
//   if (!value.contains('@')) return 'Invalid email';
//   return null;
// }
//
// Password validator:
// validator: (value) {
//   if (value == null || value.isEmpty) return 'Password required';
//   if (value.length < 6) return 'Password must be at least 6 characters';
//   return null;
// }
//
// Required field:
// validator: (value) => value!.isEmpty ? 'This field is required' : null
//
// Phone number:
// validator: (value) {
//   if (value!.isEmpty) return 'Phone required';
//   if (value.length != 10) return 'Must be 10 digits';
//   return null;
// }
//
// ============================================================================

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  // ==========================================================================
  // FORM KEY - Required to access form state
  // ==========================================================================
  // GlobalKey<FormState> is used to identify the form and access its methods
  // like validate(), save(), and reset()
  final _formKey = GlobalKey<FormState>();

  // ==========================================================================
  // CONTROLLERS - To control and read text field values
  // ==========================================================================
  // TextEditingController gives you control over the text in a field
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  // ==========================================================================
  // FORM DATA - Variables to store saved form values
  // ==========================================================================
  String _savedName = '';
  String _savedEmail = '';
  String _savedPhone = '';
  String _savedMessage = '';

  // ==========================================================================
  // STATE VARIABLES
  // ==========================================================================
  bool _obscurePassword = true; // Toggle password visibility
  bool _agreeToTerms = false; // Checkbox state
  String _selectedGender = 'Male'; // Radio button selection

  // ==========================================================================
  // DISPOSE - Clean up controllers when widget is removed
  // ==========================================================================
  @override
  void dispose() {
    // Always dispose controllers to prevent memory leaks!
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms in Flutter'),
        backgroundColor: Colors.indigo,
        actions: [
          // Reset button in app bar
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset Form',
            onPressed: _resetForm,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==============================================================
            // FORM WIDGET - Wraps all form fields
            // ==============================================================
            Form(
              // Key to access form state
              key: _formKey,

              // Validate after user interacts with a field
              autovalidateMode: AutovalidateMode.onUserInteraction,

              // Called whenever any field changes
              onChanged: () {
                // You could enable/disable submit button here
                // setState(() => _isFormValid = _formKey.currentState!.validate());
              },

              // Form content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ============================================================
                  // EXAMPLE 1: Basic Text Field with Validation
                  // ============================================================
                  _buildSectionTitle('1. Name Field (Required)'),

                  TextFormField(
                    // Controller to read/write text
                    controller: _nameController,

                    // Decoration for visual styling
                    decoration: InputDecoration(
                      labelText: 'Full Name', // Floating label
                      hintText: 'Enter your full name', // Placeholder
                      prefixIcon: const Icon(Icons.person), // Icon at start
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // Styling when focused
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: Colors.indigo, width: 2),
                      ),
                    ),

                    // Capitalize each word
                    textCapitalization: TextCapitalization.words,

                    // Keyboard action button shows "Next"
                    textInputAction: TextInputAction.next,

                    // Validator function - returns error message or null
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name'; // Error message
                      }
                      if (value.length < 2) {
                        return 'Name must be at least 2 characters';
                      }
                      return null; // null means valid!
                    },

                    // Called when form.save() is called
                    onSaved: (value) {
                      _savedName = value!;
                    },
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // EXAMPLE 2: Email Field with Email Keyboard
                  // ============================================================
                  _buildSectionTitle('2. Email Field'),

                  TextFormField(
                    controller: _emailController,

                    // Email keyboard with @ and .com buttons
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'example@email.com',
                      prefixIcon: const Icon(Icons.email),
                      // Suffix icon to clear text
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _emailController.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // Helper text below the field
                      helperText: 'We will never share your email',
                    ),

                    textInputAction: TextInputAction.next,

                    // Email validation
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      // Simple email regex pattern
                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },

                    onSaved: (value) => _savedEmail = value!,
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // EXAMPLE 3: Password Field with Toggle Visibility
                  // ============================================================
                  _buildSectionTitle('3. Password Field'),

                  TextFormField(
                    controller: _passwordController,

                    // Hide password text
                    obscureText: _obscurePassword,

                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.lock),
                      // Toggle visibility button
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    textInputAction: TextInputAction.next,

                    // Password validation
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      // Check for uppercase
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain an uppercase letter';
                      }
                      // Check for number
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Password must contain a number';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // EXAMPLE 4: Phone Number Field
                  // ============================================================
                  _buildSectionTitle('4. Phone Number Field'),

                  TextFormField(
                    controller: _phoneController,

                    // Phone number keyboard
                    keyboardType: TextInputType.phone,

                    // Limit to 11 digits
                    maxLength: 11,

                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '03001234567',
                      prefixIcon: const Icon(Icons.phone),
                      // Prefix text (country code)
                      prefixText: '+92 ',
                      prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // Counter shows character count (from maxLength)
                    ),

                    textInputAction: TextInputAction.next,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      }
                      if (value.length < 10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },

                    onSaved: (value) => _savedPhone = value!,
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // EXAMPLE 5: Multi-line Text Area
                  // ============================================================
                  _buildSectionTitle('5. Message Field (Multi-line)'),

                  TextFormField(
                    controller: _messageController,

                    // Multi-line keyboard (Enter creates new line)
                    keyboardType: TextInputType.multiline,

                    // Minimum and maximum lines
                    minLines: 3, // Start with 3 lines
                    maxLines: 5, // Expand up to 5 lines

                    // Maximum characters
                    maxLength: 200,

                    decoration: InputDecoration(
                      labelText: 'Your Message',
                      hintText: 'Type your message here...',
                      alignLabelWithHint: true, // Align label with top
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 60),
                        child: Icon(Icons.message),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // Filled background
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),

                    onSaved: (value) => _savedMessage = value!,
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // EXAMPLE 6: Radio Buttons in Form
                  // ============================================================
                  _buildSectionTitle('6. Gender Selection (Radio Buttons)'),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select Gender:',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Row(
                          children: [
                            // Male radio button
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Male'),
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() => _selectedGender = value!);
                                },
                              ),
                            ),
                            // Female radio button
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Female'),
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() => _selectedGender = value!);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ============================================================
                  // EXAMPLE 7: Checkbox in Form
                  // ============================================================
                  _buildSectionTitle('7. Terms & Conditions (Checkbox)'),

                  FormField<bool>(
                    initialValue: _agreeToTerms,
                    validator: (value) {
                      if (value != true) {
                        return 'You must agree to the terms';
                      }
                      return null;
                    },
                    builder: (FormFieldState<bool> state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CheckboxListTile(
                            title: const Text('I agree to the Terms & Conditions'),
                            subtitle: const Text('Required'),
                            value: _agreeToTerms,
                            onChanged: (value) {
                              setState(() => _agreeToTerms = value!);
                              state.didChange(value);
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: state.hasError
                                    ? Colors.red
                                    : Colors.grey.shade300,
                              ),
                            ),
                          ),
                          // Show error message if validation fails
                          if (state.hasError)
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 4),
                              child: Text(
                                state.errorText!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // ============================================================
                  // FORM BUTTONS
                  // ============================================================
                  Row(
                    children: [
                      // Reset button
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reset'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _resetForm,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Submit button
                      Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.send),
                          label: const Text('Submit'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _submitForm,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ==============================================================
            // DISPLAY SAVED DATA
            // ==============================================================
            if (_savedName.isNotEmpty) ...[
              _buildSectionTitle('Submitted Data:'),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDataRow('Name', _savedName),
                    _buildDataRow('Email', _savedEmail),
                    _buildDataRow('Phone', '+92 $_savedPhone'),
                    _buildDataRow('Gender', _selectedGender),
                    _buildDataRow('Message', _savedMessage),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ==========================================================================
  // HELPER METHODS
  // ==========================================================================

  // Submit form handler
  void _submitForm() {
    // validate() returns true if all validators pass
    if (_formKey.currentState!.validate()) {
      // save() calls onSaved on all fields
      _formKey.currentState!.save();

      // Update UI to show saved data
      setState(() {});

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Form submitted successfully!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fix the errors above'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
  }

  // Reset form handler
  void _resetForm() {
    // reset() clears all fields to initial values
    _formKey.currentState!.reset();

    // Clear controllers
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _phoneController.clear();
    _messageController.clear();

    // Reset state variables
    setState(() {
      _savedName = '';
      _savedEmail = '';
      _savedPhone = '';
      _savedMessage = '';
      _agreeToTerms = false;
      _selectedGender = 'Male';
    });

    // Show message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form reset'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Build section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  // Build data row for displaying saved data
  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value.isEmpty ? '-' : value),
          ),
        ],
      ),
    );
  }
}
