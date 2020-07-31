import 'package:cached_network_image/cached_network_image.dart';
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: PhotoView(
        maxScale: PhotoViewComputedScale.covered * 3,
        minScale: PhotoViewComputedScale.contained,
        imageProvider: CachedNetworkImageProvider(url, scale: 1),
        loadFailedChild: Image.asset("assets/images/img_not_available.jpeg"),
      ),
    );
  }
}
