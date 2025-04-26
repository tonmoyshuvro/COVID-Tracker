import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;
  const WorldwidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
//        scrollDirection: Axis.horizontal,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            'Tests',
                            style: TextStyle(color: Colors.orange),
                          ),
                          SizedBox(height: 8.0,),
                          AutoSizeText(
                            worldData['test']['total'].toString(),
                            minFontSize: 28,
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2.0,),
                          AutoSizeText(
                            'Last 24 Hours: ' +
                                worldData['test']['last24'].toString(),
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/virus.png',
                        fit: BoxFit.contain,
                        height: 48.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 1,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
//        scrollDirection: Axis.horizontal,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            'Total Cases',
                            style: TextStyle(color: Colors.blue),
                          ),
                          SizedBox(height: 8.0,),
                          AutoSizeText(
                            worldData['positive']['total'].toString(),
                            minFontSize: 28,
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2.0,),
                          AutoSizeText(
                            'Last 24 Hours: ' +
                                worldData['positive']['last24'].toString(),
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),

                        ],
                      ),
                      Image.asset(
                        'assets/fever.png',
                        fit: BoxFit.contain,
                        height: 48.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 1,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
//        scrollDirection: Axis.horizontal,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            'Recovered',
                            style: TextStyle(color: Colors.tealAccent.shade700),
                          ),
                          SizedBox(height: 8.0),
                          AutoSizeText(
                            worldData['recovered']['total'].toString(),
                            minFontSize: 28,
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2.0,),
                          AutoSizeText(
                            'Last 24 Hours: ' +
                                worldData['recovered']['last24'].toString(),
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),

                        ],
                      ),
                      Image.asset(
                        'assets/heart.png',
                        fit: BoxFit.contain,
                        height: 48.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 1,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
//        scrollDirection: Axis.horizontal,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            'Deaths',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          AutoSizeText(
                            worldData['death']['total'].toString(),
                            minFontSize: 28,
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          AutoSizeText(
                            'Last 24 Hours: ' +
                                worldData['death']['last24'].toString(),
                            style: TextStyle(
                              fontFamily: 'Circular',
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/danger.png',
                        fit: BoxFit.contain,
                        height: 48.0,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 1,
        ),
      ],
    );
  }
}
