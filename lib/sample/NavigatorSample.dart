import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'DioSample.dart';

class NavigatorSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            TextButton(
              child: Text("1ページ目に遷移する"),
              onPressed: () async {
                // （1） 指定した画面に遷移する
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        // （2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => FirstPage()));
                print("FirstPage push result: $result");
              },
            ),
          ])),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ページ(1)")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextButton(
                child: Text("最初のページに戻る(pop)"),
                // （1） 前の画面に戻る
                onPressed: () {
                  //Navigator.pop(context);

                  Navigator.of(context).pop("FirstPage から　body onPressed() 渡す");
                },
              ),
              TextButton(
                child: Text("2ページ目に遷移する\n(ホームに戻るpushReplacement)"),
                // SecondPage
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ));
                },
              ),
              TextButton(
                child: Text("NavigationButtonScreenに遷移する"),
                onPressed: () {
                  // （1） 指定した画面に遷移する
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) => NavigationButtonScreen()));
                },
              ),
            ])));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ページ(2)")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextButton(
                child: Text("ホームに戻る"),
                // （1） ホームに戻る
                // onPressed: () {
                //   Navigator.pop(context);
                // },
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ])));
  }
}

class NavigationButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("NavigationButtonScreen"),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop("NavigationButtonScreenから渡す");
            },
            child: Icon(Icons.arrow_back_ios),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigatorPushScreen(),
                  ),
                );
                print("Navigator push result: $result");
              },
              child: Text("Navigator push"),
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.pushReplacement(
                  // ・・・②
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigatorPushReplacementScreen(),
                  ),
                );
                print("Navigator pushReplacement result: $result");
              },
              child: Text("Navigator pushReplacement"),
            ),

            //NavigatorPopUntilScreen
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.pushReplacement(
                  // ・・・②
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigatorPopUntilScreen(),
                  ),
                );
                print("NavigatorPopUntilScreen result: $result");
              },
              child: Text("Navigator PopUntil"),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorPushScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavigatorPushScreen"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop("NavigatorPushScreen から　leading onTap() 渡す");
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      // body: Center(
      //   child: Text("Navigator.pushを使用"),
      // ),

      body: Center(
        child: TextButton(
          child: Text(
              "Navigator.pushを使用 :\n Navigator.pop(context) \n NavigationButtonScreen -> NavigationButtonScreen"),
          // ホーム画面に渡せない
          onPressed: () {
            Navigator.of(context)
                .pop("NavigatorPushScreen から　body onPressed() 渡す");
          },
        ),
      ),
    );
  }
}

class NavigatorPushReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavigatorPushReplacementScreen"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop("NavigatorPushReplacementScreen から　leading onTap() 渡す");
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: TextButton(
          child: Text(
              "pushReplacement after :\n Navigator.pop(context) \n NavigatorPushReplacementScreen -> ページ(1)"),
          // ホーム画面に渡せない
          onPressed: () {
            Navigator.of(context)
                .pop("NavigatorPushReplacementScreen から　body onPressed() 渡す");
          },
        ),
      ),
    );
  }
}

class NavigatorPopUntilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.PopUntilを使用"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop("NavigatorPopUntilScreen から　leading onTap() 渡す");
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: TextButton(
          child: Text("PopUntilホームに戻る :\n 最初のページに戻る(pop)"),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }
}
