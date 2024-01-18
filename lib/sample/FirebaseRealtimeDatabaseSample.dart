import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb; //判断当前各平台　web or mobile

// Change to false to use live database instance.
// 定义是否用android虚拟机
const USE_DATABASE_EMULATOR = false;

// The port we've set the Firebase Database emulator to run on via the
// `firebase.json` configuration file.
const emulatorPort = 9000;

// Android device emulators consider localhost of the host machine as 10.0.2.2
// so let's use that if running on Android.
final emulatorHost =
    (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
        ? '10.0.2.2'
        : 'localhost';

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
  late StreamSubscription<DatabaseEvent> _counterSubscription;
  late StreamSubscription<DatabaseEvent> _messagesSubscription;

  int _counter = 0;
  String _kTestKey = 'Hello';
  String _kTestValue = 'world!';
  FirebaseException? _error;

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

    if (!kIsWeb) {
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(10000000);
    }

    if (!kIsWeb) {
      await _counterRef.keepSynced(true);
    }

    setState(() {
      initialized = true;
    });
    print("init() end");
  }

  Future<void> _increment() async {
    await _counterRef.set(ServerValue.increment(1));

    await _messagesRef
        .push()
        .set(<String, String>{_kTestKey: '$_kTestValue $_counter'});
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
            Text(' Realtime Database - 实时数据库 - 规则 一定要把rule设定好'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
