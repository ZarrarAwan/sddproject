
import 'package:flutter/material.dart';
import 'package:sddproject/widgets/size_config.dart';

import 'appbar.dart';
import 'constants.dart';
//import 'package:sdd_design/constants.dart';
//import 'package:sdd_design/size_config.dart';
//import 'package:sdd_design/widgets/appbar.dart';

class CommunitySupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        color: Color(0xff0d1f1d),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.height(context, 0.02)),
              width: SizeConfig.width(context, 0.7),
              height: SizeConfig.height(context, 0.06),
              decoration: BoxDecoration(
                  color: Color(0xff1d4c47),
                  borderRadius:
                      BorderRadius.circular(SizeConfig.width(context, 0.1))),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.grey[800],
                        hintText: 'Type here',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.mic, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.height(context, 1),
          decoration: BoxDecoration(
            gradient: GlobalConstants.backgroundGradient,
          ),
          child: Column(
            children: [
              AppBarWidget(title: 'COMMUNITY\n SUPPORT'),
              SizedBox(height: 20),
              Center(
                child: Image.asset('Assets/images/community_support.png',
                    height: 200),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
