import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_t_evolvers/models/person_model.dart';
import 'package:reto_t_evolvers/models/preferences.dart';
import 'package:reto_t_evolvers/providers/person_provider.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Hero(
                  tag: person.id,
                  child: Image.network(
                    person.image,
                    fit: BoxFit.cover,
                    height: size.height * 0.23,
                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: person.favorite ? Colors.green : Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      personProvider.isFavorite(person);
                      Preferences.setFavorite(person);
                      print('FAVORITES:');
                      print(Preferences.getFavorites());
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            person.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.height * 0.02),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.circle,
                color: (person.status != 'Alive') ? Colors.red : Colors.green,
                size: size.height * 0.02,
              ),
              SizedBox(width: 5),
              Text(
                person.status,
                style:
                    TextStyle(color: Colors.grey, fontSize: size.height * 0.02),
              )
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed('details', arguments: person);
      },
    );
  }
}
