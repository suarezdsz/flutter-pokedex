import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageNetworkComponent extends StatelessWidget {
  final String url;
  final double margin;
  final double height;
  final double width;
  const ImageNetworkComponent(
      {Key? key,
      required this.url,
      required this.margin,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: SizedBox(
        height: height,
        width: width,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: url,
        ),
      ),
    );
  }
}
