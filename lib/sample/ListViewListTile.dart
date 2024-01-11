import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewListTile extends StatelessWidget {
  const ListViewListTile({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'ListView ListTile';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
              tileColor: Colors.green,
              leading: Icon(Icons.account_circle),
              onTap: () {
                print('onTap');
              },
            ),
          ],
        ),
      ),
    );
  }
}
