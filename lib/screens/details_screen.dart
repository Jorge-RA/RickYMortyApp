import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_t_evolvers/models/person_model.dart';
import 'package:reto_t_evolvers/models/preferences.dart';
import 'package:reto_t_evolvers/providers/person_provider.dart';
import 'package:reto_t_evolvers/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context)!.settings.arguments as Person;
    final personProvider = Provider.of<PersonProvider>(context, listen: false);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Hero(
                tag: person.id,
                child: Image.network(
                  person.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height: size.height * 0.42,
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: person.name,
                            size: 30,
                            bold: true,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              BoxState(
                                  title: 'Estado', subTitle: person.status),
                              SizedBox(width: 10),
                              BoxState(
                                  title: 'Especie', subTitle: person.species),
                              SizedBox(width: 10),
                              BoxState(
                                  title: 'Género', subTitle: person.gender),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                              text: 'Descripción', size: 20, bold: true),
                          const SizedBox(height: 10),
                          const CustomText(
                            text:
                                'In mollit ea consectetur sit anim consectetur commodo ipsum ullamco. Fugiat dolore proident do non non ad qui non eu veniam irure aute. Exercitation qui amet adipisicing cillum sunt id dolore dolore sint elit enim sit anim. Tempor eu eu dolore nostrud laborum sint ea. Esse elit qui aliqua ex. Consectetur reprehenderit sit dolor consequat. Ipsum voluptate ex aliquip ullamco cillum proident mollit aliquip minim qui.',
                            size: 15,
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                              text: 'Datos personaje', size: 15, bold: true),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: 'Tipo', size: 15),
                              CustomText(
                                text: person.type.isEmpty
                                    ? 'Desconocido'
                                    : person.type,
                                size: 15,
                                bold: true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: 'Debut', size: 15),
                              CustomText(
                                text: person.firstCap ?? 'No info',
                                size: 15,
                                bold: true,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: 'Locación', size: 15),
                              CustomText(
                                  text: person.location, size: 15, bold: true),
                            ],
                          ),
                          const SizedBox(height: 15),
                          FavoriteButton(
                            favoriteColor: person.favorite,
                            onPressed: () {
                              personProvider.isFavorite(person);
                              Preferences.setFavorite(person);
                              print('FAVORITES:');
                              print(Preferences.getFavorites());
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              padding: EdgeInsets.only(top: 40, left: 10),
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
