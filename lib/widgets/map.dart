import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  final String name;
  const Maps({super.key, required this.name});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late double deviceHeight;
  late double deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff0d0f0f),
                Color(0xff132d2a),
              ],
              begin: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              header(),
              SizedBox(height: deviceHeight * 0.0801),
              map(),
              SizedBox(height: deviceHeight * 0.0515),
              iconBar(),
              const SizedBox(height: 7),
              Text(
                "NEAR ${widget.name.toUpperCase()}",
                style: const TextStyle(
                  fontFamily: 'Itim',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              locations(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset('Assets/images/ba.png'),
        ),

        Container(
          width: deviceWidth * 0.633,
          height: deviceHeight * 0.0349,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: deviceHeight * 0.08,
            left: deviceWidth * 0.0952,
          ),
          decoration: BoxDecoration(
            color: const Color(0x801D9387),
            borderRadius: BorderRadius.all(
              Radius.circular(deviceWidth * 0.0595),
            ),
          ),
          child: Text(
            'SEARCH ${widget.name.toUpperCase()}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Jacques',
            ),
          ),
        ),
      ],
    );
  }

  Widget map() {
    return Image.asset(
      'Assets/images/map.png',
      fit: BoxFit.fill,
      height: 450,
      width: 380,
    );
  }

  Widget iconBar() {
    return Container(
      color: Colors.black,
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'Assets/images/car.png',
            height: 70,
            width: 70,
          ),
          Image.asset(
            'Assets/images/walk.png',
            height: 70,
            width: 70,
          ),
          Image.asset(
            'Assets/images/db.png',
            height: 130,
            width: 100,
          ),
        ],
      ),
    );
  }

  Widget locations() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('Assets/images/key.png'),
            Text(
              '${widget.name} 1',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: "Jaldi",
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('Assets/images/key.png'),
            Text(
              '${widget.name} 2',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: "Jaldi",
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('Assets/images/key.png'),
            Text(
              '${widget.name} 3',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: "Jaldi",
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('Assets/images/key.png'),
            Text(
              '${widget.name} 4',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: "Jaldi",
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('Assets/images/key.png'),
            Text(
              '${widget.name} 5',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: "Jaldi",
              ),
            ),
          ],
        ),
      ],
    );
  }

  double pixelToFlutterPoint(BuildContext context, double pixel) {
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return pixel / devicePixelRatio;
  }
}
