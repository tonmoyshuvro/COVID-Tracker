import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:covid_tracker/pages/search1.dart';

class districtData extends StatefulWidget {

  @override
  _districtDataState createState() => _districtDataState();
}

class _districtDataState extends State<districtData> {
  Map countryData;
  List list;
  ScrollController _controller = ScrollController();
  fetchCountryData() async {
    http.Response response =
        await http.get('http://covid19-bd-vu.herokuapp.com/district');
    setState(() {
      countryData = json.decode(response.body);
      list = countryData['data'];
    });
  }

  Future fetchData() async{
    fetchCountryData();
    print('fetchData called');
  }

  int sums()
  {
    int sum = 0;
    for (int i = 0; i<68; i++)
      {
        sum = sum + (list[i]['count']);
      }
    return sum;
  }

  double per(int no)
  {
    return (list[no]['count']/sums())*100;
  }
  double pers(int no)
  {
    return (list[no]['count']/sums());
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
      appBar:AppBar(
        title: Text('District-wise Cases'),
        backgroundColor: Color(0xff251539),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              if(list.length!=0)
                  showSearch(context: context, delegate: Search1(list));

            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
            child: list == null
                ? Center(
              child: CircularProgressIndicator(),
            )
                : DraggableScrollbar.semicircle(
              controller: _controller,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    itemCount: 68,
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
                                          list[index]['name'].toString(),
                                          style: TextStyle(color: Colors.white,
                                          fontSize: 16),
                                        ),
                                        SizedBox(height: 8.0,),
                                        AutoSizeText(
                                          list[index]['count'].toString(),
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
                                  percent: pers(index),
                                  progressColor: Colors.redAccent,
                                  backgroundColor: Color(0xff5E4D72),
                                  animation: true,
                                  lineWidth: 6,
                                  radius: 80,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  addAutomaticKeepAlive: true,
                                  center: Text(per(index).toStringAsPrecision(3)+'%',
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
              },
            ),
                ),
      ),
    );
  }
}
