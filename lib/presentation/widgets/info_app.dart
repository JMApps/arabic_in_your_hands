import 'package:arabicinyourhands/domain/constants.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InfoApp extends StatelessWidget {
  const InfoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box(Constants.keyMainSettingBox);
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Важная информация!\n\nУважаемые пользователи приложения!\n\nВы часто пишете нам и спрашиваете, будут ли 3-й и 4-й тома. Отвечаем: ни 3-го, ни 4-го тома в данном приложении не будет. Мы спросили разрешение у издательства учебника оставить эти два тома с диалогами и текстами. Но добавлять сюда остальной материал они нам запретили. Возможно, в приложение будут добавляться другие материалы, но продолжения самого «Байна Ядайк» тут не будет. Мы бы очень хотели сделать все 4 тома, мы стремились к этому, но получили отказ. Хвала Аллаху в любом положении!',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton.icon(
                  icon: Icon(
                    CupertinoIcons.arrow_right_square,
                    color: Theme.of(context).colorScheme.myAccentColor,
                  ),
                  label: Text(
                    'Больше не показывать',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.myAccentColor,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    box.put(Constants.keyAppInfoDialogShow, false);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
