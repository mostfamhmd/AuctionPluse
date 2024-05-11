import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent(
      {super.key,
      required this.urlImage,
      required this.height,
      required this.width,
      required this.radius});
  final String urlImage;
  final double height;
  final double width;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: SpinKitThreeBounce(
            color: Colors.black,
            size: 24.w,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
        height: height,
        width: width,
      ),
    );
  }
}
