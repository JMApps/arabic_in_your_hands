import 'package:flutter/material.dart';

class ContentVolumeOne extends StatelessWidget {
  const ContentVolumeOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Содержимое'),
        backgroundColor: const Color(0xFF696F76),
      ),
      body: Container(
      ),
    );
  }
}
