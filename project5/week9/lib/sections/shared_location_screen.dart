import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

// To add notifications for IOS to allow access to location,
// add the following under <dict> in ios/Runner/info.plist
//    <key>NSLocationAlwaysUsageDescription</key>
//    <string>Needed to access location</string>
//    <key>NSLocationWhenInUseUsageDescription</key>
//    <string>Needed to access location</string>

// To add permissions for IOS to allow photo library usage,
// add the following under <dict> in ios/Runner/info.plist
//    <key>NSPhotoLibraryUsageDescription</key>
//    <string>Selecting a photo from within the app</string>
//    <key>NSCameraUsageDescription</key>
//    <string>Taking a new photo from within the app</string>

// To add notifications for Android to allow access to location,
// add the follwoing under <manifest> in android/app/src/main/AndroidManifest.xml
//    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>

// Android doesn't require additional permission for camera usage

class ShareLocationScreen extends StatefulWidget {
  @override
  _ShareLocationScreenState createState() => _ShareLocationScreenState();
}

class _ShareLocationScreenState extends State<ShareLocationScreen> {
  LocationData locationData;
  var locationService = Location();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  // Makes async call to get location of device
  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }

      // check if user has allowed for permissions
      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }
      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }

    locationData = await locationService.getLocation();
    setState(() {}); // invoke setState to rebuild
  }

  @override
  Widget build(BuildContext context) {
    if (locationData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Latitude: ${locationData.latitude}',
              style: Theme.of(context).textTheme.headline4),
          Text('Longitude:  ${locationData.longitude}',
              style: Theme.of(context).textTheme.headline4),
          RaisedButton(
            child: Text('Share'),
            onPressed: () {
              Share.share(
                  'Hey, meet me at ${locationData.latitude}, ${locationData.longitude}');
            },
          )
        ],
      ));
    }
  }
}
