import 'package:flutter/material.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Material(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            child: Column(
              children: [
                TextField(),
                const SizedBox(height: 8),
                MaterialButton(
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: const Color(0xFF243743),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
