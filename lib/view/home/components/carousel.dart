import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pratik_portfolio/Utils/screen_helper.dart';
import 'package:pratik_portfolio/view/home/components/carousel_item.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});
  final CarouselSliderController controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight =
        MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .8);
    return SizedBox(
      height: carouselContainerHeight,
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items:
                  List.generate(
                    carouselItem.length,
                    (index) => Builder(
                      builder:
                          (BuildContext context) => Container(
                            constraints: BoxConstraints(
                              minHeight: carouselContainerHeight,
                            ),
                            child: ScreenHelper(
                              _buildMobile(context, carouselItem[index].text),
                              _buildTablet(
                                context,
                                carouselItem[index].text,
                                carouselItem[index].image,
                              ),
                              _buildDesktop(
                                context,
                                carouselItem[index].text,
                                carouselItem[index].image,
                              ),
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

Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: Container(
      constraints: BoxConstraints(maxWidth: 1000, minWidth: 1000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [text, image],
      ),
    ),
  );
}

Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: Container(
      constraints: BoxConstraints(
        maxWidth: 800,
        minWidth: 800,
        maxHeight: MediaQuery.of(context).size.height * .6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [text, image],
      ),
    ),
  );
}

Widget _buildMobile(BuildContext context, Widget text) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * .8,
    ),
    width: double.infinity,
    child: Center(child: text),
  );
}
