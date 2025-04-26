import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Covidtest extends StatefulWidget {
  @override
  _CovidtestState createState() => _CovidtestState();
}

class _CovidtestState extends State<Covidtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff251539),
        title: Text(
          'Covid Test',
        ),
      ),
      body: WebView(
        initialUrl: 'https://coronachecker.dh.health/?fbclid=IwAR2pZJa2gweHfctXTL3ic2gF-hYrp6h9h8CAGhF_1Tnz4R1C1GVVLOvy7vo',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
