import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _surahs = [];
  // ignore: non_constant_identifier_names
  List<String> get Surahs => _surahs;

  // ignore: non_constant_identifier_names
  void toggleFavorite(String Surah) {
    final isExist = _surahs.contains(Surah);
    if (isExist) {
      _surahs.remove(Surah);
    } else {
      _surahs.add(Surah);
    }
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  bool isExist(String Surah) {
    final isExist = _surahs.contains(Surah);
    return isExist;
  }

  void clearFavorite() {
    _surahs = [];
    notifyListeners();
  }
}
