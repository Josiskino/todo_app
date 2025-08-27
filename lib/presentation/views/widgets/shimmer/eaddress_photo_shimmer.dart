import 'package:flutter/material.dart';
import 'shimmer_laoding.dart';

class EAddressPhotoShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final bool isDarkMode;

  const EAddressPhotoShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 12.0,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = isDarkMode || brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ShimmerLoading(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : Colors.grey[300],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

class EAddressPhotosGridShimmer extends StatelessWidget {
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  final bool isDarkMode;

  const EAddressPhotosGridShimmer({
    super.key,
    this.itemCount = 4,
    this.spacing = 8.0,
    this.aspectRatio = 1.0,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = isDarkMode || brightness == Brightness.dark;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: aspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ShimmerLoading(
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[800] : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
