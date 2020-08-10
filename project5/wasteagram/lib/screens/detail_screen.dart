import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/models/firestore_post.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/post';

  @override
  Widget build(BuildContext context) {
    final PostDocument post = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${post.getFormattedDateString()}'),
      ),
      body: DetailsWidget(post),
    );
  }
}

class DetailsWidget extends StatefulWidget {
  final PostDocument post;

  DetailsWidget(this.post);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  Image image;

  void getImage() {
    image = Image.network(widget.post.imgUrl);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image,
              SizedBox(height: 40),
              Text(
                'Items ${widget.post.wastedItems}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Location (${widget.post.latitude}, ${widget.post.longitude})',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
