import 'package:flutter/material.dart';
import 'package:sddproject/widgets/AccuracyPage.dart';
import 'package:sddproject/widgets/ChangePassword.dart';
import 'package:sddproject/widgets/size_config.dart';
import 'appbar.dart';
import 'constants.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: GlobalConstants.backgroundGradient,
        ),
        child: Column(
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              AppBarWidget(
                title: "",
                height: 0.3,
              ),
              Positioned(
                top: 50,
                child: Column(
                  children: [
                    Image.asset(
                      alignment: Alignment.bottomCenter,
                      "Assets/images/edit_picture.png",
                      scale: SizeConfig.width(context, 0.004),
                    ),
                    SizedBox(
                      height: SizeConfig.height(context, 0.02),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.height(context, 0.06),
                      width: SizeConfig.width(context, 0.4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.width(context, 0.1),
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(29, 147, 135, 0.39),
                            Color.fromRGBO(0, 0, 0, 0.39),
                          ],
                        ),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: SizeConfig.width(context, 0.05),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: "Jacques_Francois_Shadow"),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: SizeConfig.height(context, 0.02),
            ),

            Expanded(
              child: ListView(
                children: [
                 buildProfileOption(context, 'Edit Profile', Icons.edit, EditProfileScreen()),
                  buildProfileOption(context, 'Language', Icons.language, LanguageSelectionScreen()),
                  buildProfileOption(context, 'Change Password', Icons.password, ChangePassword()),
                  buildProfileOption(context, 'Accuracy', Icons.location_searching, AccuracyPage()),
                ],
              ),
            ),
            // Log out button
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff1d4c47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                onPressed: () {},
                child: const Text(
                  'LOG OUT',
                  style: TextStyle(color: Colors.white, fontFamily: "Itlim"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each profile option
  Widget buildProfileOption(BuildContext context, String title, IconData icon, Widget? screen) {
    return GestureDetector(
      onTap: () {
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Itim",
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

// The LanguageSelectionScreen class goes here, as provided in the previous code snippet.


class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'British English'; // Initial dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F3D3E), Color(0xFF000000)], // Dark teal to black gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 1.0],
          ),
        ),
        child: Column(
          children: [
            // Back button with transparent background
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 56,
                          backgroundImage: AssetImage('Assets/logo.jpeg'), // Local asset image for avatar
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Select your Language',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value!;
                              });
                            },
                            underline: const SizedBox(),
                            items: [
                              const DropdownMenuItem(
                                value: 'British English',
                                child: Row(
                                  children: [
                                    Icon(Icons.brightness_5_outlined, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text('British English'),
                                  ],
                                ),
                              ),
                              const DropdownMenuItem(
                                value: 'American English',
                                child: Row(
                                  children: [
                                    Icon(Icons.brightness_5_outlined, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text('American English'),
                                  ],
                                ),
                              ),
                              const DropdownMenuItem(
                                value: 'Urdu',
                                child: Row(
                                  children: [
                                    Icon(Icons.brightness_5_outlined, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text('Urdu'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '***********************************',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // Transparent boxes for each language
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildLanguageBox('British English', 'The British variant of English, used widely in Europe and former British colonies.'),
                        const SizedBox(width: 20), // Spacing between boxes
                        buildLanguageBox('American English', 'The American variant of English, prominent in business and global media.'),
                        const SizedBox(width: 20), // Spacing between boxes
                        buildLanguageBox('Urdu', 'A poetic language spoken primarily in Pakistan and parts of India.'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      '***********************************',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 85),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008080), // Teal green color for button
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build transparent language boxes
  Widget buildLanguageBox(String title, String description) {
    return Container(
      width: 210, // Width of the box
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Transparent background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.5)), // Optional border
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}




class LanguageCard extends StatelessWidget {
  final String language;
  final String description;

  const LanguageCard({
    required this.language,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(


      width: 230, // Reduced width for a smaller card
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            language,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}
class EditProfileScreen extends StatelessWidget {
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
              'Edit Profile',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
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

            // Larger square box container for input fields and profile circle
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(top: 60, bottom: 40, left: 20, right: 20), // Adjusted padding
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
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Positioned profile circle inside the square box
                  Positioned(
                    top: -40, // Adjusted position of the circle
                    right: 20, // Adjust position from the right
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 60, // Increased radius of the profile image
                        backgroundImage: AssetImage('Assets/images/edit_picture.png'), // Replace with your asset
                      ),
                    ),
                  ),
                  // Column of input fields
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter, // Center the icon button
                        child: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white), // Edit icon
                          iconSize: 30, // Adjust the icon size as needed
                          onPressed: () {
                            // Show options for editing the profile photo
                            _showPhotoOptions(context);
                          },
                        ),
                      ),
                      const SizedBox(height: 40), // Space below circle avatar
                      _buildTextField("Change Username", "Enter username"),
                      const SizedBox(height: 10),
                      _buildTextField("Change Email Address", "Enter email address"),
                      const SizedBox(height: 10),
                      _buildTextField("Change Phone Number", "Enter phone number"),
                      const SizedBox(height: 20), // Space before the icon button

                    ],
                  ),
                ],
              ),
            ),

            const Spacer(), // Spacer for layout adjustment

            // Bottom right container for save button
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Save button functionality here
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
  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Label text color changed to white
          ),
        ),
        const SizedBox(height: 5),
        TextField(
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

  // Function to show options for profile photo
  void _showPhotoOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Profile Photo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Import from Gallery"),
                onTap: () {
                  // Handle import from gallery action
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Take Photo"),
                onTap: () {
                  // Handle take photo action
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}