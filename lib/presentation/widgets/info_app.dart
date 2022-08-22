import 'package:flutter/material.dart';

class InfoApp extends StatelessWidget {
  const InfoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Text(
          'Важная информация!',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
