import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class FirebaseRealtimeDatabaseSample extends StatefulWidget {
  @override
  _FirebaseRealtimeDatabaseSampleState createState() =>
      _FirebaseRealtimeDatabaseSampleState();
}

class _FirebaseRealtimeDatabaseSampleState
    extends State<FirebaseRealtimeDatabaseSample> {
  bool initialized = false;
  late DatabaseReference _counterRef;
  late DatabaseReference _messagesRef;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _counterRef = FirebaseDatabase.instance.ref('counter');

    final database = FirebaseDatabase.instance;

    _messagesRef = database.ref('messages');

    database.setLoggingEnabled(false);

    setState(() {
      initialized = true;
    });
    print("init() end");
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) return Container();

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
