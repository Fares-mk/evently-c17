import 'AppConstants.dart';

class Validations {
  static String? validateEmail(String? value){
    if(value==null || value.isEmpty){
      return "This field is required";
    }
    if(!RegExp(AppConstants.emailRegex).hasMatch(value)){
      return "Enter valid email";
    }
    return null;
  }
  static String? validatePassword(String? value){
    if(value==null || value.isEmpty){
      return "This field is required";
    }
    if(value.length<8){
      return "Password is short";
    }
    return null;
  }
  static String? validateName(String? value){
    if(value==null || value.isEmpty){
      return "This field is required";
    }
    return null;
  }
  static String? validateConfirmPass(String? value,String pass){
    if(value!=pass){
      return "Passwords don't match";
    }
    return null;
  }
}