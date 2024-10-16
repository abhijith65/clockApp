import 'package:flutter/material.dart';

class Settings with ChangeNotifier{
  Settings(){
    debugPrint('con');
  }
  bool _isdark= false;
  bool get isdark=> _isdark;
  void setTheme(){
    _isdark = !_isdark;
    notifyListeners();
    debugPrint('settheme');
  }
}