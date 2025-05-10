import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared/shared.dart';

class BaseNetworkImage extends StatelessWidget {
  final String url;
  final double? radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BoxFit boxFit;
  final ColorFilter? colorFilter;
  final Widget? child;
  final BoxShape? shape;
  final AlignmentGeometry alignment;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final ImageProvider<Object>? errorImageProvider;
  final BorderRadiusGeometry? borderRadius;

  const BaseNetworkImage(
    this.url, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.margin,
    this.boxFit = BoxFit.cover,
    this.colorFilter,
    this.shape,
    this.child,
    this.alignment = Alignment.center,
    this.onTap,
    this.border,
    this.errorImageProvider,
    this.borderRadius,
    // this.errorImageURL,
  });

  Widget _buildContainer({ImageProvider? imageProvider, Color? color}) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        color: color,
        border: border,
        borderRadius: shape != null ? null : borderRadius ?? BorderRadius.circular(radius ?? 10),
        image:
            imageProvider != null
                ? DecorationImage(image: imageProvider, fit: boxFit, colorFilter: colorFilter)
                : null,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder:
          (context, imageProvider) =>
              GestureDetector(onTap: onTap, child: _buildContainer(imageProvider: imageProvider)),
      placeholder: (context, url) => _buildContainer(color: context.colorScheme.surfaceContainer),
      errorWidget:
          (context, url, error) => _buildContainer(
            color: context.colorScheme.surfaceContainer,
            imageProvider: errorImageProvider,
            // imageProvider: errorImageURL != null ? NetworkImage(errorImageURL!) : null,
          ),
    );
  }
}
