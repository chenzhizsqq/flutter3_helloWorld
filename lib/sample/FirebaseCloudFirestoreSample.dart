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

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

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

            //2222
            ElevatedButton(
              child: Text('サブコレクション＋ドキュメント作成'),
              onPressed: () async {
                // サブコレクション内にドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_abc') // ドキュメントID << usersコレクション内のドキュメント
                    .collection('orders') // サブコレクションID
                    .doc('id_123') // ドキュメントID << サブコレクション内のドキュメント
                    .set({'price': 600, 'date': '9/13'}); // データ
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

            //3333 read data simple
            ElevatedButton(
              child: Text('ドキュメント一覧取得 read data simple'),
              onPressed: () async {
                // コレクション内のドキュメント一覧を取得
                var db = FirebaseFirestore.instance;

                await db.collection("users").get().then((event) {
                  for (var doc in event.docs) {
                    print("${doc.id} => ${doc.data()}");
                  }
                });
                // 取得したドキュメント一覧をUIに反映
                // setState(() {
                //   documentList = snapshot.documents;
                // });
              },
            ),

            /*
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

            //4444
            ElevatedButton(
              child: Text('ドキュメントを指定して取得'),
              onPressed: () async {
                // コレクションIDとドキュメントIDを指定して取得
                final document = await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_123')
                    .get();
                // 取得したドキュメントの情報をUIに反映
                setState(() {
                  orderDocumentInfo =
                      '${document['date']} ${document['price']}円';
                });
              },
            ),
            // ドキュメントの情報を表示
            ListTile(title: Text(orderDocumentInfo)),

            //5555
            ElevatedButton(
              child: Text('ドキュメント更新'),
              onPressed: () async {
                // ドキュメント更新
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .update({'age': 41});
              },
            ),

            //6666
            ElevatedButton(
              child: Text('ドキュメント削除'),
              onPressed: () async {
                // ドキュメント削除
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_123')
                    .delete();
              },
            ),
          ],
        ),
      ),
    );
  }
}
