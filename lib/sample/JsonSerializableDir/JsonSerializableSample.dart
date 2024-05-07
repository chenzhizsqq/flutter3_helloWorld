import 'package:flutter/material.dart';
import 'book.dart';
import 'dart:convert';

//https://qiita.com/kenta4327/items/d58a73cc85b944521ccc
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
              padding: const EdgeInsets.only(top: 32),
              child: const Text('Json Serializable - get json'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('把json信息展示出来'),
                  onPressed: () async {
                    const jsonString =
                        '{"id":123, "name":"THE BOOK", "price":1500, "author":{"id":999, "name":"sato"}}';

                    final jsonStringMap1 = jsonDecode(jsonString);
                    final author1 = Author(
                        id: jsonStringMap1['author']['id'],
                        name: jsonStringMap1['author']['name']);
                    final person1 = Book(
                        id: jsonStringMap1['id'],
                        name: jsonStringMap1['name'],
                        author: author1);
                    print('id: ${person1.id}');
                    print('name: ${person1.name}');
                    print('price: ${person1.price}');
                    print('author_id: ${person1.author?.id}');
                    print('author_name: ${person1.author?.name}');

                    var message = 'id: ${person1.id}\nname: ${person1.name}\nprice: ${person1.price}\nauthor_id: ${person1.author?.id}\nauthor_name: ${person1.author?.name}';

                    final String? selectedText = await showDialog<String>(
                        context: context,
                        builder: (_) {
                          return SimpleDialogSample(
                              title: jsonString, message: message);
                        });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleDialogSample extends StatelessWidget {
  final String title;
  final String message;
  const SimpleDialogSample({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      children: [
        SimpleDialogOption(
          child: Text(message),
        ),
      ],
    );
  }
}
