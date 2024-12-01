import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatelessWidget {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reEnterNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F3D3E), Color(0xFF000000)], // Two-tone black and teal
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the previous page
                  },
                ),
              ),
            ),
            const CircleAvatar(
              radius: 56,
              backgroundImage: AssetImage('Assets/logo.jpeg'), // Local asset image for avatar
            ),
            const SizedBox(height: 20),
            const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '****************************************',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 10,
              color: Colors.transparent, // Transparent background
            ),
            const SizedBox(height: 5), // Spacing before square box

            // Larger square box container for input fields
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20), // Adjusted padding
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Semi-transparent background
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.5)), // Border color for visibility
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Adjust shadow to blend with transparency
                    blurRadius: 15,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Space before text fields
                  _buildTextField("Current Password", "Enter current password", currentPasswordController),
                  const SizedBox(height: 10),
                  _buildTextField("New Password", "Enter new password", newPasswordController),
                  const SizedBox(height: 10),
                  _buildTextField("Re-Enter New Password", "Enter new password", reEnterNewPasswordController),
                ],
              ),
            ),
            const Spacer(), // Spacer for layout adjustment
            const Text(
              '****************************************',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 40),
            // Bottom right container for save button
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    _handleChangePassword(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50), // Smaller size for the save button
                    backgroundColor: Colors.teal, // Save button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "SAVE",
                    style: TextStyle(fontSize: 18, color: Colors.black), // Save button text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create text fields
  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Label text color
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: true, // Hides the password input
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)), // Hint text color set to light white
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.black, // Text field background color set to black
          ),
          style: const TextStyle(color: Colors.white), // Input text color set to white
        ),
      ],
    );
  }

  // Function to handle the password change
  void _handleChangePassword(BuildContext context) async {
    String currentPassword = currentPasswordController.text;
    String newPassword = newPasswordController.text;
    String reEnteredPassword = reEnterNewPasswordController.text;

    if (newPassword != reEnteredPassword) {
      // Show error if new password and re-entered password don't match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("New Password and Re-Entered Password do not match!")),
      );
      return;
    }

    // Call the backend API
    bool isSuccessful = await authenticateAndChangePassword(currentPassword, newPassword);

    if (isSuccessful) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password changed successfully!")),
      );
      currentPasswordController.clear();
      newPasswordController.clear();
      reEnterNewPasswordController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password change failed! Please try again.")),
      );
    }
  }

  // Simulate API call to validate and change the password
  Future<bool> authenticateAndChangePassword(String currentPassword, String newPassword) async {
    const String apiUrl = "https://your-backend-url.com/api/change-password"; // Replace with your actual API URL
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "currentPassword": currentPassword,
          "newPassword": newPassword,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['success']; // Assuming the API responds with a JSON that includes a 'success' key
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
