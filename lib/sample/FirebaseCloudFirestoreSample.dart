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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}
