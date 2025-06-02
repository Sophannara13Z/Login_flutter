
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {


  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries",
  ];

  List<String> dataSearch = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return Scaffold();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    List<String> suggestionList = query.isEmpty ? searchTerms : searchTerms.where((items) => 
      items.toLowerCase().contains(query.toLowerCase())
    ).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext content, int index){
        return Card(
              elevation: 1,
              child: ListTile(
                trailing: Icon(Icons.navigate_next),
                leading: Icon(Icons.favorite),
                title: Text("${suggestionList[index]}"),),
            );
    });
  }
}