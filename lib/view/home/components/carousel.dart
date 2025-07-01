import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});
  Widget build(BuildContext context) {
    double carouselContainerHeight =
        MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
      height: carouselContainerHeight,
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items:
                  List.generate(
                    5,
                    (index) => Builder(
                      builder:
                          (BuildContext context) => Container(
                            constraints: BoxConstraints(
                              minHeight: carouselContainerHeight,
                            ),
                          ),
                    ),
                  ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
