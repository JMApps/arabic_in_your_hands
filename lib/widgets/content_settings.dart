import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentSettings extends StatelessWidget {
  const ContentSettings({Key? key}) : super(key: key);

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(
                    icon: const Icon(
                      CupertinoIcons.textformat_size,
                      color: Color(0xFF1F8D6E),
                    ),
                    label: const Text(
                      'Размер арабского текста',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSlider(
                          min: 14,
                          max: 30,
                          value: 14,
                          onChanged: (onChanged) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '18',
                        style: TextStyle(fontSize: 18, color: Color(0xFF243743)),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    icon: const Icon(
                      CupertinoIcons.textformat_size,
                      color: Color(0xFF1F8D6E),
                    ),
                    label: const Text(
                      'Размер текста перевода',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoSlider(
                          min: 14,
                          max: 30,
                          value: 14,
                          onChanged: (onChanged) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '18',
                        style: TextStyle(fontSize: 18, color: Color(0xFF243743)),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    icon: const Icon(
                      CupertinoIcons.textformat,
                      color: Color(0xFF1F8D6E),
                    ),
                    label: const Text(
                      'Шрифт арабского текста',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: true,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: false,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: false,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  TextButton.icon(
                    icon: const Icon(
                      CupertinoIcons.textformat,
                      color: Color(0xFF1F8D6E),
                    ),
                    label: const Text(
                      'Шрифт текста перевода',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: true,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: false,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: false,
                          groupValue: 0,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  TextButton.icon(
                    icon: const Icon(
                      CupertinoIcons.textformat,
                      color: Color(0xFF1F8D6E),
                    ),
                    label: const Text(
                      'Расположение текста',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  // ToggleButtons(
                  //   selectedColor: Colors.blueGrey[800],
                  //   children: const [
                  //     Icon(Icons.format_align_left),
                  //     Icon(Icons.format_align_center),
                  //     Icon(Icons.format_align_right),
                  //     Icon(Icons.format_align_justify),
                  //   ],
                  //   isSelected: ,
                  //   onPressed: (index) {},
                  // ),
                  const Divider(),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    value: true,
                    onChanged: (value) {},
                    activeColor: const Color(0xFF243743),
                    title: const Text(
                      'Отображать арабский текст',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                  const Divider(),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    value: true,
                    onChanged: (value) {},
                    activeColor: const Color(0xFF243743),
                    title: const Text(
                      'Отображать текст перевода',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
