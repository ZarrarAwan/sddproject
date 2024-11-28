
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SignupPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const SignupPage({super.key, required this.cameras});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late double deviceHeight;
  late double deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
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
              MaterialPageRoute(builder: (context) => RegisterScreen(cameras: widget.cameras)),
                  (route) => false, // Remove all previous routes
            );
          },
        ),
      ),
      body: Container(
        width: deviceWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: deviceHeight * 0.0940,
                left: deviceWidth * 0.0916,
              ),

            ),
            SizedBox(height: deviceHeight * 0.0287),
            Align(
              alignment: Alignment.center,
              child: form(),
            ),
          ],
        ),
      ),
    );
  }

  Widget form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        title(),
        SizedBox(height: deviceHeight * 0.0710),
        emailInput(),
        SizedBox(height: deviceHeight * 0.0562),
        passwordInput(),
        SizedBox(height: deviceHeight * 0.1341),
        LoginButton(),
      ],
    );
  }

  Widget title() {
    return Container(
      width: deviceWidth * 0.6,
      height: deviceHeight * 0.0675,
      decoration: BoxDecoration(
        color: const Color(0xff0e1817),
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: const Text(
        'LOGIN/SIGNUP',
        style: TextStyle(
          fontFamily: 'Jacques',
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget emailInput() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EMAIL',
          style: TextStyle(
            fontFamily: 'Jacques',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        SizedBox(height: deviceHeight * 0.0506),
        Container(
          width: deviceWidth * 0.5,
          height: deviceHeight * 0.0675,
          padding: EdgeInsets.only(
            left: deviceWidth * 0.0781,
            bottom: deviceHeight * 0.0202,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff0e1817),
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'ENTER EMAIL ADDRESS',
              hintStyle: TextStyle(
                fontFamily: 'Jacques',
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PASSWORD',
          style: TextStyle(
            fontFamily: 'Jacques',
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        SizedBox(height: deviceHeight * 0.0506),
        Container(
          padding: EdgeInsets.only(
            left: deviceWidth * 0.1281,
            bottom: deviceHeight * 0.0202,
          ),
          width: deviceWidth * 0.6,
          height: deviceHeight * 0.0675,
          decoration: BoxDecoration(
            color: const Color(0xff0e1817),
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'ENTER PASSWORD',
              hintStyle: TextStyle(
                fontFamily: 'Jacques',
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget LoginButton() {
    return Container(
      width: deviceWidth * 0.35,
      height: deviceHeight * 0.0875,
      decoration: BoxDecoration(
        color:  Colors.teal[700],
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: Text(
        'LOGIN',
        style: TextStyle(
          fontFamily: 'Jacques',
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
