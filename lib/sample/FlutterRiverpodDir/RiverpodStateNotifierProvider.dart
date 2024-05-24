import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() {
    //类似listen的样式
    state++;
  }
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

class RiverpodStateNotifierProvider extends ConsumerWidget {
  const RiverpodStateNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(child: Text('$count', style: const TextStyle(fontSize: 40))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
