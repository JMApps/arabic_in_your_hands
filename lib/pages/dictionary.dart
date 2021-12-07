import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dictionary extends StatelessWidget {
  const Dictionary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: TextButton.icon(
          label: const Text(
            'На стадии разработки',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF243743),
            ),
          ),
          icon: const Icon(
            CupertinoIcons.chevron_left_slash_chevron_right,
            color: Color(0xFF243743),
          ),
          onPressed: null,
        ),
      ),
    );
  }
}
