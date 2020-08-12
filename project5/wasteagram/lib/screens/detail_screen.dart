import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/models/firestore_post.dart';

// https://api.flutter.dev/flutter/widgets/Image/loadingBuilder.html
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
    image = Image.network(widget.post.imgUrl, loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
              : null,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image,
            SizedBox(height: 40),
            Text(
              'Items ${widget.post.wastedItems}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 80),
            Text(
              'Location (${widget.post.latitude}, ${widget.post.longitude})',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
