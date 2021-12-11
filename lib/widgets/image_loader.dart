import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;

  const ImageLoader(
    this.imageUrl, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 1, minHeight: 1),
      child: Image.asset(
        imageUrl,
      ),
    );
  }
}
