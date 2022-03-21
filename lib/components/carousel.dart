import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';

final List<String> imgList = [
  "images/img-1.jpeg",
  "images/img-2.jpeg",
  "images/img-3.jpeg",
  "images/img-4.jpeg",
  "images/img-5.jpeg",
  "images/img-6.jpeg",
  "images/img-7.jpeg",
  "images/img-8.jpeg",
];

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    width: 1,
                    color: kGold,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kGold.withOpacity(0.5),
                      blurRadius: 3,
                    )
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ))
        .toList();

    return Column(children: [
      CarouselSlider(
        items: _imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 16 / 9,
            // enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? kGold
                        : kdark)
                    .withOpacity(_current == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
