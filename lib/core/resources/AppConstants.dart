abstract final class AppConstants {
  static const String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const List<String> type=[
    "Sport","Birthday","BookClub","Exhlbition","Meeting"
  ];
}

extension CharactersLength on String{
  int getCharactersLength(){
    return this.length;
  }
}