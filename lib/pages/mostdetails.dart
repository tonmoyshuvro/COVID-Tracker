import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:covid_tracker/pages/search.dart';


class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  ScrollController _controller = ScrollController();

  fetchCountryData() async {
    http.Response response =
    await http.get('https://disease.sh/v3/covid-19/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  Future fetchData() async{
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff301B4A),
      appBar: AppBar(
          backgroundColor: Color(0xff251539),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                if(countryData.length!=0)
                  showSearch(context: context, delegate: Search(countryData));
              });
            },
          ),
        ],
        title: Text('Country-wise Cases'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: countryData == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : DraggableScrollbar.semicircle(
          controller: _controller,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: _controller,
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
                                    countryData[index]['country'].toString(),
                                    style: TextStyle(color: Colors.white,
                                    fontSize: 16),
                                  ),
                                  SizedBox(height: 8.0,),
                                  AutoSizeText(
                                    countryData[index]['cases'].toString(),
                                    minFontSize: 28,
                                    style: TextStyle(
                                      fontFamily: 'Circular',
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  SizedBox(height: 8.0,),
                                  AutoSizeText(
                                    'Recovered: ' + countryData[index]['recovered'].toString(),
                                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                                  ),
                                  SizedBox(height: 8.0,),
                                  AutoSizeText(
                                    'Deaths: ' + countryData[index]['deaths'].toString(),
                                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
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
                            backgroundImage: NetworkImage(countryData[index]['countryInfo']['flag'].toString()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          },
          itemCount: countryData == null ? 0 : countryData.length,
        ),
            ),
      ),
    );
  }
}