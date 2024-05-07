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

//给按钮CounterTwo追踪的接口counterProviderTwo
final counterProviderTwo = StateNotifierProvider<CounterTwo, int>((ref) {
  return CounterTwo();
});

//添加一个按钮CounterTwo
class CounterTwo extends StateNotifier<int> {
  CounterTwo() : super(0);
  void increment() => state++;
}

//StatelessWidget = ConsumerWidget
//StatefulWidget + State = ConsumerStatefulWidget + ConsumerState
class FlutterRiverpodHelloworld extends ConsumerWidget {
  const FlutterRiverpodHelloworld({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //追踪Counter
    final count = ref.watch(counterProvider);

    //追踪CounterTwo
    final countTwo = ref.watch(counterProviderTwo);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterRiverpod Helloworld'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Counter
            Text(
              'Count:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            //CounterTwo
            const Text(
              'CountTwo:',
            ),
            Text(
              '$countTwo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              child: const Text("CounterTwo Increment"),
              onPressed: () {
                ref.read(counterProviderTwo.notifier).increment();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        tooltip: 'Counter Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
