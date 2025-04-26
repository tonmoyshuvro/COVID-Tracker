import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_tracker/pages/faqs.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end:
                Alignment(0.8, 0.0),
                colors: [Color(0xff5222A7),Color(0xFFC057D1)],
              )
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 600),
                      transitionsBuilder:
                          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuart);
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(-1.0, 0.0),
                                end: const Offset(0.0, 0.0),
                              ).animate(animation),
                              //).animate(CurvedAnimation(parent: animation, curve: Curves.elasticInOut)),
                              child: child,
                        );
                      },
                      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                        return FAQ();
                      }),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(6),
                child: ListTile(
                  title: Text(
                    'FAQs',
                    style: (TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end:
                  Alignment(0.8, 0.0),
                  colors: [Color(0xFF89216B),Color(0xFFDA4453)],
                )
            ),
            child: FlatButton(
              onPressed: () {
                launch(
                    'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
              },
              child: Padding(
                padding: EdgeInsets.all(6),
                child: ListTile(
                  title: Text(
                    'Myth Busters',
                    style: (TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
