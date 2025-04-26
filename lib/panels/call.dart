import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CallPanel extends StatefulWidget {
  @override
  _CallPanelState createState() => _CallPanelState();
}

class _CallPanelState extends State<CallPanel> {
  String callinfo = 'Call 333 for COVID-19 support!';
  String washHand = 'Wash your hand frequently!';
  String mask = 'Wear mask when you\'re outside!';

  String sub1 = 'When you feel sick ASAP contact to Corona HelpDesk Hotline.';
  String sub2 = 'Use alcohol based hand rub or soap while washing hands.';
  String sub3 = 'Consider wearing a face mask when you have cough or sneezing.';

  String img1 = 'assets/1.png';
  String img3 = 'assets/2.png';
  String img2 = 'assets/3.png';

  Container todo(Color a, Color b, String c, String d, String e) {
    return Container(/**/
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [a, b], // whitish to gray),
        ),/**/
      ),
      child: Image.asset(
        e,
      ),
    );/**/
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          initialPage: 0,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(milliseconds: 3000),
          autoPlayCurve: Curves.easeOutSine,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: <Widget>[
          todo(Color(0xFF89216B), Color(0xFFDA4453), callinfo, sub1, img1),
          todo(Color(0xFF5222A7), Color(0xFFC057D1), washHand, sub2, img2),
          todo(Color(0xFF0E5965), Color(0xFF2AE8B4), mask, sub3, img3),
        ],
      ),
    );
  }
}
