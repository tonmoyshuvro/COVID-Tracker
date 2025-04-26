import 'package:flutter/material.dart';
import 'homepage.dart';
import 'datasource.dart';
import 'package:flutter/services.dart' ;

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: primaryColor,
      ),
      home: HomePage(),
    );
  }
}
