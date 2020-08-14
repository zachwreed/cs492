import 'package:flutter/material.dart';
import 'package:wasteagram/models/firestore_post.dart';

class PostDetails extends StatefulWidget {
  final PostDocument post;

  PostDetails(this.post);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
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
            Text(
              '${widget.post.getFormattedDateString()}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            image,
            SizedBox(height: 40),
            Text(
              'Items ${widget.post.quantity}',
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
