import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainSmoothPageIndicator extends StatelessWidget {
  const MainSmoothPageIndicator({
    super.key,
    required this.controller,
    required this.length,
  });

  final PageController controller;
  final int length;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return SmoothPageIndicator(
      onDotClicked: (index) => controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 50),
        curve: Curves.slowMiddle,
      ),
      controller: controller,
      count: length,
      effect: ScrollingDotsEffect(
        maxVisibleDots: 7,
        dotWidth: 8,
        dotHeight: 8,
        dotColor: Colors.grey,
        activeDotColor: appColors.secondary,
      ),
    );
  }
}
