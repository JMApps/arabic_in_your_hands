import 'package:flutter/material.dart';

class PlaySpeed extends StatelessWidget {
  const PlaySpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Wrap(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Скорость воспроизведения',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              RadioListTile(
                title: const Text('0.5x'),
                value: true,
                groupValue: 0,
                onChanged: (onChanged) {},
              ),
              RadioListTile(
                title: const Text('0.75x'),
                value: true,
                groupValue: 1,
                onChanged: (onChanged) {},
              ),
              RadioListTile(
                title: const Text('1x'),
                value: true,
                groupValue: 2,
                onChanged: (onChanged) {},
              ),
              RadioListTile(
                title: const Text('1.5x'),
                value: true,
                groupValue: 3,
                onChanged: (onChanged) {},
              ),
              RadioListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                title: const Text('1.75x'),
                value: true,
                groupValue: 4,
                onChanged: (onChanged) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
