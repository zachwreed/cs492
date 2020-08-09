import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  File image;
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getImage();
  }

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
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Center(
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
                  onSaved: (value) {},
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
                      Navigator.of(context).pop(true);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
