import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:share/share.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File image;
  final picker = ImagePicker();

  void getImage() async {
    final PickedFile imagePicked =
        await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (imagePicked != null) {
        image = File(imagePicked.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Center(
        child: RaisedButton(
          child: Text('Select Photo'),
          onPressed: () {
            getImage();
          },
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(image),
            SizedBox(height: 40),
            RaisedButton(
              child: Text('Post It!'),
              onPressed: () {},
            ),
          ],
        ),
      );
    }
  }
}
