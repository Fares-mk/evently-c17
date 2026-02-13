import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart'as auth;

class FirebaseManager {
  static CollectionReference<User> GetUsercollection(){
    var collection = FirebaseFirestore.instance.collection("User").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String,dynamic>? data=snapshot.data();
        return User.FromFirestore(data!);
      },
      toFirestore: (user, options) {
        return user.ToFirestore();
      },);
    return collection;
  }
  static Future<void> addUser({required String uid,required User user}) {
    var collection= GetUsercollection();
    var doc=collection.doc(uid);
    return doc.set(user);
  }
  static Future<User?> getUser()async{
    var collection = GetUsercollection();
    var doc=collection.doc(auth.FirebaseAuth.instance.currentUser?.uid);
    var snapshot=await doc.get();
    return snapshot.data();
  }

}
