import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;
  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff251539),
                borderRadius: BorderRadius.circular(18.0),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
//                  direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
//                spacing: 8,
                  children: <Widget>[
                    Image.network(
                      countryData[index]['countryInfo']['flag'].toString(),
                      height: 24,
                    ),
                    Text(
                      countryData[index]['country'].toString(),
                      style: TextStyle(fontSize: 18,
                      color: Colors.white),
                    ),
                    Text(
                      'Deaths: ' + countryData[index]['deaths'].toString(),
                      style:
                      TextStyle(color: Colors.redAccent,
                      fontSize: 16),
                    ),
                    Text(
                      'Cases: ' + countryData[index]['cases'].toString(),
                      style:
                      TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}