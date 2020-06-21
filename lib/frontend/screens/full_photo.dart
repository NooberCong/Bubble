import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullPhoto extends StatelessWidget {
  final String title;
  final String url;

  const FullPhoto({Key key, @required this.url, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: PhotoView(
        maxScale: 3,
        minScale: 1,
        imageProvider: NetworkImage(url),
        loadFailedChild: Image.asset("assets/images/img_not_available.jpeg"),
      ),
    );
  }
}
