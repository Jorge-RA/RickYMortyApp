import 'package:reto_t_evolvers/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences prefs;
  static List<String> _myFavoritesList = [];

  static initInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setFavorite(Person person) {
    //person.favorite = !person.favorite;
    if (person.favorite == true) {
      _myFavoritesList.add(person.id.toString());
      prefs.setStringList('myFavorites', _myFavoritesList);
    } else {
      _myFavoritesList
          .removeWhere((element) => element == person.id.toString());
      prefs.setStringList('myFavorites', _myFavoritesList);
    }
  }

  static List<String> getFavorites() {
    final result = prefs.getStringList('myFavorites');
    if (result == null) {
      return [];
    }
    _myFavoritesList = result;
    return _myFavoritesList;
  }
}
