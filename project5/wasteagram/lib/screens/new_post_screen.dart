import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:wasteagram/models/firestore_post.dart';

class NewPostFormScreen extends StatelessWidget {
  static const routeName = '/new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New Post"),
      ),
      body: NewPostForm(),
    );
  }
}

class NewPostForm extends StatefulWidget {
  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  LocationData locationData;
  var locationService = Location();
  File image;
  int wastedItems;
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
    _getImage();
  }

  void _getImage() async {
    final PickedFile imagePicked =
        await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (imagePicked != null) {
        image = File(imagePicked.path);
      }
    });
  }

  void _uploadImageAndDocument() async {
    // Create storage reference with timestamp for image
    DateTime timestamp = DateTime.now();
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('${timestamp.millisecondsSinceEpoch}.jpg');

    // upload image
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete; // wait until onComplete to get URL back

    // get URL of image
    final url = await storageReference.getDownloadURL();

    // Create object to upload post
    if (locationData == null) {
      print('LOCATION DATA IS NULL');
    }

    PostDocument post = PostDocument(url, locationData.latitude,
        locationData.longitude, timestamp, wastedItems);

    // upload new post document
    post.upload();
  }

  // Makes async call to get location of device
  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('FAILED to enable service. Returning.');
          return;
        }
      }

      // check if user has allowed for permissions
      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('LOCATION service permission not granted. Returning.');
        }
      }
      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('ERROR: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.file(image),
                SizedBox(height: 40),
                Form(
                  key: formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Number of Wasted Items',
                      border: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a number';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      wastedItems = int.parse(value);
                    },
                  ),
                ),
                SizedBox(height: 40),
                ButtonTheme(
                  minWidth: 150.0,
                  height: 150.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.cloud_upload,
                      size: 90,
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        _uploadImageAndDocument();
                        Navigator.of(context).pop(true);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
