import 'package:flutter/material.dart';
import 'package:sddproject/widgets/size_config.dart';
import 'appbar.dart';
import 'constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


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
                  buildProfileOption(context, 'Disease History', Icons.local_hospital, DiseaseHistoryPage()),
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

  LanguageCard({
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


class ChangePassword extends StatelessWidget {
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
                  _buildTextField("Current Password", "Enter current password"),
                  const SizedBox(height: 10),
                  _buildTextField("New Password", "Enter new password"),
                  const SizedBox(height: 10),
                  _buildTextField("Re-Enter New Password", "Enter new password"),
                  const SizedBox(height: 10),
                  // Remove the third text field as per request
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
            color: Colors.white, // Label text color
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
}

class AccuracyPage extends StatefulWidget {
  @override
  _AccuracyPageState createState() => _AccuracyPageState();
}

class _AccuracyPageState extends State<AccuracyPage> {
  // State variables
  bool? isHealed; // For "Healed or Not" question
  double accuracy = 0.0; // Default accuracy
  String? effectiveness; // Medicine effectiveness
  String? feedback; // Positive/Negative
  String? duration; // Treatment duration
  bool showResult = false; // To show result after calculation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.black, Color(0xFF1D9387)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Section
                const Text(
                  "Accuracy Check",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Monitor your healing progress",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),

                // Progress Indicator
                CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 15,
                  percent: accuracy,
                  center: Text(
                    "${(accuracy * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  progressColor: Colors.white,
                  backgroundColor: Colors.grey[400]!,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                const SizedBox(height: 30),

                // Healing Status Question
                if (isHealed == null) ...[
                  const Text(
                    "Are you healed?",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOptionButton("Yes", true),
                      const SizedBox(width: 10),
                      _buildOptionButton("Not Yet", false),
                    ],
                  ),
                ],

                // If healed, ask further questions
                if (isHealed == true && !showResult) ...[
                  _buildDropdown(
                    title: "Medicine Effectiveness",
                    items: ["Low", "Medium", "High"],
                    selectedValue: effectiveness,
                    onChanged: (value) {
                      setState(() {
                        effectiveness = value;
                      });
                    },
                  ),
                  _buildDropdown(
                    title: "Treatment Duration",
                    items: ["1 Week", "2 Weeks", "3 Weeks", "1 Month"],
                    selectedValue: duration,
                    onChanged: (value) {
                      setState(() {
                        duration = value;
                      });
                    },
                  ),
                  _buildDropdown(
                    title: "Feedback",
                    items: ["Positive", "Negative"],
                    selectedValue: feedback,
                    onChanged: (value) {
                      setState(() {
                        feedback = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateAccuracy,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "Calculate Accuracy",
                      style:
                      TextStyle(fontSize: 16, color: Color(0xFF1D9387)),
                    ),
                  ),
                ],

                // If not healed, show default accuracy
                if (isHealed == false) ...[
                  const Text(
                    "Healing is still in progress.",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                ],

                // Show results
                if (showResult) ...[
                  const SizedBox(height: 30),
                  _buildResultRow("Prescribed Medicines", effectiveness ?? "-"),
                  _buildResultRow("Treatment Duration", duration ?? "-"),
                  _buildResultRow("Feedback", feedback ?? "-"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Reset all values
                        isHealed = null;
                        accuracy = 0.0;
                        effectiveness = null;
                        feedback = null;
                        duration = null;
                        showResult = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "Reset",
                      style:
                      TextStyle(fontSize: 16, color: Color(0xFF1D9387)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to Calculate Accuracy
  void _calculateAccuracy() {
    setState(() {
      // Default to 50% if duration is "2 Weeks" or "3 Weeks" and no proper response
      if (duration == "2 Weeks" || duration == "3 Weeks") {
        accuracy = 0.75;
      } else {
        // Base accuracy based on duration
        double baseAccuracy = 0.25;
        if (duration == "1 Week") {
          baseAccuracy = 0.5;
        } else if (duration == "1 Month") {
          baseAccuracy = 0.6;
        }

        // Adjust based on medicine effectiveness
        if (effectiveness == "Low") {
          baseAccuracy *= 0.75; // Reduce by 25%
        } else if (effectiveness == "High") {
          baseAccuracy *= 1.25; // Increase by 25%
        }

        // Further adjust based on feedback
        if (feedback == "Positive") {
          baseAccuracy += 0.2; // Add 20%
        } else if (feedback == "Negative") {
          baseAccuracy -= 0.2; // Subtract 20%
        }

        // Ensure accuracy is within 25% to 80% range
        accuracy = baseAccuracy.clamp(0.25, 0.8);
      }

      // Show result after calculation
      showResult = true;
    });
  }


  // Function to Build Option Buttons
  Widget _buildOptionButton(String label, bool value) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isHealed = value;
          if (!value) {
            // Reset inputs and set default accuracy
            accuracy = 0.5;
            effectiveness = null;
            feedback = null;
            duration = null;
            showResult = false;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isHealed == value ? Colors.white : Colors.grey[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isHealed == value ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  // Function to Build Dropdowns
  Widget _buildDropdown({
    required String title,
    required List<String> items,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white70),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          dropdownColor: Colors.grey[800],
          style: const TextStyle(color: Colors.white),
          items: items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
              .toList(),
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Function to Build Result Rows
  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}


class DiseaseHistoryPage extends StatelessWidget {
  // Sample list to simulate stored disease history
  final List<Map<String, String>> diseaseHistory = [
    {
      'disease': 'Eczema',
      'prescription': 'Use moisturizer and apply hydrocortisone cream.',
      'date': '2024-11-30 10:30 AM',
    },
    {
      'disease': 'Psoriasis',
      'prescription': 'Apply salicylic acid-based ointment.',
      'date': '2024-11-29 3:15 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease History'),
        backgroundColor: Colors.teal,
      ),
      body: diseaseHistory.isEmpty
          ? const Center(
        child: Text(
          'No history available.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: diseaseHistory.length,
        itemBuilder: (context, index) {
          final history = diseaseHistory[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.medical_services, color: Colors.teal),
              title: Text(
                history['disease']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    'Prescription: ${history['prescription']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Date: ${history['date']}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}








