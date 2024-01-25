import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//StateNotifierProvider 是用来监听和暴露 StateNotifier （在 state_notifier 包中，Riverpod 又将其重新导出） 的 provider 。
final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

//StateProvider…変数 StateNotifier 的优势：本质上是不可变的。比较新旧状态并自动通知侦听器。
class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

//StatelessWidget = ConsumerWidget
//StatefulWidget + State = ConsumerStatefulWidget + ConsumerState
class FlutterRiverpodHelloworld extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterRiverpod Helloworld'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
