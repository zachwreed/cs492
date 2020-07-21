import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String phoneNumberDisplay = '555-555-5555';
    final String phoneNumberLaunch = 'sms:5555555555';
    final String githubLink = 'github.com/zachwreed';
    final String githubLinkLaunch = 'https://github.com/zachwreed';
    final String email = 'reedz@oregonstate.edu';

    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.9,
      child: Container(
        // padding: EdgeInsets.only(),
        child: Column(
          children: [
            profilePicture(context),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text("Zachary Reed",
                  style: TextStyle(fontFamily: 'Rowdies', fontSize: 25.0)),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Junior Software Developer",
                style: TextStyle(fontFamily: 'Rowdies', fontSize: 20.0),
              ),
              // SMS launcher
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  launch(phoneNumberLaunch);
                },
                child: Text(phoneNumberDisplay,
                    style: TextStyle(fontFamily: 'Rowdies', fontSize: 15.0)),
              ),
            ),
            // URL and Email
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: paddingRow(context)),
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        launch(githubLinkLaunch);
                      },
                      child: Text(githubLink,
                          style:
                              TextStyle(fontFamily: 'Rowdies', fontSize: 11)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: paddingRow(context)),
                    alignment: Alignment.centerRight,
                    child: Text(email,
                        style: TextStyle(fontFamily: 'Rowdies', fontSize: 11)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profilePicture(BuildContext context) {
    double ratio;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      ratio = 5 / 1;
    } else {
      ratio = 5 / 2;
    }

    return AspectRatio(
      aspectRatio: ratio,
      child: Image(image: AssetImage('assets/images/profile.jpg')),
    );
  }

  double paddingRow(BuildContext context) {
    // if context is landscape
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return MediaQuery.of(context).size.width * 0.2;
    } else {
      return MediaQuery.of(context).size.width * 0.05;
    }
  }
}
