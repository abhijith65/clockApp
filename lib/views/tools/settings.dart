import 'package:flutter/material.dart';

class Settings with ChangeNotifier{
  Settings(){
    debugPrint('settings');
  }
  bool _isdark= false;
  bool get isdark=> _isdark;
  void setTheme(){
    _isdark = !_isdark;
    notifyListeners();
    debugPrint('settheme');
  }

  Locale _locale= Locale('en');
  Locale get locale=> _locale;
  void setLocale(Locale locale){
    if(!L10n.all.contains(locale)) return;
    _locale=locale;
    notifyListeners();
    debugPrint('setlocale');
  }
}
class L10n{
  static final all=[
    const Locale('en'),
    const Locale('hi')
  ];
}