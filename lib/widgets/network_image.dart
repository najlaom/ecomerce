import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PNetworkImage extends StatelessWidget {
  final String image;
  final double width, height;
  final BoxFit fit;
  const PNetworkImage(this.image, {Key key, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
