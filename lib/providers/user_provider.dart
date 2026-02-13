import 'package:evently_c17/core/remote/firestore/firestore_manager.dart';
import 'package:evently_c17/model/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  User? user;
  getUserFromFirestore()async{
    user=await FirebaseManager.getUser();
    notifyListeners();

  }
}