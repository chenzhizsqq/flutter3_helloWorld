import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter/cupertino.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

class ConsumerStatefulWidgetSample extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidgetSample> createState() =>
      _ConsumerStatefulWidgetSampleState();
}

class _ConsumerStatefulWidgetSampleState
    extends ConsumerState<ConsumerStatefulWidgetSample> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(counterProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Sample'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('Button tapped $count time${count == 1 ? '' : 's'}'),
              TextButton(
                child: Text("最初のページに戻る(pop)"),
                // （1） 前の画面に戻る
                onPressed: () {
                  //Navigator.pop(context);

                  Navigator.of(context).pop("FirstPage から　body onPressed() 渡す");
                },
              ),
            ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
