import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _surahs = [];
  List<String> get Surahs => _surahs;

  void toggleFavorite(String Surah) {
    final isExist = _surahs.contains(Surah);
    if (isExist) {
      _surahs.remove(Surah);
    } else {
      _surahs.add(Surah);
    }
    notifyListeners();
  }

  bool isExist(String Surah) {
    final isExist = _surahs.contains(Surah);
    return isExist;
  }

  void clearFavorite() {
    _surahs = [];
    notifyListeners();
  }
}
