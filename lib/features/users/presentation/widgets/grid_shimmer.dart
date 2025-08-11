import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:users/core/utils/app_colors.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (_, __) => const ShimmerBox(
        height: 100,
        width: 100,
      ),
      itemCount: 15,
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double height;
  final double? width;
  final Widget? child;

  const ShimmerBox({
    super.key,
    this.height = 8,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: const Color(0xFFF9FAFB),
      child: child != null
          ? child!
          : Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius:
                    BorderRadius.circular(height > 24 ? 8 : height / 4),
              ),
              child: child,
            ),
    );
  }
}
