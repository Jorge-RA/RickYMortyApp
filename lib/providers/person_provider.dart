import 'package:flutter/cupertino.dart';
import 'package:reto_t_evolvers/models/person_model.dart';
import 'package:reto_t_evolvers/models/preferences.dart';
import 'package:reto_t_evolvers/services/persons_services.dart';

class PersonProvider extends ChangeNotifier {
  List<Person> listPersons = [];
  List<String> listPersonsFavorites = [];
  List<Person> listPersonsSearch = [];

  void isFavorite(Person person) {
    person.favorite = !person.favorite;
    try {
      //En caso de que ya esté cargado en la Lista...
      listPersons.setAll(listPersons.indexOf(person), [person]);
    } catch (e) {
      listPersonsFavorites.add(person.id.toString());
    }
    notifyListeners();
  }

  Future<List<Person>> getPersons() async {
    //await Preferences.prefs.remove('myFavorites'); <- Clear all favorites
    listPersons = await PersonServices().getPersons(page: 1);
    var page2 = await PersonServices().getPersons(page: 2);
    listPersons.addAll(page2);
    listPersonsFavorites = Preferences.getFavorites();

    listPersons.forEach((person) async {
      if (listPersonsFavorites.contains(person.id.toString())) {
        person.favorite = true;
        listPersons.setAll(listPersons.indexOf(person), [person]);
      }
    });

    notifyListeners();
    return listPersons;
  }

  Future<List<Person>> getPersonSearch(String word) async {
    listPersonsSearch.clear();
    listPersonsSearch = await PersonServices().search(word);

    listPersonsSearch.forEach((person) async {
      if (listPersonsFavorites.contains(person.id.toString())) {
        person.favorite = true;
        listPersonsSearch.setAll(listPersonsSearch.indexOf(person), [person]);
      }
    });

    return listPersonsSearch;
  }
}
