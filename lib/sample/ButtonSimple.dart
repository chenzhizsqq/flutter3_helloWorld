import 'package:flutter/material.dart';

//https://www.flutter-study.dev/widgets/button-widget
class ButtonSimple extends StatelessWidget {
  const ButtonSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 32),
              child: const Text('IconButton'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up),
                ),
                IconButton(
                  color: Colors.pink,
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                ),
                IconButton(
                  iconSize: 64,
                  onPressed: () {},
                  icon: Icon(Icons.flight),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 32),
              child: const Text('アイコン＋テキスト'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Good'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite, color: Colors.pink),
                  label: const Text('Like'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.flight),
                  label: const Text('Flight'),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
