import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
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
              padding: EdgeInsets.only(top: 32),
              child: Text('Json Serializable - get json'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    final jsonString =
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
                  },
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
