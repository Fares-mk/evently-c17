class User {
  String? name;
  String? email;
  String? id;
  List<String>? favourite;
  User({ this.id, this.email, this.name,this.favourite=const []});

  User.FromFirestore(Map<String,dynamic> data){
    id=data ["id"];
    email=data ["email"];
    name=data ["name"];
    favourite=(data["favourite"] as List).cast<String>();
  }
  Map<String,dynamic> ToFirestore(){
    return{
      "id":id,
      "email":email,
      "name":name,
      "favourite":favourite
    };
  }
}
