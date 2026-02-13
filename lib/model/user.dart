class User {
  String? name;
  String? email;
  String? id;

  User({required this.id,required this.email,required this.name});

  User.FromFirestore(Map<String,dynamic> data){
    id=data ["id"];
    email=data ["email"];
    name=data ["name"];
  }
  Map<String,dynamic> ToFirestore(){
    return{
      "id":id,
      "email":email,
      "name":name,
    };
  }
}
