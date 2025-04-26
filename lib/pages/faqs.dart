import 'package:flutter/material.dart';
import 'package:covid_tracker/datasource.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff301B4A),
      appBar: AppBar(
        backgroundColor: Color(0xff251539),
        title: Text(
          'FAQs',
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: DataSource.questionAnswers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                color: Colors.white,),
                title: Text(
                  DataSource.questionAnswers[index]['question'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top:16,bottom: 12),
                    child: Text(
                      DataSource.questionAnswers[index]['answer'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
