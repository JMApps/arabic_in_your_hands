import 'package:flutter/material.dart';

class MainAppIcon extends StatelessWidget {
  const MainAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.75,
      child: Image.asset(
        'assets/icons/arabic_in_origin.png',
        color: Colors.amber,
      ),
    );
  }
}
