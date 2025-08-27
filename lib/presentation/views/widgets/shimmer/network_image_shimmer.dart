import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'shimmer_laoding.dart';

class ShimmerNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;
  final VoidCallback? onLoadComplete;

  const ShimmerNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
    this.fit = BoxFit.cover,
    this.onLoadComplete,
  });

  @override
  Widget build(BuildContext context) {
    // Check if URL is empty or not valid
    if (imageUrl.isEmpty || !Uri.tryParse(imageUrl)!.isAbsolute) {
      return _buildErrorContainer(context);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => ShimmerLoading(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        errorWidget: (context, url, error) {
          return _buildErrorContainer(context);
        },
        imageBuilder: (context, imageProvider) {
          // Appeler le callback une fois que l'image est chargée
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onLoadComplete?.call();
          });
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorContainer(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: const Icon(Icons.image_not_supported, color: Colors.grey),
    );
  }
}
