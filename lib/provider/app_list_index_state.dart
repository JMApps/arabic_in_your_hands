import 'package:flutter/material.dart';

class AppListIndexState with ChangeNotifier {
  int _chapterIndex  = 0;

  int get getChapterIndex => _chapterIndex;

  int _subChapterIndex = 0;

  int get getSubChapterIndex => _subChapterIndex;

  updateChapterIndex(int newIndex) {
    _chapterIndex = newIndex;
    notifyListeners();
  }

  updateSubChapterIndex(int newIndex) {
    _subChapterIndex = newIndex;
    notifyListeners();
  }
}