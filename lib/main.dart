import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sddproject/widgets/camera_screen.dart';
import 'package:sddproject/widgets/profile_screen.dart';
import 'package:sddproject/widgets/signup_page.dart';
import 'package:sddproject/widgets/take_picture.dart';
import 'firebase_options.dart';
import 'widgets/community_support_screen.dart';
import 'widgets/map.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final camera = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SkinDiseaseDetectorApp(cameras: camera,));
}

class SkinDiseaseDetectorApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const SkinDiseaseDetectorApp({super.key, required this.cameras});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(cameras: cameras), // Start with SplashScreen
    );
  }
}

class SplashScreen extends StatelessWidget {
  final List<CameraDescription> cameras;
  const SplashScreen({super.key, required this.cameras});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Transparent background logo with increased size
            SizedBox(
              height: 350, // Increased size of the image
              width: 500,
              child: Image.asset(
                'Assets/logo.jpeg', // Use PNG or JPEG image
                fit: BoxFit.contain, // Preserve aspect ratio
              ),
            ),
            SizedBox(height: 50),

            // Get Started button
            ElevatedButton(
              onPressed: () {
                // Navigate to RegisterScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen(cameras: cameras)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'GET STARTED',
                style: TextStyle(
                  color: Colors.teal[100], // Button text color
                  fontSize: 16,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const RegisterScreen({super.key, required this.cameras});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1D9387)], // Gradient colors
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Register Header
                    Text(
                      'REGISTRATION',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.teal[100],
                      ),
                    ),
                    SizedBox(height: 30),

                    // Full Name Field
                    _buildInputField('FULL NAME', 'Enter Full Name'),
                    SizedBox(height: 15),

                    // Phone Number Field
                    _buildInputField('PHONE NUMBER', 'Enter Your Number'),
                    SizedBox(height: 15),

                    // Email Address Field
                    _buildInputField('EMAIL ADDRESS', 'Enter Your Email'),
                    SizedBox(height: 15),

                    // Password Field
                    _buildInputField('CREATE PASSWORD', 'Create Password',
                        isPassword: true),
                    SizedBox(height: 30),

                    // Login Link
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupPage(cameras: widget.cameras)));
                      },
                      child: Text(
                        'Already have an account? LOGIN',
                        style: TextStyle(
                          color: Colors.teal[100],
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Bottom buttons: Skip and Next
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Go to RegPage on Skip
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegPage(cameras: widget.cameras)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[700], // Button color
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                                color: Colors.teal[100], fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to HomeScreen on Next
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CameraScreen(cameras: widget.cameras)),
                                  (route) => false, // Remove all previous routes
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[700], // Button color
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'NEXT',

                            style: TextStyle(
                                color: Colors.teal[100], fontSize: 16),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: TextStyle(
            color: Colors.teal[100],
            fontSize: 16,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 5),
        // TextField
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.teal[300]),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ],
    );
  }
}

class RegPage extends StatelessWidget {
  final List<CameraDescription> cameras;
  const RegPage({super.key, required this.cameras});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white, size: 30),
          onPressed: () {
            // Navigate back to the SplashScreen when the "X" is clicked
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen(cameras: cameras)),
                  (route) => false, // Remove all previous routes
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1D9387)], // Gradient colors
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            // Heading
            Text(
              'REGISTER YOUR NAME',
              style: TextStyle(
                color: Colors.teal[100],
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center, // Center the heading
            ),
            SizedBox(height: 45), // Reduced spacing below the heading

            // First Name Section
            _buildInputSection('FIRST NAME:', 'Enter First Name'),
            SizedBox(height: 40), // Spacing between text fields
            // Last Name Section
            _buildInputSection('LAST NAME:', 'Enter Last Name'),
            SizedBox(height: 40), // Add spacing before the button

            // Next Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle next button press
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor:
                  Colors.black, // Background color of the button
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection(String label, String hintText) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start, // Align children to the start (left)
      children: [
        // Label
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 2.0,
          ),
          textAlign: TextAlign.center, // Center the label
        ),
        SizedBox(height: 10),
        // Input Field
        _buildTextField(hintText),
      ],
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<CameraDescription> cameras;
  const HomeScreen({super.key, required this.cameras});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2C2C), // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen(cameras: cameras,)),
                  (route) => false, // Remove all previous routes
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Upper Row
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  buildFeatureCard(
                    context,
                    'DISEASE DETECTION',
                    'Assets/disease_detection.png',
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(),
                      ),
                    ),
                  ),
                  buildFeatureCard(
                    context,
                    'NEARBY SPECIALIST',
                    'Assets/nearby_specialist.jpeg',
                        () { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            spec_screen(cameras: cameras), // Navigate to ProfileScreen
                      ),
                    );
                      // Implement Nearby Specialist Navigation
                    },
                  ),
                ],
              ),
              const SizedBox(height: 60), // Increased space between rows
              // Lower Row
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  buildFeatureCard(
                    context,
                    'COMMUNITY SUPPORT',
                    'Assets/community_support.jpeg',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunitySupportScreen(),
                        ),
                      );
                    },
                  ),
                  buildFeatureCard(
                    context,
                    'PROFILE',
                    'Assets/profile.png',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileScreen(), // Navigate to ProfileScreen
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated Feature Card with Navigation
  Widget buildFeatureCard(BuildContext context, String title, String assetPath,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150, // Set a fixed height for uniformity
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color(0xFF1E8E8E),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final TextEditingController diseaseController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController prescriptionController = TextEditingController();

  double descriptionFieldHeight = 56; // Default height for description
  double prescriptionFieldHeight = 56; // Default height for prescription

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2C2C), // Dark background
      appBar: AppBar(
        title: const Text("."),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
      ),
      body: Scrollbar(
        thumbVisibility: true, // Always show the scrollbar
        thickness: 8, // Width of the scrollbar
        radius: const Radius.circular(10), // Rounded edges
        scrollbarOrientation:
        ScrollbarOrientation.right, // Position of the scrollbar
        child: SingleChildScrollView(
          // Wrap in SingleChildScrollView
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('Assets/pic.png'), // Update the image path
                  const SizedBox(height: 20),
                  const Text(
                    "DISEASE NAME:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: diseaseController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter Disease Name",
                      hintStyle: const TextStyle(color: Colors.white54),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "DESCRIPTION:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: descriptionFieldHeight,
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: null, // Allows for multi-line input
                      onChanged: (text) {
                        setState(() {
                          // Adjust height based on the amount of text
                          descriptionFieldHeight =
                              (text.split('\n').length * 24).toDouble() +
                                  24; // Adjust height as needed
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter Description",
                        hintStyle: const TextStyle(color: Colors.white54),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "PRESCRIPTION:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: prescriptionFieldHeight,
                    child: TextFormField(
                      controller: prescriptionController,
                      maxLines: null, // Allows for multi-line input
                      onChanged: (text) {
                        setState(() {
                          // Adjust height based on the amount of text
                          prescriptionFieldHeight =
                              (text.split('\n').length * 24).toDouble() +
                                  24; // Adjust height as needed
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Enter Prescription",
                        hintStyle: const TextStyle(color: Colors.white54),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Implement Nearby Specialist navigation
                    },
                    child: const Text("NEARBY SPECIALIST"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF000000), // Updated Button color
                      padding: const EdgeInsets.symmetric(
                          vertical: 16), // Add vertical padding
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(cameras: cameras), // Set HomeScreen as the home widget
    );
  }
}
class spec_screen extends StatelessWidget {
  final List<CameraDescription> cameras;
  const spec_screen({super.key, required this.cameras});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2C2C), // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen(cameras: cameras)),
                  (route) => false, // Remove all previous routes
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Upper Row
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  buildFeatureCard(
                    context,
                    'NEARBY HOSPITAL',
                    'Assets/hos.png',
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Maps(name: 'Hospital',),
                      ),
                    ),
                  ),

                  buildFeatureCard(
                    context,
                    'NEARBY PHARMACY',
                    'Assets/nearby_specialist.jpeg',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Maps(name: 'Pharmacy',),

                          // Map(), // Navigate to ProfileScreen
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Updated Feature Card with Navigation
  Widget buildFeatureCard(BuildContext context, String title, String assetPath,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150, // Set a fixed height for uniformity
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color(0xFF1E8E8E),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}