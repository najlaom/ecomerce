import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ecomerce/components/assets.dart' as assets;

class HomeSwiper extends StatelessWidget {
  final List<String> images = [
    assets.images[0],
    assets.images[2],
    assets.images[1],
    assets.images[3],
    assets.images[0],
    assets.images[2],
    assets.images[1],
    assets.images[3]
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        height: 180,
        child: Swiper(
          scale: 0.8,
          viewportFraction: 0.5,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              images[index],
            );
          },
          itemCount: images.length,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.red,
                size: 5.0,
                activeSize: 7.0),
          ),
        ),
      ),
    );
  }
}
