import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigatorSample extends StatelessWidget {
  const NavigatorSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            TextButton(
              child: const Text("1ページ目に遷移する"),
              onPressed: () async {
                // （1） 指定した画面に遷移する
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        // （2） 実際に表示するページ(ウィジェット)を指定する
                        builder: (context) => const FirstPage()));
                if (kDebugMode) {
                  print("FirstPage push result: $result");
                }
              },
            ),
          ])),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ページ(1)")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextButton(
                child: const Text("最初のページに戻る(pop)"),
                // （1） 前の画面に戻る
                onPressed: () {
                  //Navigator.pop(context);

                  Navigator.of(context).pop("FirstPage から　body onPressed() 渡す");
                },
              ),
              TextButton(
                child: const Text("2ページ目に遷移する\n(ホームに戻るpushReplacement)"),
                // SecondPage
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ));
                },
              ),
              ElevatedButton(
                child: const Text("NavigationButtonScreenに遷移する"),
                onPressed: () {
                  // （1） 指定した画面に遷移する
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // （2） 実際に表示するページ(ウィジェット)を指定する
                          builder: (context) =>
                              const NavigationButtonScreen()));
                },
              ),
            ])));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ページ(2)")),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextButton(
                child: const Text("ホームに戻る"),
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
  const NavigationButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("NavigationButtonScreen"),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop("NavigationButtonScreenから渡す");
            },
            child: const Icon(Icons.arrow_back_ios),
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
                    builder: (context) => const NavigatorPushScreen(),
                  ),
                );
                if (kDebugMode) {
                  print("Navigator push result: $result");
                }
              },
              child: const Text("Navigator push"),
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.pushReplacement(
                  // ・・・②
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const NavigatorPushReplacementScreen(),
                  ),
                );
                if (kDebugMode) {
                  print("Navigator pushReplacement result: $result");
                }
              },
              child: const Text("Navigator pushReplacement"),
            ),

            //NavigatorPopUntilScreen
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.pushReplacement(
                  // ・・・②
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigatorPopUntilScreen(),
                  ),
                );
                if (kDebugMode) {
                  print("NavigatorPopUntilScreen result: $result");
                }
              },
              child: const Text("Navigator PopUntil"),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigatorPushScreen extends StatelessWidget {
  const NavigatorPushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NavigatorPushScreen"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop("NavigatorPushScreen から　leading onTap() 渡す");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      // body: Center(
      //   child: Text("Navigator.pushを使用"),
      // ),

      body: Center(
        child: TextButton(
          child: const Text(
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
  const NavigatorPushReplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NavigatorPushReplacementScreen"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop("NavigatorPushReplacementScreen から　leading onTap() 渡す");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: TextButton(
          child: const Text(
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
  const NavigatorPopUntilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator.PopUntilを使用"),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop("NavigatorPopUntilScreen から　leading onTap() 渡す");
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: TextButton(
          child: const Text("PopUntilホームに戻る :\n 最初のページに戻る(pop)"),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }
}
