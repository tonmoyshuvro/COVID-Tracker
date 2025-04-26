import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Search extends SearchDelegate {

  final List countryList;
  Search(this.countryList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Color(0xff251539),
      inputDecorationTheme: InputDecorationTheme(hintStyle: Theme.of(context).textTheme.title.copyWith(color: Colors.white.withOpacity(0.3)),),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
//      primaryColorBrightness: Brightness.dark,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
          ),
    );
  }
  @override
  String get searchFieldLabel => 'Search Country';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
        .where((element) =>
        element['country'].toString().toLowerCase().startsWith(query))
        .toList();
    return Container(
      color: Color(0xff301B4A),
      child: ListView.builder(
          itemCount: suggestionList == null ? 0 : suggestionList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xff251539),
                borderRadius: BorderRadius.circular(18.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
//                          width: 200,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AutoSizeText(
                                  suggestionList[index]['country'].toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                AutoSizeText(
                                  suggestionList[index]['cases'].toString(),
                                  minFontSize: 28,
                                  style: TextStyle(
                                    fontFamily: 'Circular',
                                    color: Colors.redAccent,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                AutoSizeText(
                                  'Recovered: ' +
                                      suggestionList[index]['recovered']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                AutoSizeText(
                                  'Deaths: ' +
                                      suggestionList[index]['deaths'].toString(),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(suggestionList[index]
                          ['countryInfo']['flag']
                              .toString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();

    return Container(
      color: Color(0xff301B4A),
      child: ListView.builder(
          itemCount: suggestionList == null ? 0 : suggestionList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xff251539),
                borderRadius: BorderRadius.circular(18.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
//                          width: 200,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AutoSizeText(
                                  suggestionList[index]['country'].toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                AutoSizeText(
                                  suggestionList[index]['cases'].toString(),
                                  minFontSize: 28,
                                  style: TextStyle(
                                    fontFamily: 'Circular',
                                    color: Colors.redAccent,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                AutoSizeText(
                                  'Recovered: ' +
                                      suggestionList[index]['recovered']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                AutoSizeText(
                                  'Deaths: ' +
                                      suggestionList[index]['deaths'].toString(),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(suggestionList[index]
                                  ['countryInfo']['flag']
                              .toString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
