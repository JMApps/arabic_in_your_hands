import 'package:arabicinyourhands/domain/state/provider/play_speed_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaySpeed extends StatelessWidget {
  const PlaySpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getReadPlaySpeed = context.read<PlaySpeedState>();
    final getWatchPlaySpeed = context.watch<PlaySpeedState>();
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
                value: 0,
                groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
                onChanged: (onChanged) {
                  getReadPlaySpeed.changePlaySpeed(0);
                },
              ),
              const Divider(),
              RadioListTile(
                title: const Text('0.75x'),
                value: 1,
                groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
                onChanged: (onChanged) {
                  getReadPlaySpeed.changePlaySpeed(1);
                },
              ),
              const Divider(),
              RadioListTile(
                title: const Text('1x'),
                value: 2,
                groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
                onChanged: (onChanged) {
                  getReadPlaySpeed.changePlaySpeed(2);
                },
              ),
              const Divider(),
              RadioListTile(
                title: const Text('1.5x'),
                value: 3,
                groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
                onChanged: (onChanged) {
                  getReadPlaySpeed.changePlaySpeed(3);
                },
              ),
              const Divider(),
              RadioListTile(
                title: const Text('1.75x'),
                value: 4,
                groupValue: getWatchPlaySpeed.getPlaySpeedIndex,
                onChanged: (onChanged) {
                  getReadPlaySpeed.changePlaySpeed(4);
                },
              ),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
