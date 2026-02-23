import 'package:evently_c17/core/resources/AssetsManager.dart';
abstract final class AppConstants {
  static const String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const List<String> type=[
    "Sport","Birthday","BookClub","Exhlbition","Meeting"
  ];
  static const Map<String,String> event={
    "Sport":AssetsManager.sport_light,
    "Birthday":AssetsManager.birthday_light,
    "BookClub":AssetsManager.book_light,
    "Exhlbition":AssetsManager.exhibition_light,
    "Meeting":AssetsManager.meeting_light,
  };
  static const Map<String,String> eventdark={
    "Sport":AssetsManager.sport_dark,
    "Birthday":AssetsManager.birthday_dark,
    "BookClub":AssetsManager.book_dark,
    "Exhlbition":AssetsManager.exhibition_dark,
    "Meeting":AssetsManager.meeting_dark,
  };
}

extension CharactersLength on String{
  int getCharactersLength(){
    return this.length;
  }
}