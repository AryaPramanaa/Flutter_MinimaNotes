import 'package:flutter/material.dart';
import 'package:minima_notes/themes/dark_mode.dart';
import 'package:minima_notes/themes/light_mode.dart';


class ThemeProvider extends ChangeNotifier {
  // initially light Mode

  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  //is dark Mode
  bool get isDarkMode  => _themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData =themeData;

    notifyListeners();

  }

  void toogleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }

  }
}