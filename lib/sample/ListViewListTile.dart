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
            const ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            const ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              title: const Text('title'),
              subtitle: const Text('subtitle'),
              tileColor: Colors.green,
              leading: const Icon(Icons.account_circle),
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
