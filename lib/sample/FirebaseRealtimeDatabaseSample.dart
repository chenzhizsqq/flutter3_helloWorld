import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseRealtimeDatabaseSample extends StatefulWidget {
  @override
  _FirebaseRealtimeDatabaseSampleState createState() =>
      _FirebaseRealtimeDatabaseSampleState();
}

class _FirebaseRealtimeDatabaseSampleState
    extends State<FirebaseRealtimeDatabaseSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Firebase Realtime Database Sample'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Firebase Realtime Database Sample'),
          ],
        ),
      ),
    );
  }
}
