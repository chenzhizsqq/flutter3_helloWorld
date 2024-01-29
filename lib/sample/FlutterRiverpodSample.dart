import 'package:flutter/material.dart';
import 'FlutterRiverpodDir/FlutterRiverpodHelloworld.dart';
import 'FlutterRiverpodDir/NoConsumerWidget.dart';
import 'FlutterRiverpodDir/ConsumerStatefulWidgetSample.dart';
import 'FlutterRiverpodDir/RiverpodRefreshSample.dart';

class FlutterRiverpodSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //https://yamochun-dev.cloud/dev/flutter/about-riverpod/
            ElevatedButton(
              child: Text("FlutterRiverpodHelloworld"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlutterRiverpodHelloworld()));
              },
            ),

            ElevatedButton(
              child: Text("NoConsumerWidget"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoConsumerWidget()));
              },
            ),

            //ConsumerStatefulWidget Sample
            ElevatedButton(
              child: Text(
                  "ConsumerStatefulWidget Sample \n StatefulWidget + State = ConsumerStatefulWidget + ConsumerState"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConsumerStatefulWidgetSample()));
              },
            ),

            //https://riverpod.dev/zh-hans/docs/case_studies/pull_to_refresh
            //RiverpodRefresh Sample
            ElevatedButton(
              child: Text(
                  "RiverpodRefresh Sample \n 一定要运行一下的命令行，不然Freezed不能够使用!!!! \n flutter pub run build_runner build "),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RiverpodRefreshSample()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
