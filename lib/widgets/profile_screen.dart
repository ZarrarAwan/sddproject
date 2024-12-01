import 'package:flutter/material.dart';
import 'package:sddproject/widgets/size_config.dart';
import 'appbar.dart';
import 'constants.dart';
import 'edit_profile_screen.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: GlobalConstants.backgroundGradient,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                AppBarWidget(
                  title: "",
                  height: 0.3,
                ),
                Positioned(
                  top: 50,
                  child: Column(
                    children: [
                      // Circle Avatar for the profile picture
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('Assets/images/profile_avatar.png'),
                      ),

                      SizedBox(
                        height: SizeConfig.height(context, 0.02),
                      ),
                      // Edit Profile button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditProfileScreen()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: SizeConfig.height(context, 0.06),
                          width: SizeConfig.width(context, 0.4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              SizeConfig.width(context, 0.1),
                            ),
                            gradient: LinearGradient(
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
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.height(context, 0.02),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildProfileOption(context, 'Your Disease', Icons.local_hospital, null),
                  buildProfileOption(context, 'Prescription', Icons.receipt, null),
                  buildProfileOption(context, 'Language', Icons.language, null),
                  buildProfileOption(context, 'Location', Icons.location_on, null),
                  buildProfileOption(context, 'Accuracy', Icons.location_searching, null),
                ],
              ),
            ),
            // Log out button
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff1d4c47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                onPressed: () {},
                child: Text(
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
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Itim",
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
