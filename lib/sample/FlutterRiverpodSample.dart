import 'package:flutter/material.dart';
import 'FlutterRiverpodDir/FlutterRiverpodHelloworld.dart';
import 'FlutterRiverpodDir/NoConsumerWidget.dart';
import 'FlutterRiverpodDir/ConsumerStatefulWidgetSample.dart';
import 'FlutterRiverpodDir/RiverpodDiSample.dart';
import 'FlutterRiverpodDir/RiverpodStateNotifierProvider.dart';
import 'FlutterRiverpodDir/ProviderSample.dart';
import 'FlutterRiverpodDir/StreamProviderSample.dart';
import 'FlutterRiverpodDir/AutoDisposeSample.dart';

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
              child: const Text("FlutterRiverpodHelloworld"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FlutterRiverpodHelloworld()));
              },
            ),

            ElevatedButton(
              child: const Text("NoConsumerWidget"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoConsumerWidget()));
              },
            ),

            //ConsumerStatefulWidget Sample
            ElevatedButton(
              child: const Text(
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
              child: const Text("Riverpod 的整个APP的DI"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RiverpodDiSample()));
              },
            ),

            //RiverpodStateNotifierProvider
            ElevatedButton(
              child: const Text("Riverpod StateNotifierProvider"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RiverpodStateNotifierProvider()));
              },
            ),

            //
            ElevatedButton(
              child: const Text("Provider Sample"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProviderSample()));
              },
            ),

            //StreamProviderSample
            ElevatedButton(
              child: const Text("StreamProvider Sample"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StreamProviderSample()));
              },
            ),

            //AutoDisposeSample
            ElevatedButton(
              child: const Text(
                  "AutoDispose Sample\nAutoDispose是一种用于自动释放资源的Provider。"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AutoDisposeSample()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
