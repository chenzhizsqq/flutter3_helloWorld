import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//因为把StatelessWidget替换了ConsumerWidget，所以 WidgetRef ref不能够使用。所以监听数值的功能不能够使用
class NoConsumerWidget extends StatelessWidget {
  const NoConsumerWidget({super.key});

  @override
  Widget build(BuildContext context /*, WidgetRef ref*/) {
    /*final count = ref.watch(counterProvider);*/

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterRiverpod NoConsumerWidget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count:',
            ),
            /*Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),*/
            Text(
              '因为把StatelessWidget替换了ConsumerWidget，所以 WidgetRef ref不能够使用。所以监听数值的功能不能够使用',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*ref.read(counterProvider.notifier).increment();*/
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
