import 'package:flutter/material.dart';

class ImageAssetComponent extends StatelessWidget {
  final String url;
  final double margin;
  final double height;
  final double width;
  const ImageAssetComponent(
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
        child: Image.asset(url),
      ),
    );
  }
}
