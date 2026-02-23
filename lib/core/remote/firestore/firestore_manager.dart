import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/model/event.dart';
import 'package:evently_c17/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart'as auth;

class FirebaseManager {
  static CollectionReference<User> GetUsercollection() {
    var collection = FirebaseFirestore.instance
        .collection("User")
        .withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data = snapshot.data();
        return User.FromFirestore(data!);
      },
      toFirestore: (user, options) {
        return user.ToFirestore();
      },);
    return collection;
  }

  static CollectionReference<Event> GetEventcollection() {
    var collection = FirebaseFirestore.instance
        .collection("Event")
        .withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data = snapshot.data();
        return Event.FromFirestore(data!);
      },
      toFirestore: (event, options) {
        return event.ToFirestore();
      },);
    return collection;
  }

  static CollectionReference<Event> GetUserFavourites() {
    var collection = GetUsercollection();
    var doc = collection.doc(auth.FirebaseAuth.instance.currentUser?.uid);
    var favouritecollection = doc.collection("Favourite").withConverter(
      fromFirestore: (snapshot, options) {
        Map<String, dynamic>? data = snapshot.data();
        return Event.FromFirestore(data!);
      },
      toFirestore: (user, options) {
        return user.ToFirestore();
      },);
    return favouritecollection;
  }

  static Future<void> addUser({required String uid, required User user}) {
    var collection = GetUsercollection();
    var doc = collection.doc(uid);
    return doc.set(user);
  }

  static Future<User?> getUser() async {
    var collection = GetUsercollection();
    var doc = collection.doc(auth.FirebaseAuth.instance.currentUser?.uid);
    var snapshot = await doc.get();
    return snapshot.data();
  }

  static Future<void> addEvent(Event event) {
    var collection = GetEventcollection();
    var doc = collection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<Event>> getEvent() async {
    var collection = GetEventcollection();
    var doc = await collection.get();
    var querySnapshot = doc.docs;
    List<Event> events = querySnapshot
        .map((documnet) => documnet.data(),)
        .toList();
    return events;
  }

  static Stream<List<Event>> getEventRealtime() async* {
    var collection = GetEventcollection();
    var querySnapshot = collection.snapshots();
    var snapshot = querySnapshot.map((document) => document.docs,);
    var event = snapshot.map((document) =>
        document.map((e) => e.data(),).toList(),);
    yield* event;
  }

  static Stream<List<Event>> getTypeEvent(String type) async* {
    var collection = GetEventcollection();
    var doc = await collection.where("type", isEqualTo: type).get();
    var querySnapshot = doc.docs;
    List<Event> events = querySnapshot
        .map((documnet) => documnet.data(),)
        .toList();
    yield events;
  }

  static Future<void> addFavouriteEvent(Event event) {
    var collection = GetUserFavourites();
    var doc = collection.doc(event.id);
    return doc.set(event);
  }

  static Future<void> updateFavouriteEvent(List<String> newFavourite) {
    var collection = GetUserFavourites();
    var doc = collection.doc(auth.FirebaseAuth.instance.currentUser?.uid);
    return doc.update({
      "favourite": newFavourite
    });
  }

  static Future<void> deleteFavouriteEvent(Event event) {
    var collection = GetUserFavourites();
    var doc = collection.doc(event.id);
    return doc.delete();
  }

  static Stream<List<Event>> getUserFavourite() async* {
    var collection = GetUserFavourites();
    var querySnapshot = collection.snapshots();
    var snapshot = querySnapshot.map((document) => document.docs,);
    var event = snapshot.map((document) =>
        document.map((e) => e.data(),).toList(),);
    yield* event;
  }

  static Future<void> deleteEvent(Event event) {
    var collection = GetEventcollection();
    var doc = collection.doc(event.id);
    return doc.delete();
  }

  static Future<void> updateEvent(Event event) {
    var collection = GetEventcollection();
    var doc = collection.doc(event.id);
    return doc.update({
      "title": event.title,
      "description": event.description,
      "eventDate": event.eventDate,
      "userId": event.userId,
      "type": event.type
    });
  }
}