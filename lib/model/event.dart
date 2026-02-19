import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? id;
  String? title;
  String? description;
  String? type;
  String? userId;
  Timestamp? eventDate;
  Event({this.id,required this.userId,required this.type,required this.title,required this.description,required this.eventDate});
  Event.FromFirestore(Map<String,dynamic> data){
    id= data["id"];
    title=data["title"];
    description=data["description"];
    eventDate=data["eventDate"];
    type=data["type"];
    userId=data["userId"];
  }
 Map<String,dynamic> ToFirestore(){
    return{
      "id":id,
      "title":title,
      "description":description,
      "eventDate":eventDate,
      "userId":userId,
      "type":type
    };
  }
}