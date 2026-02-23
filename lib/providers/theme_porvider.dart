import 'package:evently_c17/core/remote/local/memory_manager.dart';
import 'package:evently_c17/core/resources/AppConstants.dart';
import 'package:flutter/material.dart';

class ThemePorvider extends ChangeNotifier{
  ThemeMode mode=ThemeMode.dark;
  void initTheme(){
    mode=MemoryManager.getTheme();

    notifyListeners();
  }
  void changeTheme(ThemeMode newMode){
      mode=newMode;
      notifyListeners();
      MemoryManager.saveTheme(newMode);
  }
}