import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CustomCarouselWidget extends StatefulWidget {
  final List<Widget> listWidgets;

  const CustomCarouselWidget({super.key, required this.listWidgets});

  @override
  CustomCarouselWidgetState createState() => CustomCarouselWidgetState();
}

class CustomCarouselWidgetState extends State<CustomCarouselWidget> {
  bool _isInView = false;
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key ?? const Key('value'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 60) {
          setState(() {
            _isInView = true;
          });
        } else {
          setState(() {
            _isInView = false;
          });
        }
      },
      child: Column(
        children: [
          CarouselSlider(
            items: widget.listWidgets,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: _isInView,
                enlargeCenterPage: true,
                height: 400,
                aspectRatio: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.listWidgets.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 4.0,
                  height: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
