import 'package:flutter/material.dart';

const kThumbnailSize = 80;

class NetworkThumbnail extends StatelessWidget {
  final String imageUrl;
  final int height;
  final int width;

  NetworkThumbnail({
    @required this.imageUrl,
    this.height = kThumbnailSize,
    this.width = kThumbnailSize,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      fadeInDuration: Duration(milliseconds: 200),
      fadeOutDuration: Duration(milliseconds: 200),
      placeholder: 'assets/images/placeholder.jpg',
      placeholderCacheHeight: this.height,
      placeholderCacheWidth: this.width,
      image: imageUrl,
      imageCacheHeight: this.height,
      imageCacheWidth: this.width,
    );
  }
}
