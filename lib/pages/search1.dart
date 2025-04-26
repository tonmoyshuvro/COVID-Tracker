import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:percent_indicator/percent_indicator.dart';


class Search1 extends SearchDelegate {
  final List countryList;
  Search1(this.countryList);

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
  String get searchFieldLabel => 'Search District';

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
        element['name'].toString().toLowerCase().startsWith(query))
        .toList();
    int sums()
    {
      int sum = 0;
      for (int i = 0; i<68; i++)
      {
        sum = sum + (countryList[i]['count']);
      }
      return sum;
    }

    return Container(
      color: Color(0xff301B4A),
      child: ListView.builder(
          itemCount: suggestionList == null ? 0 : suggestionList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff251539),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
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
                                    suggestionList[index]['name'].toString(),
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 8.0,),
                                  AutoSizeText(
                                    suggestionList[index]['count'].toString(),
                                    minFontSize: 28,
                                    style: TextStyle(
                                      fontFamily: 'Circular',
                                      color: Colors.redAccent,
                                    ),
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
                          child: CircularPercentIndicator(
                            percent: (suggestionList[index]['count']/sums()),
                            progressColor: Colors.redAccent,
                            backgroundColor: Color(0xff5E4D72),
                            animation: true,
                            lineWidth: 6,
                            radius: 80,
                            circularStrokeCap: CircularStrokeCap.round,
                            addAutomaticKeepAlive: true,
                            center: Text((suggestionList[index]['count']/sums()*100).toStringAsPrecision(3)+'%',
                              style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
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
        element['name'].toString().toLowerCase().startsWith(query))
        .toList();
    int sums()
    {
      int sum = 0;
      for (int i = 0; i<68; i++)
      {
        sum = sum + (countryList[i]['count']);
      }
      return sum;
    }

    return Container(
      color: Color(0xff301B4A),
      child: ListView.builder(
          itemCount: suggestionList == null ? 0 : suggestionList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff251539),
                  borderRadius: BorderRadius.circular(18.0),
                ),
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
                                    suggestionList[index]['name'].toString(),
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 8.0,),
                                  AutoSizeText(
                                    suggestionList[index]['count'].toString(),
                                    minFontSize: 28,
                                    style: TextStyle(
                                      fontFamily: 'Circular',
                                      color: Colors.redAccent,
                                    ),
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
                          child: CircularPercentIndicator(
                            percent: (suggestionList[index]['count']/sums()),
                            progressColor: Colors.redAccent,
                            backgroundColor: Color(0xff5E4D72),
                            animation: true,
                            lineWidth: 6,
                            radius: 80,
                            circularStrokeCap: CircularStrokeCap.round,
                            addAutomaticKeepAlive: true,
                            center: Text((suggestionList[index]['count']/sums()*100).toStringAsPrecision(3)+'%',
                              style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

//
