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
import 'sample/SharedPreferencesSample.dart';
import 'sample/NavigatorSample.dart';
import 'sample/FlutterRiverpodSample.dart';
import 'sample/JsonSerializableDir/JsonSerializableSample.dart';
import 'sample/RestApi.dart';
import 'sample/HooksRiverpod/HooksRiverpodSampleMenu.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

//void main() => runApp(const MyApp());
//

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //判断是否android虚拟机
  if (USE_DATABASE_EMULATOR) {
    FirebaseDatabase.instance.useDatabaseEmulator(emulatorHost, emulatorPort);
  }

  runApp(
    // 为了安装 Riverpod，我们需要将这个小组件添加到所有的小组件之上。
    // 它不应该在 “MyApp” 内部，而是作为 “runApp” 的直接参数。
    const ProviderScope(
      child: MyApp(),
    ),
  );
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

      //打开menu
      home: const SampleMenu(),
    );
  }
}

class SampleMenu extends StatelessWidget {
  const SampleMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
      ),
      body: ListView(children: <Widget>[
        ElevatedButton(
          child: const Text("MyHomePage"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Flutter Demo Home Page')));
          },
        ),

        //RestApi.dart
        ElevatedButton(
          child: const Text("Rest Api Sample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text(
                              'Rest Api Sample',
                            ),
                            centerTitle: true,
                          ),
                          body: const RestApi(title: 'Rest Api'),
                        )));
          },
        ),

        //JsonSerializableSample.dart
        ElevatedButton(
          child: const Text("Json Serializable Sample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text(
                              'Json Serializable Sample',
                            ),
                            centerTitle: true,
                          ),
                          body: JsonSerializableSample(),
                        )));
          },
        ),

        //HooksRiverpodSample.dart
        ElevatedButton(
          child: const Text("Hooks Riverpod Sample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text(
                              'Hooks Riverpod Sample',
                            ),
                            centerTitle: true,
                          ),
                          body: const HooksRiverpodSampleMenu(),
                        )));
          },
        ),

        //FlutterRiverpodSample.dart
        ElevatedButton(
          child: const Text("FlutterRiverpodSample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text(
                              'FlutterRiverpod Sample',
                            ),
                            centerTitle: true,
                          ),
                          body: FlutterRiverpodSample(),
                        )));
          },
        ),

        ElevatedButton(
          child: const Text("Firebase Sample Login"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const FirebaseSample(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text(
              "FirebaseCloudFirestore Sample       - Firebase Firestore data"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: FirebaseCloudFirestoreSample(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text("FirebaseFirestore use Stream Sample - 能够实时更新数据"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: FirebaseFirestoreStream(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text(
              "FirebaseRealtimeDatabaseSample       - Firebase Realtime json"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FirebaseRealtimeDatabaseSample()));
          },
        ),
        ElevatedButton(
          child: const Text(
              "DioSample Http请求库-dio  人气较高的dio库  60%:暂时例子还没有完成，因为在这个lib对于web需要设定 \ndio 一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时等。"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DioSample()));
          },
        ),

        //https://zenn.dev/joo_hashi/articles/22e7f7d0897645
        ElevatedButton(
          child: const Text("shared_preferences"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SharedPreferencesSample()));
          },
        ),

        //https://codezine.jp/article/detail/14271
        //https://qiita.com/deodeo_mg/items/b2869710ffadaf42f816
        ElevatedButton(
          child: const Text("Navigator sample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigatorSample()));
          },
        ),

        ElevatedButton(
          child: const Text("GridView sample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const GridViewSample(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text("ListViewSample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const ListViewSample(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text("ListView ListTile Sample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const ListViewListTile(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text("导航栏 TabBarPage Sample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TabBarPageSample()));
          },
        ),
        ElevatedButton(
          child: const Text("滚动组件刷新"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListViewPage()));
          },
        ),

        //https://flutter.cn/docs/cookbook/navigation/navigation-basics
        ElevatedButton(
          child: const Text("导航到一个新页面和返回 ElevatedButton"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FirstRoute()));
          },
        ),
        ElevatedButton(
          child: const Text("导航到一个新页面和返回 CupertinoButton"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const FirstRouteCupertinoButton(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text("FirstScreenApp"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FirstScreenApp()));
          },
        ),
        ElevatedButton(
          child: const Text("StateSample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: StateSample(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text("ButtonSimple"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: const ButtonSimple(),
                        )));
          },
        ),
        ElevatedButton(
          child: const Text(
              "按钮Button点击后，并通过text的输入。再ListPage追加数据  - FloatingActionButton2ListPageSample"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(),
                          body: FloatingActionButton2ListPageSample(),
                        )));
          },
        ),
      ]),
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          backgroundColor: const Color(0xffffffff),
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
