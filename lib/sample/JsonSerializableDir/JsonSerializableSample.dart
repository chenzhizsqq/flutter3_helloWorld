import 'package:flutter/material.dart';

class JsonSerializableSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Serializable Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 32),
              child: Text('Json Serializable - get json'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
