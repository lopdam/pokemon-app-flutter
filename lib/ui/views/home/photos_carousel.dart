import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PhotosCarousel extends StatelessWidget {
  List<String> photos;

  PhotosCarousel({required this.photos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: photos
            .map((e) => Image.network(
                  e,
                  scale: 0.5,
                ))
            .toList(),
        options: CarouselOptions(
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
