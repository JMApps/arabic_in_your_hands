import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarCopyMessage extends StatelessWidget {
  const SnackBarCopyMessage({Key? key, required this.content})
      : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      leading: const Icon(CupertinoIcons.doc_on_doc),
      title: const Text(
        'Скопировать',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(8),
            backgroundColor: Color(0xFF243743),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            content: Text(
              'Скопировано',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 750),
          ),
        );
        Navigator.of(context).pop();
      },
    );
  }
}
