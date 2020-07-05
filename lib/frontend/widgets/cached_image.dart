import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircularImage extends StatelessWidget {
  final double radius;
  final String imageUrl;

  const CachedCircularImage({Key key, this.radius, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        backgroundImage: imageProvider,
        radius: radius,
      ),
      errorWidget: (context, url, error) =>
          Image.asset("assets/images/img_not_available.jpeg"),
      placeholder: (_, url) => const CircularProgressIndicator(),
    );
  }
}
