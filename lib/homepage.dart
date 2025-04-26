import 'dart:convert';
import 'package:covid_tracker/panels/worldwidepanel.dart';
import 'package:covid_tracker/panels/mostaffected.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid_tracker/panels/infoPanel.dart';
import 'package:covid_tracker/panels/call.dart';
import 'package:covid_tracker/panels/bang.dart';
import 'package:covid_tracker/panels/infodis.dart';
import 'package:covid_tracker/panels/totalcoun.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get('http://covid19-bd-vu.herokuapp.com/stats');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get("https://disease.sh/v3/covid-19/countries?sort=deaths");
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchCountryData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff301B4A),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: RichText(
            text: TextSpan(
                text: 'COVID Tracker',
                style: Theme.of(context)
                    .textTheme
                    .headline6.copyWith(color: Colors.white)
            ),
          ),
        ),
        backgroundColor: Color(0xff251539),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: fetchData,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 28,
                ),
                CallPanel(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 28, 0, 12),
                      child: RichText(
                        text: TextSpan(
                            text: 'In Bangladesh',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(16, 36, 16, 12),
//                    child: Text(
//                      'Regional',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                  ),
                  ],
                ),
                worldData == null
                    ? CircularProgressIndicator()
                    : WorldwidePanel(worldData: worldData),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 28, 0, 12),
                      child: RichText(
                        text: TextSpan(
                            text: 'District-wise Cases',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Infodis(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 28, 0, 12),
                      child: RichText(
                        text: TextSpan(
                            text: 'COVID-19 Test',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Bang(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 28, 0, 22),
                      child: RichText(
                        text: TextSpan(
                            text: 'Most Affected',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 36, 16, 22),
                      child: Total(),
                    )
                  ],
                ),
                countryData == null
                    ? CircularProgressIndicator()
                    : MostAffectedPanel(
                        countryData: countryData,
                      ),
                SizedBox(
                  height: 28,
                ),
                InfoPanel(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
