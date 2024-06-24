import 'package:cached_network_image/cached_network_image.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  const CustomCashedNetworkImage({
    super.key,
    required this.url,
    required this.width,
    this.height,
  });

  final String url;
  final double? height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: (height == null) ? null : height,
      width: width,
      fit: BoxFit.fill,
      placeholder: (context, url) => Skeletonizer(
        enabled: true,
        child: Image.asset(
          AppAssets.event,
          width: width,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
