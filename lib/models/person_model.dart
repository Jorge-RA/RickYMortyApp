import 'dart:convert';

import 'package:reto_t_evolvers/services/persons_services.dart';

class PersonModel {
  List<Person> listPersons = [];

  PersonModel({required List<Person> listPersonsFromJson}) {
    this.listPersons.addAll(listPersonsFromJson);
  }

  factory PersonModel.fromJson(String payload) {
    final List<Person> listPersons = [];

    //final Map<String, dynamic> payloadMap = json.decode(payload);

    try {
      var payloadMap = jsonDecode(payload);
      payloadMap['results'].forEach((person) {
        listPersons.add(Person(person: person));
      });
    } catch (e) {
      print(e);
    }

    return PersonModel(listPersonsFromJson: listPersons);
  }
}

class Person {
  final Map<String, dynamic> person;

  Person({required this.person}) {
    id = person["id"];
    name = person["name"];
    status = person["status"];
    species = person["species"];
    type = person["type"];
    gender = person["gender"];
    origin = person["origin"]['name'];
    location = person["location"]['name'];
    image = person["image"];
    getFirstCap(id);
  }

  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String origin;
  late String location;
  late String image;
  String? firstCap;
  bool favorite = false;

  Future<void> getFirstCap(int id) async {
    firstCap = await PersonServices().getFirstCap(id);
  }
}
