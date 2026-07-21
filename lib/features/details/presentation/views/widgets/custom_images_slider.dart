import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CustomImagesSlider extends StatelessWidget {
  const CustomImagesSlider({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      onPageChanged: (value) {},
      autoPlayInterval: 3000,
      isLoop: true,
      children: images
          .map(
            (element) => SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: element,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
