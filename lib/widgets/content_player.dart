import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPlayer extends StatelessWidget {
  const ContentPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(CupertinoIcons.arrow_turn_up_left,
              color: Color(0xFF28B78D)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.play_arrow,
              size: 35, color: Color(0xFF28B78D)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.arrow_turn_up_right,
              color: Color(0xFF28B78D)),
          onPressed: () {},
        ),
      ],
    );
  }
}
