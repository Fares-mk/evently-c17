import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManager {
  static late SharedPreferences share;

  static  init()async{
    share=await SharedPreferences.getInstance();
  }
  static  saveTheme(ThemeMode newMode){
    if(newMode==ThemeMode.dark){
      share.setString("Theme", "dark");
    }else{
      share.setString("Theme","light");
    }
  }
  static getTheme(){
    String value=share.getString("Theme")??"dark";
    if(value=="dark"){
      return ThemeMode.dark;
    }
    else{
      return ThemeMode.light;
    }
  }
  static saveSwitch(bool Switch){
    if(Switch==false){
      share.setBool("switch", false);
    }else{
      share.setBool("switch",true);
    }
  }
  static getSwitch(){
    bool value=share.getBool("switch")??false;
    return value;
  }
}