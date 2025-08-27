import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AvatarShimmer extends StatelessWidget {
  final double radius;

  const AvatarShimmer({
    super.key,
    this.radius = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
      ),
    );
  }
}
