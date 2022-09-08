import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pandawa/screens/wayang_screen.dart';
import 'package:pandawa/models/search_index.dart';
import 'package:pandawa/models/wayang.dart';

class QuickSearchScreen extends StatelessWidget {
  const QuickSearchScreen({Key? key, this.userSelected}) : super(key: key);

  final String? userSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: TypeAheadField(
        noItemsFoundBuilder: (context) => const SizedBox(
          height: 50,
          child: Center(
            child: Text('Nama wayang tidak ditemukan'),
          ),
        ),
        suggestionsBoxDecoration: const SuggestionsBoxDecoration(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )
        ),
        debounceDuration: const Duration(milliseconds: 300),
        textFieldConfiguration: const TextFieldConfiguration(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            contentPadding: EdgeInsets.only(top: 10, left: 10),
            hintText: 'Cari nama wayang',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )
          ),
        ),
        suggestionsCallback: (value) {
          return SearchIndex.getSuggestions(value);
        },
        itemBuilder: (context, String suggestion) {
          return Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.list,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    suggestion,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          );
        },
        onSuggestionSelected: (String suggestion) {
          int i = SearchIndex.states.indexOf(suggestion);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WayangScreen(
                wayang: wayangList[i],
              )
            )
          );
        }
      )
    );
  }
}