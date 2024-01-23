import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sample/GridViewSample.dart';
import 'sample/ListViewPage.dart';
import 'sample/ListViewListTile.dart';
import 'sample/FirstScreenApp.dart';
import 'sample/ListViewSample.dart';
import 'sample/TabBarPageSample.dart';
import 'sample/FirstRoute.dart';
import 'sample/FirstRouteCupertinoButton.dart';
import 'sample/StateSample.dart';
import 'sample/ButtonSimple.dart';
import 'sample/FloatingActionButton2ListPageSample.dart';
import 'sample/FirebaseSample.dart';
import 'sample/FirebaseCloudFirestoreSample.dart';
import 'sample/FirebaseFirestoreStream.dart';
import 'sample/FirebaseRealtimeDatabaseSample.dart';
import 'sample/DioSample.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

//void main() => runApp(const MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD47XXUdgweBCLi3ZOCVE-MJVY8QsQNyeQ",
      authDomain: "fluttertest-15e1a.firebaseapp.com",
      projectId: "fluttertest-15e1a",
      storageBucket: "fluttertest-15e1a.appspot.com",
      messagingSenderId: "868931261169",
      appId: "1:868931261169:web:130ff405f609000002cf50",
      databaseURL:
          "https://fluttertest-15e1a-default-rtdb.asia-southeast1.firebasedatabase.app/",
    ),
  );

  //判断是否android虚拟机
  if (USE_DATABASE_EMULATOR) {
    FirebaseDatabase.instance.useDatabaseEmulator(emulatorHost, emulatorPort);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //testMyself
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),

      //GridView sample
      //home: const GridViewSample(),

      //ListView Sample
      //home: const ListViewSample(),

      //ListView ListTile Sample
      //home: const ListViewListTile(),

      //导航栏 TabBarPage Sample
      //home: const TabBarPageSample(),

      //滚动组件刷新
      //home: const ListViewPage(),

      //导航到一个新页面和返回 ElevatedButton
      //https://flutter.cn/docs/cookbook/navigation/navigation-basics
      //home: const FirstRoute(),

      //导航到一个新页面和返回 CupertinoButton
      //home: const FirstRouteCupertinoButton(),

      //FirstScreenApp
      //home: FirstScreenApp(),

      //StateSample
      //home: StateSample(),

      //ButtonSimple
      //home: ButtonSimple(),

      //按钮Button点击后，并通过text的输入。再ListPage追加数据  - FloatingActionButton2ListPageSample
      //home: FloatingActionButton2ListPageSample(),

      //Firebase Sample
      //home: FirebaseSample(),

      //FirebaseCloudFirestore Sample       - Firebase Firestore data
      //home: FirebaseCloudFirestoreSample(),

      //FirebaseFirestore use Stream Sample - 能够实时更新数据
      /*home: Scaffold(
        appBar: AppBar(),
        body: FirebaseFirestoreStream(),
      ),*/

      //FirebaseRealtimeDatabaseSample       - Firebase Realtime json
      //home: FirebaseRealtimeDatabaseSample(),

      //DioSample Http请求库-dio  人气较高的dio库  60%:暂时例子还没有完成，因为在这个lib对于web需要设定
      //dio 一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时等。
      home: DioSample(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Row 1'),
            Text('Row 2'),
            Text('Row 3'),
            Text('Row 4'),
            SizedBox(height: 20),
            DialogExample(),
          ],
        ),
      ),
    );
  }
}

//
class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          icon: const Icon(Icons.ac_unit_sharp), //图标
          title: const Text('AlertDialog'),
          titlePadding: const EdgeInsets.all(20),
          titleTextStyle: const TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          content: const Text('我是AlertDialog对话框'),
          contentPadding: const EdgeInsets.all(40),
          contentTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
          backgroundColor: Color(0xffffffff),
          elevation: 10.0,
          actionsOverflowDirection: VerticalDirection.down,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('确定')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('取消'))
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
