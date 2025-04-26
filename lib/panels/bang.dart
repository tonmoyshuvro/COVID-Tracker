import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_tracker/pages/covidtest.dart';

class Bang extends StatefulWidget {
  @override
  _BangState createState() => _BangState();
}

class _BangState extends State<Bang> {
  @override
  Widget build(BuildContext context) {
//    double height = MediaQuery.of(context).size.;
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
//        scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 600),
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.easeInOutQuart);
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: const Offset(0.0, 0.0),
                        ).animate(animation),
                        //).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut)),
                        child: child,
                      );
                    },
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Covidtest();
                    }),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment(
                      0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: [
                    Color(0xFF2F80ED),
                    Color(0xFF56CCF2)
                  ], // whitish to gray),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Test your COVID-19 Symptoms!\n',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  WidgetSpan(
                                    child: Container(height: 10,),
                                  ),
                                  TextSpan(
                                    text:
                                        'Feel sick? Had a fever over 7+ days? Begin test now with  \'Digital Healthcare Solutions\'.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Circular',
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/bang.png',
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: 1,
    );
  }
}
