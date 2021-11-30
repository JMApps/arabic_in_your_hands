import 'package:arabicinyourhands/provider/content_settings_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
                    onPressed: null,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: CupertinoSlider(
                          activeColor: const Color(0xFF243743),
                          min: 14,
                          max: 50,
                          value: context
                              .watch<ContentSettingsState>()
                              .getTextArabicSize
                              .toDouble(),
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateTextArabicSize(value.toInt());
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${context.watch<ContentSettingsState>().getTextArabicSize}',
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFF243743)),
                        ),
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
                    onPressed: null,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: CupertinoSlider(
                          activeColor: const Color(0xFF243743),
                          min: 14,
                          max: 50,
                          value: context
                              .watch<ContentSettingsState>()
                              .getTextTranslationSize
                              .toDouble(),
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateTextTranslationSize(value.toInt());
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${context.watch<ContentSettingsState>().getTextTranslationSize}',
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFF243743)),
                        ),
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
                    onPressed: null,
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
                          value: 0,
                          groupValue: context
                              .watch<ContentSettingsState>()
                              .getArabicFontRadioGroupValue,
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateArabicRadioValue(0);
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: 1,
                          groupValue: context
                              .watch<ContentSettingsState>()
                              .getArabicFontRadioGroupValue,
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateArabicRadioValue(1);
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: 2,
                          groupValue: context
                              .watch<ContentSettingsState>()
                              .getArabicFontRadioGroupValue,
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateArabicRadioValue(2);
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'السلام عليكم!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF243743),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
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
                          value: 0,
                          groupValue: context
                              .watch<ContentSettingsState>()
                              .getTranslationFontRadioGroupValue,
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateTranslationRadioValue(0);
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: 1,
                          groupValue: context
                              .watch<ContentSettingsState>()
                              .getTranslationFontRadioGroupValue,
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateTranslationRadioValue(1);
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Radio(
                          activeColor: const Color(0xFF243743),
                          value: 2,
                          groupValue: context
                              .watch<ContentSettingsState>()
                              .getTranslationFontRadioGroupValue,
                          onChanged: (value) {
                            context
                                .read<ContentSettingsState>()
                                .updateTranslationRadioValue(2);
                          },
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'Ассаляму аляйкум!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF243743),
                        ),
                      ),
                    ),
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
                  ToggleButtons(
                    selectedColor: Colors.blueGrey[800],
                    children: const [
                      Icon(Icons.format_align_left),
                      Icon(Icons.format_align_center),
                      Icon(Icons.format_align_right),
                    ],
                    isSelected:
                        context.watch<ContentSettingsState>().getIsSelected,
                    onPressed: (index) {
                      context
                          .read<ContentSettingsState>()
                          .updateToggleTextLayout(index);
                    },
                  ),
                  const Divider(),
                  MaterialButton(
                    color: const Color(0xFF243743),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Закрыть',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
