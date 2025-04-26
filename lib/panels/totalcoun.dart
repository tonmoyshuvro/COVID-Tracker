import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_tracker/pages/mostdetails.dart';

class Total extends StatefulWidget {
  @override
  _TotalState createState() => _TotalState();
}

class _TotalState extends State<Total> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(72),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end:
          Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [Color(0xFF89216B), Color(0xFFDA4453)], // whitish to gray),
        ),
      ),
      child: FlatButton(
        child: Text('See all',
        style: TextStyle(color: Colors.white),),
        onPressed: ()
        {
          setState(() {
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
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0),
                      ).animate(animation),
                      //).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut)),
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return CountryPage();
                  }),
            );
          });
        },
      ),
    );
  }
}
