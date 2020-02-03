import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/atoms/placeholder_image.dart';

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
    return Container(
      margin: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          placeholder: (context, url) => PlaceholderImage(),
          errorWidget: (context, url, error) => PlaceholderImage(),
        ),
      ),
    );
  }
}
