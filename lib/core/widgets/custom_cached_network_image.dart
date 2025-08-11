import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:users/core/utils/app_colors.dart';
import 'package:users/features/users/presentation/widgets/grid_shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imgUrl,
    this.placeholderPath,
    this.fit,
    this.width = 213,
    this.height = 167,
    this.borderRadius,
    this.errorWidget,
  });

  final double? height;
  final double? width;

  final String imgUrl;
  final String? placeholderPath;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    const userPlaceHolder =
        "https://t3.ftcdn.net/jpg/03/45/05/92/360_F_345059232_CPieT8RIWOUk4JqBkkWkIETYAkmz2b75.jpg";

    return CachedNetworkImage(
      imageUrl: imgUrl,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(5)),
          color: AppColors.white,
        ),
        child: const ShimmerBox(),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ?? Image.network(userPlaceHolder),
    );
  }
}
