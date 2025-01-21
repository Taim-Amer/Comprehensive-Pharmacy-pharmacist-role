import "package:comprehensive_pharmacy_pharmacy_role/common/widgets/loaders/shimmer_loader.dart";
import "package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart";
import "package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart";
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.padding,
    this.border,
    this.width,
    this.height,
    this.onPressed,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.fit = BoxFit.cover,
    this.backgroundColor = TColors.light,
    this.isNetworkImage = false,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: isNetworkImage ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: (context, url) => const ShimmerLoader(width: double.infinity, height: double.infinity),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ) : Image.asset(
            imageUrl,
            fit: fit,
          ),
        ),
      ),
    );
  }
}