import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseCloudFirestoreSample extends StatefulWidget {
  @override
  _FirebaseCloudFirestoreSampleState createState() =>
      _FirebaseCloudFirestoreSampleState();
}

class _FirebaseCloudFirestoreSampleState
    extends State<FirebaseCloudFirestoreSample> {
  List<DocumentSnapshot> documentList = []; // 作成したドキュメント一覧

  // 指定したドキュメントの情報
  String orderDocumentInfo = '';

  // コレクション内のドキュメント一覧を取得
  void getInfo() async {
    var db = FirebaseFirestore.instance;

    await db.collection("users").doc('id_abc').collection('orders').get().then(
      (querySnapshot) {
        print("Successfully completed");
        var temp = "";
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          temp = temp + '${docSnapshot.data()}';
        }
        setState(() {
          orderDocumentInfo = temp;
        });
        print('orderDocumentInfo:$orderDocumentInfo');
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            //11111
            ElevatedButton(
              child: Text('コレクション＋ドキュメント作成'),
              onPressed: () async {
                // ドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_abc') // ドキュメントID
                    .set({'name': '鈴木', 'age': 40}); // データ
              },
            ),
            ElevatedButton(
              child: Text('insert bbb'),
              onPressed: () async {
                // ドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_bbb') // ドキュメントID
                    .set({'name': 'name_bbb', 'age': 222}); // データ
              },
            ),
            ElevatedButton(
              child: Text('insert ccc'),
              onPressed: () async {
                // ドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_ccc') // ドキュメントID
                    .set({'name': 'name_ccc', 'age': 333}); // データ
              },
            ),

            //2222
            ElevatedButton(
              child: Text('ドキュメント作成 abc 123'),
              onPressed: () async {
                // サブコレクション内にドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_abc') // ドキュメントID << usersコレクション内のドキュメント
                    .collection('orders') // サブコレクションID
                    .doc('id_123') // ドキュメントID << サブコレクション内のドキュメント
                    .set({'price': 600, 'date': '9/13'}); // データ

                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),
            ElevatedButton(
              child: Text('abc 111'),
              onPressed: () async {
                // サブコレクション内にドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_abc') // ドキュメントID << usersコレクション内のドキュメント
                    .collection('orders') // サブコレクションID
                    .doc('id_111') // ドキュメントID << サブコレクション内のドキュメント
                    .set({'price': 111, 'date': '9/13'}); // データ

                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),
            ElevatedButton(
              child: Text('abc 222'),
              onPressed: () async {
                // サブコレクション内にドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_abc') // ドキュメントID << usersコレクション内のドキュメント
                    .collection('orders') // サブコレクションID
                    .doc('id_222') // ドキュメントID << サブコレクション内のドキュメント
                    .set({'price': 222, 'date': '9/13'}); // データ

                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),
            ElevatedButton(
              child: Text('abc 333'),
              onPressed: () async {
                // サブコレクション内にドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_abc') // ドキュメントID << usersコレクション内のドキュメント
                    .collection('orders') // サブコレクションID
                    .doc('id_333') // ドキュメントID << サブコレクション内のドキュメント
                    .set({'price': 333, 'date': '9/13'}); // データ

                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),

            //3333
            /*
            ElevatedButton(
              child: Text('ドキュメント一覧取得'),
              onPressed: () async {
                // コレクション内のドキュメント一覧を取得
                final snapshot =
                    await FirebaseFirestore.instance.collection('users').get();
                // 取得したドキュメント一覧をUIに反映
                setState(() {
                  documentList = snapshot.documents;
                });
              },
            ),
            // コレクション内のドキュメント一覧を表示
            Column(
              children: documentList.map((document) {
                return ListTile(
                  title: Text('${document['name']}さん'),
                  subtitle: Text('${document['age']}歳'),
                );
              }).toList(),
            ),
            */

            ElevatedButton(
              child: Text('get id_abc all orders '),
              onPressed: () async {
                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),

            //4444
            ElevatedButton(
              child: Text('ドキュメントを指定して取得'),
              onPressed: () async {
                // コレクションIDとドキュメントIDを指定して取得
                final document = await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_111')
                    .get();
                // 取得したドキュメントの情報をUIに反映
                setState(() {
                  orderDocumentInfo =
                      '${document['date']} ${document['price']}円';
                });

                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),

            //5555
            ElevatedButton(
              child: Text('ドキュメント更新'),
              onPressed: () async {
                // ドキュメント更新
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_111')
                    .update({'price': 000, 'date': '0/0'});

                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),

            //6666
            ElevatedButton(
              child: Text('ドキュメント削除 abc 123'),
              onPressed: () async {
                // ドキュメント削除
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_123')
                    .delete();

                //コレクション内のドキュメント一覧を取得
                getInfo();
              },
            ),

            // ドキュメントの情報を表示
            ListTile(title: Text(orderDocumentInfo)),
          ],
        ),
      ),
    );
  }
}
