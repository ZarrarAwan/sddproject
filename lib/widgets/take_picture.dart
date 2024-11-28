// import 'package:flutter/material.dart';
//
// import '../main.dart';
//
// class TakePicture extends StatefulWidget {
//   const TakePicture({super.key});
//
//   @override
//   State<TakePicture> createState() => _TakePictureState();
// }
//
// class _TakePictureState extends State<TakePicture> {
//   late double deviceHeight;
//   late double deviceWidth;
//   @override
//   Widget build(BuildContext context) {
//     deviceWidth = MediaQuery.of(context).size.width;
//     deviceHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.close, color: Colors.white, size: 30),
//           onPressed: () {
//             // Navigate back to the SplashScreen when the "X" is clicked
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreen()),
//                   (route) => false, // Remove all previous routes
//             );
//           },
//         ),
//       ),
//       body: Container(
//         height: deviceHeight,
//         width: deviceWidth,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xff0d0f0f),
//               Color(0xff132d2a),
//             ],
//             begin: Alignment.topCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//
//             header(),
//             SizedBox(height: deviceHeight * 0.1903),
//             Center(
//               child: Image.asset('Assets/images/sb.png', height: 350, width: 350,),
//             ),
//             // Image.asset('Assets/images/sb.png', height: 170, width: 170,),
//             SizedBox(height: deviceHeight * 0.07),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: footer(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget header() {
//     return Container(
//       margin: EdgeInsets.only(
//         top: deviceHeight * 0.0608,
//         right: deviceWidth * 0.0322,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             'Assets/images/camera.png',
//             height: 30,
//             width: 30,
//           ),
//           SizedBox(height: deviceHeight * 0.01500),
//           Image.asset(
//             'Assets/images/l.png',
//             height: 30,
//             width: 30,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget footer() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
//           child: Image.asset(
//             'Assets/images/icons.png',
//             height: 70,
//             width: 70,
//
//           ),
//         ),
//
//         Image.asset(
//           'Assets/images/circle.png',
//           height: 90,
//           width: 90,
//         ),
//         Image.asset(
//           'Assets/images/gallery.png',
//           height: 70,
//           width: 70,
//         ),
//       ],
//     );
//   }
// }
