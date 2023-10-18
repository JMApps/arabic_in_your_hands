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
      count: length,
      controller: controller,
      onDotClicked: (index) => controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 75),
        curve: Curves.slowMiddle,
      ),
      effect: ScrollingDotsEffect(
        maxVisibleDots: 5,
        dotWidth: 8,
        dotHeight: 12,
        activeDotColor: appColors.secondary,
      ),
    );
  }
}
