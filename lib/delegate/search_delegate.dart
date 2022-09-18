import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reto_t_evolvers/providers/person_provider.dart';

import '../widgets/person_card.dart';

class SearchButtonDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: personProvider.listPersonsSearch.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            leading:
                Image.network(personProvider.listPersonsSearch[index].image),
            title: Text(personProvider.listPersonsSearch[index].name),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('details',
                arguments: personProvider.listPersonsSearch[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final personProvider = Provider.of<PersonProvider>(context);

    return FutureBuilder(
      future: personProvider.getPersonSearch(query),
      builder: (context, snapshot) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: personProvider.listPersonsSearch.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  leading: Image.network(
                    personProvider.listPersonsSearch[index].image),
                    title: Text(personProvider.listPersonsSearch[index].name,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('details', arguments: personProvider.listPersonsSearch[index]);
              },
            );
          },
        );
      },
    );
  }
}
